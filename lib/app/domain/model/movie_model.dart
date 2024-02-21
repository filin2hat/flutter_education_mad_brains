import '../enum/language.dart';
import '../mixin/convert_language.dart';
import 'film_model.dart';

class MovieModel extends FilmModel with ConvertLanguage {
  MovieModel(super.id, super.title, super.picture, super.voteAverage,
      super.releaseDate, super.description, super.language);

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
