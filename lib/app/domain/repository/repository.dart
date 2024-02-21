import '../model/movie_model.dart';

abstract class AppRepository {
  final List<MovieModel> _movieList = [];

  Stream<MovieModel> getMovie();

  Stream<List<MovieModel>> getFilteredMovies(String query);
}
