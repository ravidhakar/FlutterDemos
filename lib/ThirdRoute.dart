
import 'package:flutter/material.dart';
import 'package:flutter_page_navigation/FirstRoute.dart';

class ThirdRoute extends StatelessWidget {
  const ThirdRoute({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Third Route'),
      ),
      body: Center(
        child: ElevatedButton(
          child: const Text('Open First route'),
          onPressed: () {
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (builder) => const FirstRoute()));
            }
          },
        ),
      ),
    );
  }
}