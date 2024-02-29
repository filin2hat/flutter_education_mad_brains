import 'package:flutter/material.dart';

import '../widgets/film_list.dart';

class TopAll extends StatelessWidget {
  const TopAll({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const FilmList(),
      backgroundColor: Theme.of(context).colorScheme.onBackground,
    );
  }
}
