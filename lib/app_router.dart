import 'package:flutter/material.dart';
import 'package:flutter_education_mad_brains/app/widgets/main_page.dart';
import 'package:flutter_education_mad_brains/features/details/pages/details_page.dart';
import 'package:flutter_education_mad_brains/features/settings/pages/settings_page.dart';

class AppRouter {
  static const String mainRoute = '/';
  static const String settingsRoute = '/settings';
  static const String detailsRoute = '/details';

  static Route<dynamic>? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case mainRoute:
        return MaterialPageRoute(builder: (_) => const MainPage());
      case settingsRoute:
        return MaterialPageRoute(builder: (_) => const SettingsPage());
      case detailsRoute:
        final arguments = settings.arguments as DetailsArguments;
        return MaterialPageRoute(
          builder: (_) => DetailsPage(arguments: arguments),
        );
      default:
        return null;
    }
  }
}
