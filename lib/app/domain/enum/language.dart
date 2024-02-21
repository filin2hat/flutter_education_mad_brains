enum Language {
  english,
  spanish,
  french,
  german,
  russian,
  chinese,
  japanese,
  korean,
}

extension LanguageExtension on Language {
  String toPrettyString() {
    switch (this) {
      case Language.english:
        return 'English (US)';
      case Language.spanish:
        return 'Spanish (Spain)';
      case Language.french:
        return 'French (France)';
      case Language.german:
        return 'German (Germany)';
      case Language.russian:
        return 'Russian (Russia)';
      case Language.chinese:
        return 'Chinese (Simplified)';
      case Language.japanese:
        return 'Japanese (Japan)';
      case Language.korean:
        return 'Korean (Korea)';
      default:
        throw ArgumentError('Invalid language: $this');
    }
  }
}
