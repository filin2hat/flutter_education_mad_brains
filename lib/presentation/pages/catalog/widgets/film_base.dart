import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../../../data/repository/repository.dart';
import '../../../../domain/models/film_model.dart';
import '../../../../domain/models/films_list_model.dart';

class FilmBase extends StatefulWidget {
  final String queryType;
  final Widget Function(FilmsListModel filmsList) builder;

  const FilmBase({
    super.key,
    required this.queryType,
    required this.builder,
  });

  @override
  State<FilmBase> createState() => _FilmBaseState();
}

class _FilmBaseState extends State<FilmBase> {
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
        queryType: widget.queryType.toString(),
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
      child: widget.builder(
          FilmsListModel(totalPages: 0, result: _films, totalFilmsCounter: 0)),
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
}
