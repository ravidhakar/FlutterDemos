import 'package:flutter/material.dart';
import 'package:flutter_page_navigation/home/vm/HomePageViewModel.dart';
import 'package:provider/provider.dart';

import 'home/HomePageWidget.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => HomePageViewModel())
      ],
      child: const MaterialApp(
        title: 'Navigation Basics',
        home: HomePageWidget(),
      ),
    );
  }
}
