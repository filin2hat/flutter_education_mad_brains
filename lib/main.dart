import 'package:flutter/material.dart';
import 'package:flutter_lesson_3/presentation/widgets/start_screen_widget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        fontFamily: 'Anta',
        colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromARGB(255, 111, 17, 17)),
        useMaterial3: true,
      ),
      home: const StartScreen(),
    );
  }
}
