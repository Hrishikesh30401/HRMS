import 'package:hrms/domain/entities/settings_entity.dart';

abstract class SettingsRepository {
  Future<Settings> getSettings();
  Future<void> updateSettings(Settings settings);
  Future<void> logout();
}
