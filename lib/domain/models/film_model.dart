class FilmModel {
  const FilmModel({
    required this.id,
    required this.title,
    this.picture = '',
    this.voteAverage = 0.0,
    this.releaseDate = '',
    this.countries = const [],
    this.genres = const [],
  });
  final int id;
  final String title;
  final String picture;
  final List<String> countries;
  final double voteAverage;
  final String releaseDate;
  final List<String> genres;
}
