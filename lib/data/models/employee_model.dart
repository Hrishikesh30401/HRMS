import 'package:hrms/domain/entities/employee_entity.dart';

class EmployeeModel extends EmployeeEntity {
  const EmployeeModel({
    required super.id,
    required super.firstName,
    required super.lastName,
    required super.age,
  });

  factory EmployeeModel.fromJson(Map<String, dynamic> map) => EmployeeModel(
        id: null,
        firstName: map['firstName'],
        lastName: map['lastName'],
        age: map['age'],
      );

  factory EmployeeModel.fromEntity(EmployeeEntity entity) => EmployeeModel(
        id: entity.id,
        firstName: entity.firstName,
        lastName: entity.lastName,
        age: entity.age,
      );
}

extension UserModelMapper on EmployeeModel {
  EmployeeEntity toEntity() {
    return EmployeeEntity(
      id: id,
      firstName: firstName,
      lastName: lastName,
      age: age,
    );
  }
}
