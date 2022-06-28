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
final UserData user;
  HomeLoaded({required this.user});
   @override
  List<Object> get props => [user];
}

class GetUserState extends HomeState {
  final UserData user;

  const GetUserState({required this.user});

  @override
  List<Object> get props => [user];
}

class HomeScreenState extends HomeState{}

class SuccessLogOutState extends HomeState {
  final String message;

  const SuccessLogOutState({required this.message});
  
  @override
  List<Object> get props => [message];
}
class ErrorLogOutState extends HomeState {
  final String message;

  const ErrorLogOutState({required this.message});
  
  @override
  List<Object> get props => [message];
}