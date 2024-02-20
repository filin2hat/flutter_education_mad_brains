import '../model/movie.dart';

abstract class AppRepository {
  List<Movie> movieList = [];

  Stream<Movie> getMovie();
}
