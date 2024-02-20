import 'package:flutter/material.dart';

import '../../domain/model/movie.dart';

class FilmCard extends StatelessWidget {
  const FilmCard({
    super.key,
    required this.movie,
  });

  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return Card(
      shadowColor: Colors.red,
      surfaceTintColor: Colors.redAccent,
      elevation: 3,
      color: Colors.black45,
      child: SizedBox(
        height: 200,
        child: Row(
          children: <Widget>[
            ImageSection(movie: movie),
            TextSection(movie: movie),
          ],
        ),
      ),
    );
  }
}

class TextSection extends StatelessWidget {
  const TextSection({
    super.key,
    required this.movie,
  });

  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Text(
              movie.title,
              style: const TextStyle(fontSize: 18, color: Colors.white),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 4),
            Text(
              movie.description,
              style: const TextStyle(fontSize: 13, color: Colors.white70),
              maxLines: 4,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 4),
            Text(
              'Year: ${movie.releaseDate.year} \nLang: ${movie.language}',
              style: const TextStyle(
                  fontSize: 12,
                  color: Colors.white54,
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}

class ImageSection extends StatelessWidget {
  const ImageSection({
    super.key,
    required this.movie,
  });

  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          movie.picture,
        ),
        Text(
          movie.voteAverage.toString(),
          style: const TextStyle(
            fontSize: 14,
            color: Colors.red,
            backgroundColor: Colors.black87,
          ),
        ),
      ],
    );
  }
}
