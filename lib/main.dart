import 'package:flutter/material.dart';
import 'package:flutter_lesson_3/presentation/widgets/film_card_widget.dart';
import 'package:flutter_lesson_3/presentation/widgets/movie_list_widget.dart';

import 'data/repository_in_memory.dart';
import 'domain/model/movie.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        fontFamily: 'Anta',
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const KinopoiskApp(),
    );
  }
}

class KinopoiskApp extends StatefulWidget {
  const KinopoiskApp({super.key});

  @override
  State<KinopoiskApp> createState() => _KinopoiskAppState();
}

class _KinopoiskAppState extends State<KinopoiskApp> {
  late bool _isLoading;
  final List<Movie> _movies = [];

  @override
  void initState() {
    _isLoading = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Kinopoisk',
          style: TextStyle(color: Colors.redAccent, fontSize: 30),
        ),
        centerTitle: true,
        backgroundColor: Colors.black87,
      ),
      body: Container(
        padding: const EdgeInsets.all(8.0),
        color: Color.alphaBlend(Colors.black87, Colors.red),
        child: MovieList(movies: _movies),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (!_isLoading) {
            if (_movies.isNotEmpty) {
              _movies.clear();
            }
            setState(
              () {
                _isLoading = true;
              },
            );
            final repository = Repository();
            final movieStream = repository.getMovie();
            movieStream.listen(
              (movie) {
                setState(
                  () {
                    _movies.add(movie);
                  },
                );
              },
              onDone: () {
                setState(
                  () {
                    _isLoading = false;
                  },
                );
              },
            );
          }
          ;
        },
        backgroundColor: Colors.red,
        foregroundColor: Colors.white,
        tooltip: 'Download films',
        child: const Icon(Icons.download),
      ),
    );
  }
}



