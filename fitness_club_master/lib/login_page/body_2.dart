import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:fitness_club/models/user_manager.dart';
import 'package:fitness_club/helpers/validators.dart';
import 'package:fitness_club/models/User_model.dart';


class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  bool _isHidden = true;

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passController = TextEditingController();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
        return Center(
          key: scaffoldKey,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
           child:  Column(
           mainAxisAlignment: MainAxisAlignment.center,
               children: [
                 Image.asset(
                   'assets/images/logo/logo.png',
                   height: 200.0,
                   width: 200.0,
                   alignment: Alignment.topCenter,
                 ),
                 const SizedBox(height: 4.0),
            Container(
              height: 150,
           child: Card(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            child: Form(
                key: formKey,
              child:  Consumer<UserManager>(
                builder: (_, userManager, __){
                  return ListView(
                    padding: const EdgeInsets.all(20),
                    shrinkWrap: true,
                    children: [
                      TextFormField(
                        controller: emailController,
                        enabled: !userManager.loading,
                        decoration: const InputDecoration(
                          icon: Icon(Icons.person),
                          hintText: 'email',
                        ),
                        keyboardType: TextInputType.emailAddress,
                        autocorrect: false,
                        validator: (email){
                          if(!emailValid(email ?? ""))
                            return 'Email inválido';
                          return null;
                        },
                      ),
                      const SizedBox(height: 14.0),
                      TextFormField(
                        controller: passController,
                        enabled: !userManager.loading,
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
                        validator: (pass){
                          if(pass!.isEmpty || pass.length < 6) {
                            return 'Senha inválida';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 51.0),
                      Align(
                        alignment: Alignment.centerRight,
                        child: FlatButton(
                          onPressed: (){

                          },
                          padding: EdgeInsets.zero,
                          child: const Text(
                              'Esqueci minha senha'
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
                      ElevatedButton(
                        onPressed: userManager.loading ? null : (){
                          if(formKey.currentState!.validate()){
                            userManager.sigIn(
                                user: User_model(
                                    email: emailController.text,
                                    password: passController.text
                                ),
                                onFail: (e){
                                  Scaffold.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text('Falha ao entrar: $e'),
                                        backgroundColor: Colors.red,
                                      )
                                  );
                                },
                                onSuccess: (){
                                  //Navigator.of(context).pop();
                                  Navigator.of(context).pushReplacementNamed('/home');
                                }
                            );
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          primary: Colors.black,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                        ),
                        child: const Text('Sign-In'),
                      ),
                      const SizedBox(height: 16),
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
                  );
                },

              ),
            )
          )
            )
          ]
          )
          )
        );
  }

  void _togglePasswordView() {
    setState(() {
      _isHidden = !_isHidden;
    });
  }
}
