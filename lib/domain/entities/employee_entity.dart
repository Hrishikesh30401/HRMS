import 'package:equatable/equatable.dart';

class EmployeeEntity extends Equatable {
  final int? id;
  final String? firstName;
  final String? lastName;
  final int? age;

  const EmployeeEntity({
    this.id,
    this.firstName,
    this.lastName,
    this.age,
  });

  @override
  List<Object?> get props => [id, firstName, lastName, age];
}
