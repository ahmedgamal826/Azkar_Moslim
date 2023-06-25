import 'package:azkar_moslim/Screens/home_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const Azkar_app());
}

class Azkar_app extends StatelessWidget {
  const Azkar_app({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: home_page(),
    );
  }
}


