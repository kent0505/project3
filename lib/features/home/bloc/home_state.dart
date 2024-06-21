part of 'home_bloc.dart';

abstract class HomeState {}

class HomeInitial extends HomeState {}

class HomeLoadedState extends HomeState {
  final int coins;
  HomeLoadedState({required this.coins});
}
