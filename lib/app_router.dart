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
        return PageRouteBuilder(
          pageBuilder: (_, __, ___) => const MainPage(),
          transitionsBuilder: (_, animation, __, child) {
            return FadeTransition(opacity: animation, child: child);
          },
        );
      case settingsRoute:
        return PageRouteBuilder(
          pageBuilder: (_, __, ___) => const SettingsPage(),
          transitionsBuilder: (_, animation, __, child) {
            return FadeTransition(opacity: animation, child: child);
          },
        );
      case detailsRoute:
        final arguments = settings.arguments as DetailsArguments;
        return PageRouteBuilder(
          pageBuilder: (_, __, ___) => DetailsPage(arguments: arguments),
          transitionsBuilder: (_, animation, __, child) {
            return FadeTransition(opacity: animation, child: child);
          },
        );
      default:
        return null;
    }
  }
}
