import 'package:flutter/material.dart';

import '../widgets/film_grid.dart';

class CatalogPage extends StatelessWidget {
  const CatalogPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const FilmGrid(),
      backgroundColor: Theme.of(context).colorScheme.primary,
    );
  }
}
