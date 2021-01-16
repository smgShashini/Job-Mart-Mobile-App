//_______________________________________________________________________________________
// Class Description : Create app theme
//                     Display splash screen
// Linked Screens    : Login page
//_______________________________________________________________________________________

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:jobmart/screens/createAccount.dart';
import 'package:jobmart/screens/homePage.dart';
import 'package:jobmart/screens/jobCategoryPage.dart';
import 'package:jobmart/screens/loginPage.dart';

import 'package:jobmart/screens/signup.dart';
import 'package:jobmart/screens/worker.dart';
import 'package:splashscreen/splashscreen.dart';
import 'package:provider/provider.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MultiProvider(
    providers: [

      ChangeNotifierProvider(
        create: (context) => WorkerNotifier(),
      ),
    ],
    child: MyApp(),
  ));

  
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
       // Add the builder here
      debugShowCheckedModeBanner: false,
      theme: ThemeData(



        // Define the default brightness and colors.
        // Define the  font family.
        fontFamily: 'Roboto',
        backgroundColor: Color(0xFFB4A3B3B),


      ),
      home:HomePage(),





    );
  }
}

 //[Begin] : Class Splash
class Splash extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SplashScreen(
      seconds: 5,
      navigateAfterSeconds: Loginpage(),
      title: new Text('Job Mart',textScaleFactor: 2,style: TextStyle(color: Color(0xFFB4A3B3B), fontFamily: 'Roboto-Bold'),),
      loadingText: Text("Loading"),
      image: Image.asset('assets/images/splash.jpg'),

      photoSize: 100.0,
      loaderColor: Color(0xFFB4A3B3B),
    );
  }
}// [End] : Class Splash







