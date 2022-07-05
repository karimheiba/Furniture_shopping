part of 'user_bloc.dart';

abstract class UserState extends Equatable {
  const UserState();

  @override
  List<Object> get props => [];
}

class UserDataInitial extends UserState {}

class UserDataLoading extends UserState {}

class UserDataLoaded extends UserState {
  final UserData user;

  const UserDataLoaded({required this.user});

  @override
  List<Object> get props => [user];
}

