import 'package:flutter/material.dart';
import 'package:flutter_education_mad_brains/features/home/widgets/film_list.dart';

class CatalogPage extends StatelessWidget {
  const CatalogPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: FilmList(),
    );
  }
}
