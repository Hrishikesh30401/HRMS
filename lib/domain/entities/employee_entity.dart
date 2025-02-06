import 'package:equatable/equatable.dart';

class EmployeeEntity extends Equatable {
  final int? id;
  final String? firstname;
  final String? lastname;
  final String? email;
  final int? age;

  const EmployeeEntity({
    required this.id,
    required this.firstname,
    required this.lastname,
    required this.email,
    required this.age,
  });

  @override
  List<Object?> get props {
    return [
      id,
      firstname,
      lastname,
      email,
      age,
    ];
  }
}
