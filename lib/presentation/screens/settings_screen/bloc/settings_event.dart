part of 'settings_bloc.dart';

sealed class SettingsEvent extends Equatable {
  const SettingsEvent();

  @override
  List<Object> get props => [];
}

final class LoadSettingsEvent extends SettingsEvent {}

final class ToggleDarkModeEvent extends SettingsEvent {}

final class LogoutEvent extends SettingsEvent {}
