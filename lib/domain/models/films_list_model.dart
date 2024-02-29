import 'package:flutter_education_mad_brains/domain/models/film_model.dart';

class FilmsListModel {
  FilmsListModel({
    required this.totalFilmsCounter,
    required this.totalPages,
    required this.result,
  });
  final int totalFilmsCounter;
  final int totalPages;
  final List<FilmModel> result;
}
