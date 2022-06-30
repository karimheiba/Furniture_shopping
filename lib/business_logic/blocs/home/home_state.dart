part of 'home_bloc.dart';

abstract class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

class HomeInitial extends HomeState {
}

class HomeLoading extends HomeState {}

class BodyHomeLoaded extends HomeState {
  final List<Widget> body;

  const BodyHomeLoaded({required this.body});

  @override
  List<Object> get props => [body];
}

class HomeLoaded extends HomeState {

  HomeLoaded();
}

class GetUserState extends HomeState {
  final UserData user;

  const GetUserState({required this.user});

  @override
  List<Object> get props => [user];
}

class HomeScreenState extends HomeState{}


