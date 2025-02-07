part of 'settings_bloc.dart';

sealed class SettingsState extends Equatable {
  const SettingsState();

  @override
  List<Object> get props => [];
}

final class SettingsInitialState extends SettingsState {}

final class SettingsLoadingState extends SettingsState {}

final class SettingsLoadedState extends SettingsState {
  final Settings settings;

  const SettingsLoadedState(this.settings);

  @override
  List<Object> get props => [settings];
}

final class SettingsErrorState extends SettingsState {
  final String message;

  const SettingsErrorState(this.message);

  @override
  List<Object> get props => [message];
}

final class SettingsLoggedOutState extends SettingsState {}
