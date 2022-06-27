part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

class CreateUserAuthEvent extends AuthEvent {
  final String name;
  final String email;
  final String password;

  const CreateUserAuthEvent(
      {required this.name, required this.email, required this.password});
  @override
  List<Object> get props => [
        name,
        email,
        password,
      ];
}

class LogInUserAuthEvent extends AuthEvent {
  final String email;
  final String password;

  const LogInUserAuthEvent({required this.email, required this.password});
  @override
  List<Object> get props => [
        email,
        password,
      ];
}

class GetUserDataAuthEvent extends AuthEvent {
  final String userId;

  const GetUserDataAuthEvent({required this.userId});
  @override
  List<Object> get props => [
        userId,
      ];
}
