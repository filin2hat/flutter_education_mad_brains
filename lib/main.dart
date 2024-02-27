import 'package:flutter/material.dart';
import 'package:flutter_education_mad_brains/app/widgets/main_page.dart';

import 'features/settings/pages/settings_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Films App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Theme.of(context).colorScheme.primary,
        ),
        fontFamily: 'Anta',
        useMaterial3: true,
      ),
      initialRoute: MainPage.path,
      onGenerateRoute: (RouteSettings settings) {
        if (settings.name == MainPage.path) {
          return MaterialPageRoute(
            builder: (context) => const MainPage(),
          );
        }
        if (settings.name == SettingsPage.path) {
          final SettingsArguments arguments =
              settings.arguments as SettingsArguments;
          return MaterialPageRoute(builder: (context) {
            return SettingsPage(arguments: arguments);
          });
        }
      },
    );
  }
}
