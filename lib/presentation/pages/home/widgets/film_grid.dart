import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../../../data/repository/repository.dart';
import '../../../../domain/models/film_model.dart';
import '../../../../domain/models/films_list_model.dart';
import '../../../widgets/film_card.dart';

class FilmGrid extends StatelessWidget {
  const FilmGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<FilmsListModel?>(
      future: FilmRepository.getFilmList(
        queryType: FilmQuery.queryTop250Movies,
        queryPage: 1,
      ),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (snapshot.hasError) {
          return Center(
            child: Text(
              'Error loading films: ${snapshot.error}',
              style: Theme.of(context).textTheme.titleLarge,
            ),
          );
        } else if (snapshot.hasData && snapshot.data != null) {
          final filmsList = snapshot.data!;
          return _FilmGridView(filmsList: filmsList);
        } else {
          return Center(
            child: Text(
              'No films available',
              style: Theme.of(context).textTheme.titleLarge,
            ),
          );
        }
      },
    );
  }
}

class _FilmGridView extends StatefulWidget {
  final FilmsListModel filmsList;

  const _FilmGridView({required this.filmsList});

  @override
  State<_FilmGridView> createState() => _FilmGridViewState();
}

class _FilmGridViewState extends State<_FilmGridView> {
  final ScrollController _scrollController = ScrollController();
  final List<FilmModel> _films = [];
  int _currentPage = 1;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _loadFilms();
    _scrollController.addListener(_scrollListener);
  }

  Future<void> _loadFilms() async {
    if (_isLoading) return;
    setState(() {
      _isLoading = true;
    });
    try {
      final filmsList = await FilmRepository.getFilmList(
        queryType: FilmQuery.queryTopPopularMovies,
        queryPage: _currentPage,
      );
      setState(() {
        _films.addAll(filmsList?.result ?? []);
        _currentPage++;
      });
    } catch (e) {
      if (kDebugMode) {
        print('Error loading films: $e');
      }
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  bool _isLoadMore() {
    return !_isLoading &&
        _scrollController.position.pixels >=
            _scrollController.position.maxScrollExtent - 300;
  }

  void _scrollListener() {
    if (_isLoadMore()) {
      _loadFilms();
    }
  }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      controller: _scrollController,
      itemCount: _films.length + (_isLoading ? 1 : 0),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 2 / 3,
      ),
      itemBuilder: (BuildContext context, int index) {
        if (index < _films.length) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: FilmCard.fromModel(model: _films[index]),
          );
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
}
