import '../model/movie_model.dart';

abstract class AppRepository {
  Stream<MovieModel> getMovie();

  Stream<List<MovieModel>> getFilteredMovies(String query);
}
