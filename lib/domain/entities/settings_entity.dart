class Settings {
  final bool darkMode;
  final String language;

  Settings({required this.darkMode, required this.language});

  Settings copyWith({bool? darkMode, String? language}) {
    return Settings(
      darkMode: darkMode ?? this.darkMode,
      language: language ?? this.language,
    );
  }
}
