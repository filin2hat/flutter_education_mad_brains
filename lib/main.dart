import 'package:flutter/material.dart';

import 'domain/model/movie.dart';
import 'dummy_data.dart';

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

  @override
  void initState() {
    _isLoading = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Kinopoisk',
              style: TextStyle(color: Colors.redAccent, fontSize: 30)),
          centerTitle: true,
          backgroundColor: Colors.black87,
        ),
        body: Container(
          padding: const EdgeInsets.all(16.0),
          color: Color.alphaBlend(Colors.black87, Colors.red),
          child:  Center(
            child: MovieListWidget(movies: movieList,),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            //todo DownloadFilms
          },
          backgroundColor: Colors.red,
          foregroundColor: Colors.white,
          tooltip: 'Download films',
          child: const Icon(Icons.download),
        ));
  }
}

class MovieListWidget extends StatelessWidget {
  final List<Movie> movies;

  const MovieListWidget({Key? key, required this.movies}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: movies.length,
      itemBuilder: (context, index) {
        final movie = movies[index];
        return ListTile(
          title: Text(movie.title),
          leading: Image.asset(movie.picture),
        );
      },
    );
  }
}
