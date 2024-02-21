import 'package:flutter/material.dart';

import '../data/repository_in_memory.dart';
import '../domain/model/movie_model.dart';
import 'film_card_widget.dart';

class MovieList extends StatefulWidget {
  const MovieList({
    super.key,
    required List<MovieModel> movies,
  }) : _movies = movies;

  final List<MovieModel> _movies;

  @override
  State<MovieList> createState() => _MovieListState();
}

class _MovieListState extends State<MovieList> {
  late List<MovieModel> _filteredMovies;
  late TextEditingController _searchController;
  final Repository repository = Repository();

  @override
  void initState() {
    _filteredMovies = widget._movies;
    _searchController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _filterMovies(String query) {
    if (query.isEmpty) {
      setState(() {
        _filteredMovies = widget._movies;
      });
    } else {
      final filteredStream = repository.getFilteredMovies(query);
      filteredStream.listen((movies) {
        setState(() {
          _filteredMovies = movies;
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            controller: _searchController,
            onChanged: _filterMovies,
            style: const TextStyle(
              color: Colors.white,
            ),
            decoration: InputDecoration(
              labelText: 'Search film by name',
              prefixIcon: const Icon(Icons.search,
                  color: Color.fromARGB(255, 111, 17, 17)),
              suffixIcon: _searchController.text.isNotEmpty
                  ? IconButton(
                      icon: const Icon(Icons.clear,
                          color: Color.fromARGB(255, 111, 17, 17)),
                      onPressed: () {
                        _searchController.clear();
                        _filterMovies('');
                      },
                    )
                  : null,
            ),
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: _filteredMovies.length,
            itemBuilder: (context, index) {
              final movie = _filteredMovies[index];
              return FilmCard(movie: movie);
            },
          ),
        ),
      ],
    );
  }
}
