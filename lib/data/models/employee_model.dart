import 'package:hrms/domain/entities/employee_entity.dart';

class EmployeeModel extends EmployeeEntity {
  const EmployeeModel({
    required int id,
    required String firstname,
    required String lastname,
    required String email,
    required int age,
  }) : super(
            id: id,
            firstname: firstname,
            lastname: lastname,
            email: email,
            age: age);

  factory EmployeeModel.fromJson(Map<String, dynamic> json) {
    return EmployeeModel(
      id: json['id'] ?? 0,
      firstname: json['firstname'] ?? 'Unknown',
      lastname: json['lastname'] ?? 'Unknown',
      email: json['email'] ?? 'Unknown',
      age: json['age'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'firstname': firstname,
      'lastname': lastname,
      'email': email,
      'age': age,
    };
  }
}
