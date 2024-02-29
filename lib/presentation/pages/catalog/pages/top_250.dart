import 'package:flutter/material.dart';

import '../widgets/film_grid.dart';

class Top250 extends StatelessWidget {
  const Top250({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const FilmGrid(),
      backgroundColor: Theme.of(context).colorScheme.onBackground,
    );
  }
}
