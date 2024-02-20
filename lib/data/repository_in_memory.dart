import '../domain/model/movie.dart';
import '../domain/repository/repository.dart';

class Repository implements AppRepository {
  @override
  List<Movie> movieList = [
    Movie(
      '1',
      'The Shawshank Redemption',
      'assets/posters/img1.jpg',
      8.7,
      DateTime(1994),
      'Two imprisoned men bond over a number of years, finding solace and eventual redemption through acts of common decency.',
      'english',
    ),
    Movie(
      '2',
      'The Godfather',
      'assets/posters/img2.jpg',
      9.2,
      DateTime(1972),
      'The aging patriarch of an organized crime dynasty transfers control of his clandestine empire to his reluctant son.',
      'english',
    ),
    Movie(
      '3',
      'The Godfather: Part II',
      'assets/posters/img3.jpg',
      9.0,
      DateTime(1974),
      'The early life and career of Vito Corleone in 1920s New York City is portrayed, while his son, Michael, expands and tightens his grip on the family crime syndicate.',
      'english',
    ),
    Movie(
      '4',
      'The Dark Knight',
      'assets/posters/img4.jpg',
      9.0,
      DateTime(2008),
      'When the menace known as the Joker wreaks havoc and chaos on the people of Gotham, Batman must accept one of the greatest psychological and physical tests of his ability to fight injustice.',
      'english',
    ),
    Movie(
      '5',
      '12 Angry Men',
      'assets/posters/img5.jpg',
      8.9,
      DateTime(1957),
      'A jury holdout attempts to prevent a miscarriage of justice by forcing his colleagues to reconsider the evidence.',
      'english',
    ),
  ];

  @override
  Stream<Movie> getMovie() async* {
    for (var movie in movieList) {
      await Future.delayed(const Duration(milliseconds: 350));
      yield movie;
    }
  }

  @override
  Stream<List<Movie>> getFilteredMovies(String title) async* {
    final filteredMovies = movieList
        .where(
            (movie) => movie.title.toLowerCase().contains(title.toLowerCase()))
        .toList();
    yield filteredMovies;
  }
}
