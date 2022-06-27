import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:furniture_shopping_app/data/data_services/remote_data_sources.dart';
import 'package:furniture_shopping_app/data/model/user_data_model.dart';

import '../../core/error/failuer.dart';

abstract class AuthRepo {
  Future<Either<Failure, UserDataModel>> createNewUser(
      String email, String password, String name);
  Future<Either<Failure, UserDataModel>> logInUser(
      String email, String password);

  Future<Either<Failure, UserDataModel>> getUserData(String userId);
}

class AuthRepoImpl extends AuthRepo {
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
      );
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
}
