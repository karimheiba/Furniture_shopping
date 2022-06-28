import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:furniture_shopping_app/data/data_services/local_data_sources.dart';
import 'package:furniture_shopping_app/data/models/user_data_model.dart';
import 'package:furniture_shopping_app/data/repositories/auth_repo.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final AuthRepoImpl authRepo;
  final LocalDataSourceImpl localDataSource;
  HomeBloc({required this.authRepo, required this.localDataSource})
      : super(HomeInitial()) {
    on<HomeEvent>((event, emit) async {
      if (event is TabNavigateToScreenEvent) {
        emit(HomeLoading());
        emit(BodyHomeLoaded(body: event.screen));
      } else if (event is HomeScreenEvent) {
        emit(HomeLoading());
        final userId = localDataSource.getCachedUserId();
        if (userId != null) {
          final userData = await authRepo.getUserData(userId);
          userData.fold((failure) => print('no user'), (user) {
            print(userId);
            return emit(HomeLoaded(user: user));
          });
        }
      } else if (event is LogOutHomeEvent) {
        await authRepo.logOutUser().then((value) => value.fold(
            (failure) => emit(ErrorLogOutState(message: failure.message)),
            (unit) => emit(SuccessLogOutState(message: 'See You Again!'))));
      }
    });
  }
}
