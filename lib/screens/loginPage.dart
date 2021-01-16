//_______________________________________________________________________________________
// Class Description : Statefull class
//                      - state 0 : let user to log as a seeker or a worker
//                      - state 1 : let user to log entering user name and password
//                                  Create new account -> Account class
//                     Set root class to Loginpage class
// Linked Screens    : Login page , Create Account
//_______________________________________________________________________________________


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jobmart/screens/accoutPage.dart';
import 'package:jobmart/screens/homePage.dart';
import 'package:jobmart/screens/inputWithIcon.dart';
import 'package:jobmart/screens/primaryButton.dart';
import 'package:jobmart/screens/signIn.dart';
import 'package:jobmart/screens/signup.dart';
import 'package:firebase_auth/firebase_auth.dart';


// [Begin] : Login root class
class Loginpage extends StatefulWidget {
  @override
  _LoginpageState createState() => _LoginpageState();
}

class _LoginpageState extends State<Loginpage> {
  String _userType ='';
  int _pageState=0;
  var _backgroundColor = Colors.white;
  var _headingColor = Color(0xFFB4A3B3B);
  var _descriptioncolor = Color(0xFFB4A3B3B);
  double _loginYOffSet = 0;
  double _loginXOffSet = 0;
  double windowWidth = 0;
  double windowHeight =0;

  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    windowWidth = MediaQuery.of(context).size.width;
    windowHeight = MediaQuery.of(context).size.height;

    switch (_pageState){
      case 0:
        _backgroundColor = Colors.white;
        _headingColor = Color(0xFFB4A3B3B);
        _descriptioncolor = Color(0xFFB5E4242);
        _loginYOffSet = windowHeight;
        break;
      case 1:
        _backgroundColor = Color(0xFFB5E4242);
        _headingColor = Colors.white;
        _descriptioncolor = Colors.white;
        _loginYOffSet = 160;
        break;
      case 2:
        _backgroundColor = Color(0xFFB5E4242);
        _headingColor = Colors.white;
        _descriptioncolor = Colors.white;
        _loginYOffSet = windowHeight;

        break;
    }
    return Scaffold(
      body: new Theme(
        data: new ThemeData(
          primaryColor: Color(0xFFB4A3B3B),
          hintColor: Color(0xFFB4A3B3B),
        ),
        child: Stack(
          children: [
            //--------------- [Begin] : State 0 ----------------------------------
            AnimatedContainer(

              curve: Curves.fastLinearToSlowEaseIn,
                duration: Duration(
                    milliseconds: 100
                ),
                color: _backgroundColor,

                child: Center(

                  child: Column(
                    children: [
                      //--------------- [Begin] : Main heading  ------------------
                      Container(
                          margin: EdgeInsets.only(top: 50),
                          child: Text('Job Mart',style: TextStyle(color: _headingColor,fontSize: 25,fontFamily: 'Roboto-Bold'))),
                      //--------------- [End] : Main heading  --------------------


                      //--------------- [Begin] : Description  -------------------
                      Container(
                          padding: EdgeInsets.all(15),
                          child : Text('We provide help you need at home. Log into Job Mart',
                            style: TextStyle(color: _descriptioncolor,fontSize: 16),textAlign: TextAlign.center,)
                      ),
                      //--------------- [End] : Description  ---------------------


                      //--------------- [Begin] : Logo container  ----------------
                      Container(
                        margin: EdgeInsets.only(top: 20),
                        width: 200,
                        height: 200,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            image: AssetImage('assets/images/bear.jpg'),

                          ),


                        ),

                      ),
                      //--------------- [End] : Logo container  ------------------


                      //--------------- [Begin] : Choice section  ----------------
                      Container(
                        margin: EdgeInsets.only(top: 70),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children:[
                            // Seeker button
                            GestureDetector(
                              child: FlatButton(
                                color:  Color(0xFFB4A3B3B),
                                highlightColor: Colors.white,
                                padding: EdgeInsets.only(left: 20,right: 20,top: 10,bottom: 10),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(25.0),

                                ),

                                child: Text('As a seeker',style: TextStyle(color: Colors.white,fontSize: 16),),
                                onPressed: (){
                                  setState(() {
                                    _pageState=1;
                                    _userType='seeker';
                                  });
                                },



                              ),


                            ),

                            // Worker button
                            FlatButton(
                              color:  Color(0xFFB4A3B3B),
                              highlightColor: Colors.white,
                              padding: EdgeInsets.only(left: 20,right: 20,top: 10,bottom: 10),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(25.0),

                              ),
                              onPressed: (){
                                setState(() {
                                  _pageState=1;
                                  _userType='worker';
                                });
                              },
                              child: Text('As a worker',style: TextStyle(color: Colors.white,fontSize: 16),),


                            ),
                          ],
                        ),


                      )
                      //--------------- [End] : Choice section  ------------------

                    ],
                  ),

                )

            ),
            //--------------- [End]   : State 0 ----------------------------------


            //--------------- [Begin] : State 1 ----------------------------------
            GestureDetector(
              child: AnimatedContainer(
                curve: Curves.fastLinearToSlowEaseIn,
                duration: Duration(
                  milliseconds: 100,
                ),

                transform: Matrix4.translationValues(0, _loginYOffSet, 1),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(25),
                      topRight: Radius.circular(25)
                  ) ,
                ),
                child: Column(
                  children: [

                    Container(
                      margin: EdgeInsets.only(top: 70),
                      child: Column(
                        children: [

                          Container(

                            child: TextField(
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

                            child: TextField(
                              decoration: InputDecoration(
                                  prefixIcon: Icon(Icons.keyboard),
                                  labelText: 'Password',
                                  hintText: 'Enter your password',
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(30),
                                  )


                              ),

                              obscureText: true,
                              controller: _password,


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

                        signIntoJobMartwithEmailAndPassword(_email.text,_password.text);
                      },
                      child: Text('Log in ',style: TextStyle(color: Colors.white,fontSize: 16),),
                    ),

                    SizedBox(height: 40,),
                    GestureDetector(
                        onTap:(){
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (_){
                                return SignUp(userType: _userType,);
                              }
                          ));

                        },

                        child: Text('New to Job Mart ?? Sign Up ')

                    ),

                  ],
                ),
              ),
              onTap:(){
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (_){
                      return Loginpage();
                    }
                ));

              },
            ),
            //--------------- [End]   : State 1 ----------------------------------
          ],

        ),
      ),

    );
  }
   void signIntoJobMartwithEmailAndPassword(String email, String password) async{

     try{
       UserCredential newUser = await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password:password);
       Navigator.of(context).push(MaterialPageRoute(
           builder: (_){
             return HomePage();
           }
       ));
     }
     catch(e){
       print(e);
     }



  }
}// [End] : Login root class




// [Begin] : Inputwithicon class
//class CreateNewAccount extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) {
//    return GestureDetector(
//      child: Container(
//        margin: EdgeInsets.only(top: 10,left: 97,right: 80),
//        child: Center(
//            child: Text('New to job mart ? Sign Up',style: TextStyle(fontSize: 16,color: Color(0xFFB4A3B3B) ),)),
//      ),
//      onTap: (){
//        Navigator.of(context).push(MaterialPageRoute(
//            builder: (_){
//              return;           }
//        ));
//
//      },
//    );
//  }
//} // [Begin] : Inputwithicon class





