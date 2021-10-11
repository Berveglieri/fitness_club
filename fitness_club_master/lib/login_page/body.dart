import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fitness_club/models/user_manager.dart';


class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  bool _isHidden = true;

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passController = TextEditingController();

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
            height: 300.0,
            width: 300.0,
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
            obscureText: _isHidden,
            enableSuggestions: false,
            autocorrect: false,
            decoration: InputDecoration(
              icon: const Icon(Icons.lock),
              hintText: 'password',
              suffix: InkWell(
                onTap: _togglePasswordView,
                child: Icon(
                    _isHidden ? Icons.visibility : Icons.visibility_off
                ),
              )
            ),
          ),
          const SizedBox(height: 51.0),
         Container(
           padding: const EdgeInsets.only(right: 100,
                                        left: 100,
                                        bottom: 15),
           width: double.infinity,
           child: Row(
             mainAxisAlignment: MainAxisAlignment.center,
             children: [
                 ElevatedButton(
                   onPressed: () {

                   },
                   style: ElevatedButton.styleFrom(
                     primary: Colors.black,
                     shape: RoundedRectangleBorder(
                       borderRadius: BorderRadius.circular(30.0),
                     ),
                   ),
                   child: const Text('Sign-In'),
                 ),
               SizedBox(width: 5),
               ElevatedButton(
                 onPressed: () {
                   Navigator.of(context).pushReplacementNamed('/signup');
                 },
                 style: ElevatedButton.styleFrom(
                   primary: Colors.black,
                   shape: RoundedRectangleBorder(
                     borderRadius: BorderRadius.circular(30.0),
                   ),
                 ),
                 child: const Text('Sign-Up'),
               ),
             ],
           ),
         ),
        ],
      )
      ),
    );
  }

  void _togglePasswordView() {
    setState(() {
      _isHidden = !_isHidden;
    });
  }
}
