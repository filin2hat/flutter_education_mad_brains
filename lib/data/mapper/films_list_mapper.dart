import 'package:flutter_education_mad_brains/data/mapper/film_mapper.dart';

import '../../domain/models/films_list_model.dart';
import '../dto/films_list_dto.dart';

extension FilmsListDtoExtension on FilmsListDto {
  FilmsListModel toModel() {
    return FilmsListModel(
      totalFilmsCounter: totalFilmsCounter,
      totalPages: totalPages,
      result: result.map((filmDto) => filmDto.toModel()).toList(),
    );
  }
}
