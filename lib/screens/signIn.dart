//_______________________________________________________________________________________
// Class Description : Let users to signIn
// Actions           : Save entered data into firestore
//                     If user is a worker lead to create new account
// Linked Screens    : CreateNewAccount
//_______________________________________________________________________________________


import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';



class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  CollectionReference users = FirebaseFirestore.instance.collection('test');
  
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: FlatButton(
        child: Text('Save'),
        onPressed: (){
          users.add({
            'name':'Udara',
            'job': 'field officer',
            'location': 'Anuradhapura',
          });
        },
      ),
      
      
    );
  }
}
