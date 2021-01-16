//_______________________________________________________________________________________
// Class Description : Let users to enter email and password to sign up
// Action            : Create new user in firebase authentication
// Linked Screens    : Create worker profile
//_______________________________________________________________________________________


import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:jobmart/screens/createAccount.dart';
import 'package:jobmart/screens/homePage.dart';
import 'package:jobmart/screens/homescreen.dart';
import 'package:flutter/material.dart';
import 'package:jobmart/screens/inputWithIcon.dart';
import 'package:jobmart/screens/loginPage.dart';
import 'package:jobmart/screens/saveDetails.dart';
import 'package:jobmart/screens/workerProfile.dart';

//[Begin] : Class SignUp
class SignUp extends StatelessWidget {

  final String userType;
  SignUp({this.userType});

  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();
//  String newWorkeruid;
//  String enteredMail;
//  String enteredPassword;
//  String userType ='seeker';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: new Theme(
        data: new ThemeData(
          primaryColor: Color(0xFFB4A3B3B),
          hintColor: Color(0xFFB4A3B3B),
        ),
        child: Center(
          child :Column(
            children: [
              Container(
                margin: EdgeInsets.only(top: 70),
                child: Column(
                  children: [
                    SizedBox(height: 100,),

                    Container(

                      child: TextFormField(
                        decoration: InputDecoration(
                            prefixIcon: Icon(Icons.email),
                            labelText: 'Email',
                            hintText: 'Enter your email',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                            )

                        ),
                        controller: _email,

                      ),
                      margin: EdgeInsets.only(left: 20,right: 20),
                      height: 45,
                    ),
                    SizedBox(height: 20,),
                    Container(

                      child: TextFormField(
                        decoration: InputDecoration(
                            prefixIcon: Icon(Icons.keyboard),
                            labelText: 'Password',
                            hintText: 'Enter your password',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                            )


                        ),

                        obscureText: true,
                        controller: _password ,



                      ),
                      margin: EdgeInsets.only(left: 20,right: 20),
                      height: 45,
                    ),

                  ],
                ),

              ),

              SizedBox(height: 20,),

              FlatButton(
                color:  Color(0xFFB4A3B3B),
                padding: EdgeInsets.only(left: 40,right: 40,top: 10,bottom: 10),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25.0),
                ),
                onPressed: (){

                  signUptoJobMartwithEmailAndPassword(_email.text,_password.text,context);
                },
                child: Text('Sign Up ',style: TextStyle(color: Colors.white,fontSize: 16),),
              ),

            ],
          )

        ),
      ),

    );
  }

//  Future<void> createUser() async {
//    final FirebaseUser currentUser = (await FirebaseAuth.instance.createUserWithEmailAndPassword(email: 'Test@gmail.com', password: '123456')).user;
//    Firestore.instance.collection("users").document(currentUser.uid).setData({
//      "uid": currentUser.uid,
//    },
//    );
//  }

// [Begin] : Method Sign up with email and password
  Future signUptoJobMartwithEmailAndPassword(String email,String password,BuildContext context) async{

    CollectionReference databaseRef = FirebaseFirestore.instance.collection('test');


    try {
      //print(email);
//      print(password);
       final User newWorker = (await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password)).user;
      showAlertDialog(context,newWorker.uid);


    }
    catch(e){
      print(e);
    }
  }
  //  [End] : Method Sign up with email and password


// [Begin] : Method showAlertDialog
  showAlertDialog(BuildContext context,String uid) {
    // Create button
    Widget okButton = FlatButton(
      child: Text("OK"),
      onPressed: () {
        if(userType=='worker'){

          Navigator.of(context).push(MaterialPageRoute(builder: (_){return CreateAccount(newWorkerUid: uid,);}));
        }else{
          Navigator.of(context).push(MaterialPageRoute(builder: (_){return HomePage();}));
          
        }
      },
         
    );

    // Create AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("Welcome to Job Mart ! "),
      content: Text("You have successfully logged in."),
      actions: [
        okButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
// [End] : Method showAlertDialog


}//[End] : Class SignUp
