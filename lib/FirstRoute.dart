import 'package:flutter/material.dart';
import 'package:flutter_page_navigation/SecondRoute.dart';

class FirstRoute extends StatelessWidget {
  const FirstRoute({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('First Route'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const Image(
              width: 300.0,
              height: 300.0,
              fit: BoxFit.cover,
              image: AssetImage('launcher_icon.png')
          ),
          Image.asset('launcher_icon.png'),
          Center(
            child: ElevatedButton(
              child: const Text('Open route'),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (builder) => const SecondRoute()));
              },
            ),
          )
        ],
      ),
    );
  }
}
