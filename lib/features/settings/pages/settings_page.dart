import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});
  static const path = '/settings';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                SystemChannels.platform.invokeMethod('SystemNavigator.pop');
              },
              child: const Row(mainAxisSize: MainAxisSize.min, children: [
                Icon(Icons.exit_to_app),
                Text('Exit'),
              ]),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Row(mainAxisSize: MainAxisSize.min, children: [
                Icon(Icons.arrow_back),
                Text('Back'),
              ]),
            )
          ],
        ),
      ),
    );
  }
}
