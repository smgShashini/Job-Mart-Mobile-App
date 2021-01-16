// _____________________________________________________________________________
// [Begin] : Primary button class
// Description : Creates a FlatButton navigates to HomePage class
//______________________________________________________________________________
import 'package:flutter/material.dart';
import 'package:jobmart/screens/homePage.dart';

class Primarybutton extends StatefulWidget {
  final String btnText;

  Primarybutton({this.btnText});
  @override
  _PrimarybuttonState createState() => _PrimarybuttonState();
}

class _PrimarybuttonState extends State<Primarybutton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 30),
      child: Center(
        child: Container(
          margin: EdgeInsets.only(top: 0),
          child: FlatButton(
            color: Color(0xFFB4A3B3B),
            padding: EdgeInsets.only(left: 40,right: 40,top: 10,bottom: 10),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25.0),

            ),
            onPressed: (){
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (_){
                    return HomePage();
                  }
              )
              );
            },
            child: Text(widget.btnText,style: TextStyle(color: Colors.white,fontSize: 16),),


          ),
        ),
      ),
    );
  }
}
// [End] : Primary button class