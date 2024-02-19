import '../enum/language.dart';
import '../mixin/convert_language.dart';
import 'film.dart';

class Movie extends Film with ConvertLanguage {
  Movie(id, title, picture, voteAverage, releaseDate, description, language)
      : super(id, title, picture, voteAverage, releaseDate, description,
            language) {
    language = convertToEnum(language);
  }

  @override
  String toString() {
    Language languageEnum = convertToEnum(language);
    String languageString = languageEnum.toPrettyString();
    return 'Movie{id: $id,'
        ' title: $title,'
        ' picture: $picture,'
        ' voteAverage: $voteAverage,'
        ' releaseDate: $releaseDate,'
        ' description: $description,'
        ' language: $languageString}';
  }
}
