import 'package:flutter/material.dart';

import 'login_page/login.dart';

void main() {
  runApp(const FitnessClub());
}

class FitnessClub extends StatelessWidget {
  const FitnessClub({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'The Fitness Club',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      home: const LoginPage(),
    );
  }
}
