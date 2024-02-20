import 'package:flutter/cupertino.dart';
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
      color: Colors.black54,
      child: SizedBox(
        height: 200,
        child: Row(
          children: <Widget>[
            Image.asset(
              movie.picture,
              scale: 1.3,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  movie.title,
                  style: const TextStyle(
                      fontSize: 15, color: Colors.white),
                ),
                Text(
                  movie.releaseDate.year.toString(),
                  style: const TextStyle(
                      fontSize: 15, color: Colors.white),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}