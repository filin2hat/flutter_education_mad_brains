import '../enum/language.dart';
import '../mixin/convert_language.dart';

abstract class Film with ConvertLanguage {
  String id;
  String title;
  String picture;
  double voteAverage;
  DateTime releaseDate;
  String description;
  String language;

  Film(this.id, this.title, this.picture, this.voteAverage, this.releaseDate,
      this.description, this.language) {
    Language languageEnum = convertToEnum(language);
    language = languageEnum.toPrettyString();
  }
}
