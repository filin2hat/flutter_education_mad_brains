import 'package:json_annotation/json_annotation.dart';

import 'film_dto.dart';

part 'films_list_dto.g.dart';

@JsonSerializable()
class FilmsListDto {
  const FilmsListDto({
    required this.totalFilmsCounter,
    required this.totalPages,
    required this.result,
  });
  @JsonKey(name: 'total')
  final int totalFilmsCounter;

  @JsonKey(name: 'totalPages')
  final int totalPages;

  @JsonKey(name: 'items')
  final List<FilmDto> result;

  factory FilmsListDto.fromJson(Map<String, dynamic> json) =>
      _$FilmsListDtoFromJson(json);
}
