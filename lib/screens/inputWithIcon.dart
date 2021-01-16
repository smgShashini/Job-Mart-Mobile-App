//_______________________________________________________________________________________
// Class Description : Create a styled textfiel widget
//_______________________________________________________________________________________



import 'package:flutter/material.dart';

// [Begin] : Inputwithicon class
class Inputwithicon extends StatelessWidget {
  final String textFiledName ;
  final String textFieldHint ;
  final Icon textIcon;
  Inputwithicon({this.textFieldHint,this.textFiledName,this.textIcon});


  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 10),
      margin: EdgeInsets.only(left: 40,right: 40),
      child: Column(
        children: [

          // User name text field
          new Theme(
            data: new ThemeData(
              primaryColor: Color(0xFFB4A3B3B),
              //primaryColorDark: Colors.blue,
            ),
            child: Container(
              height: 40,
              child: new TextField(
                decoration: new InputDecoration(


                  border: new OutlineInputBorder(
                    borderSide: new BorderSide(color: Colors.red),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  hintText: textFieldHint,
                  labelText: textFiledName,



                  prefixIcon: textIcon,




                ),
              ),
            ),
          ),

          // Password text filed


        ],
      ),


    );







  }
}

// [End] : Inputwithicon class
