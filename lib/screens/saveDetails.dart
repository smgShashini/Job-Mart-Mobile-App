import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SaveDetail extends StatefulWidget {


  @override
  _SaveDetailState createState() => _SaveDetailState();
}

class _SaveDetailState extends State<SaveDetail> {



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: RaisedButton(
          child: Text('Save Details in data base'),
        ),

      )

    );
  }
}
