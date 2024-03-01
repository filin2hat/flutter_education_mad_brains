import 'package:flutter/material.dart';

import '../widgets/film_list_Impl.dart';

class TopAll extends StatelessWidget {
  const TopAll({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const FilmListImpl(),
      backgroundColor: Theme.of(context).colorScheme.onBackground,
    );
  }
}
