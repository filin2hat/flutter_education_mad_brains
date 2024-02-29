import 'package:dio/dio.dart';
import 'package:flutter_education_mad_brains/data/mapper/films_list_mapper.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import '../../domain/models/films_list_model.dart';
import '../dto/films_list_dto.dart';

class FilmQuery {
  static const String baseUrl = 'https://kinopoiskapiunofficial.tech/api/';

  static const String apiKey = 'c6f75fe6-9935-41d8-8de9-b75ed260d1e2';

  static Map<String, String> headers = {
    'X-API-KEY': apiKey,
    'Content-Type': 'application/json',
  };

  static const String queryTopPopularAll = 'TOP_POPULAR_ALL';
  static const String queryTopPopularMovies = 'TOP_POPULAR_MOVIES';
  static const String queryTop250TvShows = 'TOP_250_TV_SHOWS';
  static const String queryTop250Movies = 'TOP_250_MOVIES';
}

class FilmRepository {
  static final Dio _dio = Dio()
    ..interceptors.add(PrettyDioLogger(
      requestHeader: true,
      requestBody: true,
    ));

  static Future<FilmsListModel?> getFilmList(
      {required String queryType, required int queryPage}) async {
    try {
      String url =
          '${FilmQuery.baseUrl}v2.2/films/collections?type=$queryType&page=$queryPage';

      final response = await _dio.get(
        url,
        options: Options(headers: FilmQuery.headers),
      );
      if (response.statusCode == 200) {
        final filmsListDto = FilmsListDto.fromJson(response.data);
        return filmsListDto.toModel();
      } else {
        throw Exception('Failed to load film list: ${response.data}');
      }
    } on DioException catch (e) {
      throw Exception('Failed to load film list: ${e.response?.data}');
    }
  }
}
