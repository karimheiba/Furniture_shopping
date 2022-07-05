import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:furniture_shopping_app/data/models/cart_model.dart';
import 'package:furniture_shopping_app/data/models/products_data_model.dart';
import 'package:furniture_shopping_app/data/repositories/user_repo.dart';

import '../../../data/data_services/local_data_sources.dart';
import '../../../data/models/user_data_model.dart';
import '../../../data/repositories/auth_repo.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final AuthRepoImpl authRepo;
  final UserRepoImpl userRepo;
  final LocalDataSourceImpl localDataSource;
  UserBloc(
      {required this.authRepo,
      required this.localDataSource,
      required this.userRepo})
      : super(UserDataInitial()) {
    on<UserEvent>((event, emit) async {
      /// Get User Data Info
      if (event is GetUserDataEvent) {
        emit(UserDataLoading());
        final userId = localDataSource.getCachedUserId();
        if (userId != null) {
          final userData = await authRepo.getUserData(userId);
          userData.fold((failure) => print('no user'), (user) {
            print(userId);
            return emit(UserDataLoaded(user: user));
          });
        }
      }

      

    });
  }
}
