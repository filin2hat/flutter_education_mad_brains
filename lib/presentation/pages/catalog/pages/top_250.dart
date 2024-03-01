import 'package:flutter/material.dart';

import '../widgets/film_grid_Impl.dart';

class Top250 extends StatelessWidget {
  const Top250({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const FilmGridImpl(),
      backgroundColor: Theme.of(context).colorScheme.onBackground,
    );
  }
}
