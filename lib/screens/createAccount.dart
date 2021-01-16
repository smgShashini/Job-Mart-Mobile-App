//_______________________________________________________________________________________
// Class Description : Let workers to create account
//                     Upload image
//                     Input text
// Actions           : Save entered data into firestore
// Linked Screens    : Homepage
//_______________________________________________________________________________________



import 'package:flutter/material.dart';
import 'package:jobmart/screens/homeDshboardPage.dart';
import 'package:jobmart/screens/homePage.dart';
import 'package:jobmart/screens/inputWithIcon.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:jobmart/screens/loginPage.dart';


class CreateAccount extends StatefulWidget {
  final String newWorkerUid;
  CreateAccount({this.newWorkerUid});
  @override
  _CreateAccountState createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> {

  TextEditingController workerName = TextEditingController();
  TextEditingController workerJob = TextEditingController();
  TextEditingController workingLocation = TextEditingController();
  TextEditingController workerPhone = TextEditingController();
  TextEditingController workerAge = TextEditingController();
  TextEditingController workingExperience = TextEditingController();









  @override
  Widget build(BuildContext context) {
    return Scaffold(

      //color: Colors.white,

      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SizedBox(height: 30,),
            //------------ [Begin] Upload image section --------------------------
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 75,
                  backgroundColor: Color(0xFFB4A3B3B),
                ),
                Container(
                  margin: EdgeInsets.only(top: 90),
                    child: Icon(Icons.camera_alt,color: Color(0xFFB4A3B3B),)),
              ],
            ),
            //------------ [End] Upload image section ---------


            //------------ [Begin] Text field section ---------
            SizedBox(height: 10,),
            Container(
              child: TextFormField(
                decoration: InputDecoration(
                    prefixIcon: Icon(Icons.account_box),
                    labelText: 'Name',
                    hintText: 'Enter your name',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                    )
                ),
                controller: workerName ,

              ),
              margin: EdgeInsets.only(left: 20,right: 20),
              height: 40,
            ),
            SizedBox(height: 5,),
            Container(
              child: TextFormField(
                decoration: InputDecoration(
                    prefixIcon: Icon(Icons.work),
                    labelText: 'Job',
                    hintText: 'Enter your job',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                    )
                ),
                controller: workerJob,

              ),
              margin: EdgeInsets.only(left: 20,right: 20),
              height: 45,
            ),
            SizedBox(height: 5,),
            Container(

              child: TextFormField(
                decoration: InputDecoration(
                    prefixIcon: Icon(Icons.location_on),
                    labelText: 'Working Location',
                    hintText: 'Enter your working location',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                    )
                ),
                controller: workingLocation ,

              ),
              margin: EdgeInsets.only(left: 20,right: 20),
              height: 45,
            ),
            SizedBox(height: 5,),
            Container(

              child: TextFormField(
                decoration: InputDecoration(
                    prefixIcon: Icon(Icons.phone),
                    labelText: 'Phone Number',
                    hintText: 'Enter your phone number',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                    )
                ),
                controller: workerPhone ,

              ),
              margin: EdgeInsets.only(left: 20,right: 20),
              height: 45,
            ),
            SizedBox(height: 5,),
            Container(

              child: TextFormField(
                decoration: InputDecoration(
                    prefixIcon: Icon(Icons.calendar_today),
                    labelText: 'Age',
                    hintText: 'Enter your age',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                    )
                ),
                controller: workerAge ,

              ),
              margin: EdgeInsets.only(left: 20,right: 20),
              height: 45,
            ),
            SizedBox(height: 5,),
            Container(

              child: TextFormField(
                decoration: InputDecoration(
                    prefixIcon: Icon(Icons.keyboard),
                    labelText: 'Experience',
                    hintText: 'Enter your experience',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                    )
                ),
                controller: workingExperience ,

              ),
              margin: EdgeInsets.only(left: 20,right: 20),
              height: 45,
            ),
            SizedBox(height: 10,),
            //------------ [End] Text field section ------------------------------


            //------------ [Begin]Delete and Save button section -----------------
            Container(
              margin: EdgeInsets.only(left: 20,right: 20,top: 10,bottom: 40),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  FlatButton(
                    color:  Color(0xFFB4A3B3B),
                    padding: EdgeInsets.only(left: 40,right: 40,top: 10,bottom: 10),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25.0),
                    ),
                    onPressed: (){
                      Navigator.of(context).push(MaterialPageRoute(builder: (_){return Loginpage();}));
                      // TODO : close app or continue alert dialog box
                      // navigate to a screen that ask again to create account or close app

                    },
                    child: Text('Cancel',style: TextStyle(color: Colors.white,fontSize: 16),),
                  ),
                  FlatButton(
                    color:  Color(0xFFB4A3B3B),
                    padding: EdgeInsets.only(left: 40,right: 40,top: 10,bottom: 10),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25.0),
                    ),
                    onPressed: (){
                      saveWorkerDetailsTOCloud(widget.newWorkerUid,workerName.text, workerJob.text, workingLocation.text, workerPhone.text, workerAge.text, workingExperience.text);
                      showWelcomeAlertDialog(context, workerName.text);
                      //printName();


                    },
                    child: Text('Save',style: TextStyle(color: Colors.white,fontSize: 16),),
                  ),

                ],
              ),
            )
            //------------ [End]Delete and Save button section -------------------
          ],
        ),
      ),

    );
  }
  void printName(){
    print(widget.newWorkerUid);
  }




//------------ [Begin] Method section ------------------------------------------
//  showAlertDialog(BuildContext context) {
//    // Create button
//    Widget okButton = FlatButton(
//      child: Text("OK"),
//      onPressed: () {
//        Navigator.of(context).push(MaterialPageRoute(
//            builder: (_){
//              return HomePage();
//            }
//        ));
//      },
//    );
//
//    // Create AlertDialog
//    AlertDialog alert = AlertDialog(
//      title: Text("Hi Shashini"),
//      content: Text("Account created successfully. Welcome to job mart !"),
//      actions: [
//        okButton,
//      ],
//    );
//
//    // show the dialog
//    showDialog(
//      context: context,
//      builder: (BuildContext context) {
//        return alert;
//      },
//    );
//  }

  //[Begin] : Method saveWorkerDetailsToCloud
  void saveWorkerDetailsTOCloud(String uid ,String name,String job,String location,String phone,String age,String experience){
    CollectionReference databaseRef = FirebaseFirestore.instance.collection('worker');
    databaseRef.doc(uid).set({
      'name':name,
      'job': job,
      'age': age,
      'location': location,
      'experience':experience,
      'phone':phone,
    });

 }
//[End] : Method saveWorkerDetailsToCloud
  showWelcomeAlertDialog(BuildContext context,String name) {
    // Create button
    Widget okButton = FlatButton(
      child: Text("OK"),
      onPressed: () {
        Navigator.of(context).push(MaterialPageRoute(builder: (_){return HomePage();}));

      },

    );

    // Create AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("Hi "+name),
      content: Text("Your account was created successfully.Welcome to Job Mart !"),
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





} // [End] : CrateAccount






