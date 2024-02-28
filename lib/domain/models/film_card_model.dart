class FilmCardModel {
  const FilmCardModel({
    required this.id,
    required this.title,
    this.picture = '',
    this.voteAverage = 0.0,
    this.releaseDate = '',
    this.description = '',
    this.director = '',
    this.genre = '',
  });
  final int id;
  final String title;
  final String picture;
  final double voteAverage;
  final String releaseDate;
  final String description;
  final String director;
  final String genre;
}
