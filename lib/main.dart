import 'package:flutter/material.dart';

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
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const KinopoiskApp(),
    );
  }
}

class KinopoiskApp extends StatefulWidget {
  const KinopoiskApp({super.key});

  @override
  State<KinopoiskApp> createState() => _KinopoiskAppState();
}

class _KinopoiskAppState extends State<KinopoiskApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Kinopoisk'),
        ),
        body: const Center(
          child: Text('Hello, World!'),
        ));
  }
}
