import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:fitness_club/login_page/login.dart';
import 'package:fitness_club/screens/signup/signup_screen.dart';
import 'package:fitness_club/screens/base/base_screen.dart';
/*import 'package:models/user_manager.dart';*/
import 'package:fitness_club/models/user_manager.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(FitnessClub());
}

class FitnessClub extends StatelessWidget {
  /*const FitnessClub({Key? key}) : super(key: key);*/
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => UserManager(),
          lazy: false,
        ),
      ],
      child :MaterialApp(
      title: 'The Fitness Club',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: const Color.fromARGB(255, 4, 125, 141),
        scaffoldBackgroundColor: const Color.fromARGB(255, 4, 125, 141),
        appBarTheme: const AppBarTheme(
            elevation: 0
        ),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case '/':
            return MaterialPageRoute(
                builder: (_) => LoginPage()
            );
          case '/signup':
            return MaterialPageRoute(
                builder: (_) => SignUpScreen()
            );
          case '/home':
            return MaterialPageRoute(
              builder: (_) => BaseScreen(),
            );
        }
      }
    ),
    );
  }
}
