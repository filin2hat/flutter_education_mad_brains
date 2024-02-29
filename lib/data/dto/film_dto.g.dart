// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'film_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FilmDto _$FilmDtoFromJson(Map<String, dynamic> json) => FilmDto(
      id: json['kinopoiskId'] as int? ?? 0,
      name: json['nameRu'] as String? ?? '',
      picture: json['posterUrl'] as String?,
      countries: (json['countries'] as List<dynamic>?)
          ?.map((e) => CountryDto.fromJson(e as Map<String, dynamic>))
          .toList(),
      genres: (json['genres'] as List<dynamic>?)
          ?.map((e) => GenreDto.fromJson(e as Map<String, dynamic>))
          .toList(),
      rating: (json['ratingKinopoisk'] as num?)?.toDouble(),
      year: json['year'] as int?,
    );

Map<String, dynamic> _$FilmDtoToJson(FilmDto instance) => <String, dynamic>{
      'kinopoiskId': instance.id,
      'nameRu': instance.name,
      'posterUrl': instance.picture,
      'countries': instance.countries,
      'genres': instance.genres,
      'ratingKinopoisk': instance.rating,
      'year': instance.year,
    };
