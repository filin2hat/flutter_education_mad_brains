import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../../../data/repository/repository.dart';
import '../../../../domain/models/film_model.dart';
import '../../../../domain/models/films_list_model.dart';
import '../../../widgets/film_tile.dart';

class FilmList extends StatelessWidget {
  const FilmList({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<FilmsListModel?>(
      future: FilmRepository.getFilmList(
        queryType: FilmQuery.queryTopPopularMovies,
        queryPage: 1,
      ),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Center(
              child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Failed to load films: ${snapshot.error}',
              style: TextStyle(
                  color: Theme.of(context).colorScheme.error, fontSize: 16),
              textAlign: TextAlign.center,
            ),
          ));
        } else if (snapshot.hasData && snapshot.data != null) {
          final filmsList = snapshot.data!;
          return _FilmListView(filmsList: filmsList);
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

class _FilmListView extends StatefulWidget {
  final FilmsListModel filmsList;

  const _FilmListView({required this.filmsList});

  @override
  State<_FilmListView> createState() => _FilmListViewState();
}

class _FilmListViewState extends State<_FilmListView> {
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

  Future<void> _refreshFilms() async {
    setState(() {
      _films.clear();
      _currentPage = 1;
    });
    await _loadFilms();
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
    return RefreshIndicator(
      onRefresh: _refreshFilms,
      child: ListView.builder(
        controller: _scrollController,
        itemCount: _films.length + (_isLoading ? 1 : 0),
        itemBuilder: (BuildContext context, int index) {
          if (index < _films.length) {
            return FilmTile.fromModel(model: _films[index]);
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
}
