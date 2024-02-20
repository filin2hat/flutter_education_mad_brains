import 'package:flutter/material.dart';

import '../../data/repository_in_memory.dart';
import '../../domain/model/movie.dart';
import 'movie_list_widget.dart';

class StartScreen extends StatefulWidget {
  const StartScreen({super.key});

  @override
  State<StartScreen> createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {
  late bool _isLoading;
  final List<Movie> _movies = [];
  final Repository repository = Repository();

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
        child: _movies.isNotEmpty || _isLoading
            ? MovieList(movies: _movies)
            : const Center(
                child: Text('Press download button',
                    style: TextStyle(color: Colors.white, fontSize: 20))),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (!_isLoading) {
            if (_movies.isNotEmpty) {
              _movies.clear();
            }

            setState(() {
              _isLoading = true;
            });
            final movieStream = repository.getMovie();
            movieStream.listen((movie) {
              setState(() {
                _movies.add(movie);
              });
            }, onDone: () {
              setState(() {
                _isLoading = false;
              });
            });
          }
        },
        backgroundColor: Colors.red,
        foregroundColor: Colors.white,
        tooltip: 'Download films',
        child: const Icon(Icons.download),
      ),
    );
  }
}
