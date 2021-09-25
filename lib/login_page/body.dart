import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
          padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
              'assets/images/logo/logo.png',
            height: 350.0,
            width: 350.0,
            alignment: Alignment.topCenter,
          ),
          const SizedBox(height: 9.0),
          TextFormField(
            decoration: const InputDecoration(
              icon: Icon(Icons.person),
              hintText: 'email',
            ),
          ),
          const SizedBox(height: 14.0),
          TextFormField(
            obscureText: true,
            enableSuggestions: false,
            autocorrect: false,
            decoration: const InputDecoration(
              icon: Icon(Icons.lock),
              hintText: 'password',
            ),
          ),
          const SizedBox(height: 21.0),
        ],
      )
      ),
    );
  }
}
