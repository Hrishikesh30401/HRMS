part of 'home_bloc.dart';

sealed class HomeState extends Equatable {
  const HomeState();
  
  @override
  List<Object> get props => [];
}

final class HomeInitialState extends HomeState {}

final class HomeLoadingState extends HomeState {}

final class HomeLoadedState extends HomeState {
  final EmployeeEntity employeeEntity;

  HomeLoadedState(this.employeeEntity);

  @override
  List<Object> get props => [employeeEntity];
}

final class HomeErrorState extends HomeState {
  final String message;

  HomeErrorState(this.message);

  @override
  List<Object> get props => [message];
}
