import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:hrms/domain/entities/employee_entity.dart';
import 'package:hrms/domain/usecases/get_employees_usecase.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final GetEmployeesUsecase _getEmployeesUsecase;

  HomeBloc(this._getEmployeesUsecase) : super(HomeInitial()) {
    on<FirebaseGetEmployeesEvent>(firebaseGetEmployeesEvent);
  }

  Future<void> firebaseGetEmployeesEvent(
      FirebaseGetEmployeesEvent event, Emitter<HomeState> emit) async {
    emit(HomeLoading());
    try {
      final result = await _getEmployeesUsecase.call();

      if (result is Left) {
        final failure = (result as Left).value;
        emit(HomeFailure(failure.message));
      } else if (result is Right) {
        final employees = (result as Right).value;
        emit(FirebaseEmployeesLoaded(employees));
      }
    } catch (e) {
      emit(HomeFailure(e.toString()));
    }
  }
}
