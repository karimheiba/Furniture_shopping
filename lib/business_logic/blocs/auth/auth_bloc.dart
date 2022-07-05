import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:furniture_shopping_app/data/data_services/local_data_sources.dart';
import 'package:furniture_shopping_app/data/repositories/auth_repo.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepoImpl authRepo;
  final LocalDataSourceImpl localDataSource;
  AuthBloc({required this.authRepo, required this.localDataSource})
      : super(AuthInitial()) {
    on<AuthEvent>((event, emit) async {
      /// create user
      if (event is CreateUserAuthEvent) {
        emit(AuthLoading());
        final newUser = await authRepo.createNewUser(
            event.email, event.password, event.name);

        newUser.fold((failure) => emit(AuthError(failure.message)),
            (user) => emit(AuthSuccess()));
      }

      /// login user
      if (event is LogInUserAuthEvent) {
        emit(AuthLoading());
        final user = await authRepo.logInUser(event.email, event.password);
        user.fold((failure) => emit(AuthError(failure.message)), (userLogin) {
          final userId = userLogin.id;
          localDataSource.cacheUserId(userId);
          print('User Id Cached : $userId');
          emit(AuthSuccess());
        });
      }

      /// logOut user
      else if (event is LogOutAuthEvent) {
        await authRepo.logOutUser().then((value) => value.fold(
            (failure) => emit(ErrorLogOutState(message: failure.message)),
            (unit) => emit(SuccessLogOutState(message: 'See You Again!'))));
      }
    });
  }
}
