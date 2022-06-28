import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:furniture_shopping_app/data/data_services/local_data_sources.dart';
import 'package:furniture_shopping_app/data/data_services/remote_data_sources.dart';
import 'package:furniture_shopping_app/data/models/user_data_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../core/error/failuer.dart';

abstract class AuthRepo {
  Future<Either<Failure, UserDataModel>> createNewUser(
      String email, String password, String name);
  Future<Either<Failure, UserDataModel>> logInUser(
      String email, String password);

  Future<Either<Failure, UserDataModel>> getUserData(String userId);

  Future<Either<Failure, void>> logOutUser();
}

class AuthRepoImpl extends AuthRepo {
  final LocalDataSourceImpl localDataSource;

  AuthRepoImpl({required this.localDataSource});
  @override
  Future<Either<Failure, UserDataModel>> createNewUser(
      String email, String password, String name) async {
    try {
      final newUser =
          await RemoteDataSourceImp.instance.createUser(email, password, name);
      return Right(newUser);
    } on FirebaseAuthException catch (e) {
      return Left(RegisterFailure.fromCode(e.code));
    }
  }

  @override
  Future<Either<Failure, UserDataModel>> logInUser(
      String email, String password) async {
    try {
      final user =
          await RemoteDataSourceImp.instance.logInUser(email, password);
      final UserDataModel logInUser = UserDataModel(
        id: user.user!.uid,
        name: user.user!.displayName!,
        email: email,
        password: password,
        memberSince: user.user!.metadata.creationTime.toString(),
      );
      await localDataSource.cacheUserId(user.user!.uid);
      return Right(logInUser);
    } on FirebaseAuthException catch (e) {
      return Left(RegisterFailure.fromCode(e.code));
    }
  }

  @override
  Future<Either<Failure, UserDataModel>> getUserData(String userId) async {
    try {
      final user = await RemoteDataSourceImp.instance.getUserData(userId);
      final UserDataModel userData =
          UserDataModel.fromJson(user.data() as Map<String, dynamic>);
      return Right(userData);
    } on FirebaseException catch (e) {
      return Left(UnknownFailure(message: e.code));
    }
  }

  @override
  Future<Either<Failure, Unit>> logOutUser() async {
    try {
      await RemoteDataSourceImp.instance.LogOut();
      await localDataSource.clearCacheUserId();
     
      return const Right(unit);
    } on FirebaseAuthException catch (e) {
      return Left(UnknownFailure(message: e.code));
    }
  }
}
