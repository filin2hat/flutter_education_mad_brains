import 'package:flutter/material.dart';

import '../../../app/data/repository_in_memory.dart';
import '../../../app/domain/model/movie_model.dart';
import '../../../app/widgets/movie_list.dart';

class StartPage extends StatefulWidget {
  const StartPage({super.key});

  @override
  State<StartPage> createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  late bool _isLoading;
  final List<MovieModel> _movies = [];
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
          leading: IconButton(
            onPressed: () {
              //TODO Implement menu pressed
            },
            icon: const Icon(Icons.menu),
            color: Colors.red,
          ),
          title: const Text('Kinopoisk',
              style: TextStyle(color: Colors.redAccent, fontSize: 30)),
          actions: [
            IconButton(
              onPressed: () {
                //TODO implement sorted list button
              },
              icon: const Icon(Icons.sort),
              color: Colors.red,
            ),
            IconButton(
              onPressed: () {
                //TODO implement settings button
              },
              icon: const Icon(Icons.settings),
              color: Colors.red,
            ),
          ],
          centerTitle: true,
          backgroundColor: Colors.black87),
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
