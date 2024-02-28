import 'package:flutter/material.dart';

import '../widgets/film_list.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const FilmList(),
      backgroundColor: Theme.of(context).colorScheme.onBackground,
    );
  }
}
