part of 'home_bloc.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object> get props => [];
}

class TabNavigateToScreenEvent extends HomeEvent {
  final int index;
  final List<Widget> screen;

  const TabNavigateToScreenEvent({required this.index, required this.screen});

  @override
  List<Object> get props => [index,screen];
}

class HomeScreenEvent extends HomeEvent{}

class LogOutHomeEvent extends HomeEvent{}
