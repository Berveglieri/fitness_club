import 'dart:io';
import 'address.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

class User_model {

  var id;
  var email;
  var password;
  var cpf;
  var name;
  var confirmPassword;
  bool admin = false;
  /*Address address;*/

  User_model({this.email, this.password,
        this.name, this.id});

  User_model.fromDocument(DocumentSnapshot<Map<String, dynamic>> document){
    id = document.id;
    name = document.data()!['name'];
    email = document.data()!['email'];
    cpf = document.data()!['cpf'];

    /*if (document.data()!.containsKey('address')) {
      address = Address.fromMap(
          document.data()!['address'] as Map<String, dynamic>);
    }*/
  }

  CollectionReference get tokensReference =>
      firestoreRef.collection('tokens');

  DocumentReference get firestoreRef =>
      FirebaseFirestore.instance.doc('users/$id');


  Future<void> saveData() async{
    await firestoreRef.set(toMap());
  }

  Map<String, dynamic> toMap(){
    return {
      'name': name,
      'email': email,
      /*if(address != null)
      'address': address.toMap(),*/
      if(cpf != null)
      'cpf': cpf
};
}

  /*void setAddress(Address address){
    this.address = address;
    saveData();
  }*/

  void setCpf(String cpf){
    this.cpf = cpf;
    saveData();
  }

  Future<void> saveToken() async {
    final token = await FirebaseMessaging.instance.getToken();
    print('token console');
    print(token);
    await tokensReference.doc(token).set({
      'token': token,
      'updatedAt': FieldValue.serverTimestamp(),
      'platform': Platform.operatingSystem,
    });
  }

}
