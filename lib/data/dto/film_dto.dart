import 'package:json_annotation/json_annotation.dart';

import 'country_dto.dart';
import 'genre_dto.dart';

part 'film_dto.g.dart';

@JsonSerializable()
class FilmDto {
  const FilmDto({
    required this.id,
    required this.name,
    required this.picture,
    this.countries,
    this.genres,
    this.rating,
    this.year,
  });
  @JsonKey(name: 'kinopoiskId', defaultValue: 0)
  final int id;
  @JsonKey(name: 'nameRu', defaultValue: '')
  final String name;
  @JsonKey(name: 'posterUrl')
  final String? picture;
  @JsonKey(name: 'countries')
  final List<CountryDto>? countries;
  @JsonKey(name: 'genres')
  final List<GenreDto>? genres;
  @JsonKey(name: 'ratingKinopoisk')
  final double? rating;
  @JsonKey(name: 'year')
  final int? year;

  factory FilmDto.fromJson(Map<String, dynamic> json) =>
      _$FilmDtoFromJson(json);
}
