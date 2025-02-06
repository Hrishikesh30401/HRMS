import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'approvals_event.dart';
part 'approvals_state.dart';

class ApprovalsBloc extends Bloc<ApprovalsEvent, ApprovalsState> {
  ApprovalsBloc() : super(ApprovalsInitial()) {
    on<ApprovalsEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
