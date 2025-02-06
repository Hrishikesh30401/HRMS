import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hrms/core/resources/data_state.dart';
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
      final result = await _getEmployeesUsecase();

      if (result is DataSuccess<List<EmployeeEntity>>) {
        emit(FirebaseEmployeesLoaded(result.data!));
      } else if (result is DataFailed<List<EmployeeEntity>>) {
        emit(HomeFailure(result.error?.message ?? 'Unknown Error'));
      }
    } catch (e) {
      emit(HomeFailure(e.toString()));
    }
  }
}
