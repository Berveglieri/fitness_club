/*import 'package:fitness_club/login_page/body.dart';*/
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fitness_club/login_page/body_2.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      // appBar: AppBar(
      //   title: const Text(
      //       'The Fitness Club',
      //     style: TextStyle(fontFamily: 'Vollkorn'),
      //   ),
      //   elevation: 6.0,
      //   backgroundColor: Colors.black87,
      //   centerTitle: true,
      //   actions: <Widget>[
      //     TextButton(
      //       onPressed: (){
      //       },
      //       child: const Text(
      //         'Sing up',
      //         style: TextStyle(fontSize: 14),
      //       ),
      //     )
      //   ],
      // ),
      body: Body(),
    );
  }


}