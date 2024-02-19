import '../enum/language.dart';

mixin ConvertLanguage {
  Language convertToEnum(String language) {
    switch (language.toLowerCase()) {
      case 'english':
        return Language.english;
      case 'spanish':
        return Language.spanish;
      case 'french':
        return Language.french;
      case 'german':
        return Language.german;
      case 'russian':
        return Language.russian;
      case 'chinese':
        return Language.chinese;
      case 'japanese':
        return Language.japanese;
      case 'korean':
        return Language.korean;
      default:
        throw ArgumentError('Invalid language: $language');
    }
  }
}
