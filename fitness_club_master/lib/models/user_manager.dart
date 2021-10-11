import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:fitness_club/helpers/firebase_errors.dart';
import 'package:fitness_club/models/User_model.dart';
import 'package:firebase_core/firebase_core.dart';
/*import 'package:fitness_club/flutter_facebook_login.dart';*/

class UserManager extends ChangeNotifier{

  UserManager() {
    print('vamos la: usermanager');
    /*_loadCurrentUaser();*/
  }

  bool _loading = false;
  bool get loading => _loading;

  User_model user = User_model();


  final FirebaseAuth auth = FirebaseAuth.instance;
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  set loading(bool value){
    _loading = value;
    notifyListeners();
  }

  Future<void> _loadCurrentUaser({required User firebaseUser}) async {
    final User currentUser = firebaseUser;
    if (currentUser != null) {
      DocumentSnapshot<Map<String, dynamic>> docUser =
                                      await firestore.collection('users')
          .doc(currentUser.uid).get();
      user = User_model.fromDocument(docUser);

      user.saveToken();

      final docAdmin = await firestore.collection('admins')
          .doc(user.id).get();

      if (docAdmin.exists) {
        user.admin = true;
      }
      notifyListeners();
    }
  }

  bool get isLoggedIn => user != null;

  Future<void> sigIn({required User_model user,
                      required Function onFail,
                  required Function onSuccess}) async{

    loading = true;
    print('começando a autenticação');
    try {
      final UserCredential result = await auth.signInWithEmailAndPassword(
          email: user.email,
          password: user.password);

      await _loadCurrentUaser(firebaseUser: result.user!);

      onSuccess();
    } on FirebaseAuthException  catch (e) {
      print('resultados....');
      /*var dados = getErrorString(e.code) ?? 'FODA-SE';*/

      onFail(getErrorString(e.code));

    }
    loading = false;

  }

  Future<void> signUp({required User_model user,
                        required Function onFail,
                required Function onSuccess}) async {

    loading = true;
    try {
      final UserCredential result = await auth.createUserWithEmailAndPassword(
          email: user.email,
          password: user.password);

      user.id = result.user!.uid;
      this.user = user;
      await user.saveData();
      /*user.saveToken();*/

      onSuccess();

    } on PlatformException catch (e){
      onFail(getErrorString(e.code));
    }
    loading = false;
  }


}