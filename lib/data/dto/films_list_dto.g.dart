// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'films_list_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FilmsListDto _$FilmsListDtoFromJson(Map<String, dynamic> json) => FilmsListDto(
      totalFilmsCounter: json['total'] as int,
      totalPages: json['totalPages'] as int,
      result: (json['items'] as List<dynamic>)
          .map((e) => FilmDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$FilmsListDtoToJson(FilmsListDto instance) =>
    <String, dynamic>{
      'total': instance.totalFilmsCounter,
      'totalPages': instance.totalPages,
      'items': instance.result,
    };
