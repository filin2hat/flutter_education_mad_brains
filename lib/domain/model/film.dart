abstract class Film {
  String id;
  String title;
  String picture;
  double voteAverage;
  DateTime releaseDate;
  String description;
  String language;

  Film(this.id, this.title, this.picture, this.voteAverage, this.releaseDate,
      this.description, this.language);
}
