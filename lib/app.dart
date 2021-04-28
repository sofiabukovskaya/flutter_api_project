
import 'package:artists_app/ui/pages/search_page/search.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primaryColor: Colors.green),
      home: Scaffold(
        body: SearchPage(),
      ),
    );
  }
}