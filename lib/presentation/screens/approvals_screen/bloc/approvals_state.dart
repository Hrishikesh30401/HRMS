part of 'approvals_bloc.dart';

sealed class ApprovalsState extends Equatable {
  const ApprovalsState();
  
  @override
  List<Object> get props => [];
}

final class ApprovalsInitial extends ApprovalsState {}
