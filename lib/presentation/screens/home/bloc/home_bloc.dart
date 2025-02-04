import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hrms/domain/entities/employee_entity.dart';
import 'package:hrms/domain/usecases/get_employees_usecase.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final GetEmployeeUseCase _getEmployeeUseCase;
  HomeBloc(this._getEmployeeUseCase) : super(HomeInitialState()) {
    on<HomeLoadEvent>(getEmployee);
  }

  Future<void> getEmployee(event, emit) async {
    emit(HomeLoadingState());
    final result = await _getEmployeeUseCase.call();
    if (result.error != null) {
      emit(HomeErrorState(result.error!.message));
    } else if (result.data != null) {
      emit(HomeLoadedState(result.data as EmployeeEntity));
    }
  }
}
