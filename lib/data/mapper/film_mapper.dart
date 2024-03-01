import 'package:flutter_education_mad_brains/data/mapper/country_mapper.dart';
import 'package:flutter_education_mad_brains/data/mapper/genre_mapper.dart';

import '../../domain/models/film_model.dart';
import '../dto/film_dto.dart';

extension FilmDtoExtension on FilmDto {
  FilmModel toModel() {
    return FilmModel(
      id: id,
      title: name,
      picture: picture ?? '',
      voteAverage: rating ?? 0.0,
      releaseDate: year != null ? '$year' : '',
      countries:
          countries?.map((countryDto) => countryDto.toModel()).toList() ?? [],
      genres: genres?.map((genreDto) => genreDto.toModel()).toList() ?? [],
    );
  }
}
