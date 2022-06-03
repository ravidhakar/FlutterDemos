
import 'package:flutter/material.dart';
import 'package:flutter_page_navigation/ThirdRoute.dart';

class SecondRoute extends StatelessWidget {
  const SecondRoute({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Second Route'),
      ),
      body: Center(
        child: ElevatedButton(
          child: const Text('Open Third route'),
          onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (builder) => const ThirdRoute()));
          },
        ),
      ),
    );
  }
}