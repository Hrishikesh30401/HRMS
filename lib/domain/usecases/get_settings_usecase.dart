import 'package:hrms/domain/entities/settings_entity.dart';
import 'package:hrms/domain/repository/settings_repository.dart';

class GetSettings {
  final SettingsRepository repository;

  GetSettings(this.repository);

  Future<Settings> call() async {
    return await repository.getSettings();
  }
}
