import 'package:flutter/material.dart';

import '../widgets/film_grid.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        leading: IconButton(
          icon: const Icon(Icons.menu, color: Colors.white),
          onPressed: () {
            //TODO : implement menu function
          },
        ),
        title: Text(title, style: const TextStyle(color: Colors.white)),
        centerTitle: true,
        actions: [
          IconButton(
              icon: const Icon(Icons.sort, color: Colors.white),
              onPressed: () {
                //TODO : implement sort function
              }),
          IconButton(
              icon: const Icon(Icons.settings, color: Colors.white),
              onPressed: () {
                //TODO : implement settings function
              })
        ],
      ),
      body: const FilmGrid(),
    );
  }
}
