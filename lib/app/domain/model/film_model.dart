import '../enum/language.dart';
import '../mixin/convert_language.dart';

abstract class FilmModel with ConvertLanguage {
  final int id;
  final String title;
  final String picture;
  final double voteAverage;
  final DateTime releaseDate;
  final String description;
  String language;

  FilmModel(this.id, this.title, this.picture, this.voteAverage,
      this.releaseDate, this.description, this.language) {
    Language languageEnum = convertToEnum(language);
    language = languageEnum.toPrettyString();
  }
}
