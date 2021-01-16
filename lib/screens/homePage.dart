//_______________________________________________________________________________________
// Class Description : Homepage
//                     Let user to switch between home tab, account tab and worker tab
// Linked Screens    : Homedashboard, Account page,
//_______________________________________________________________________________________


import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:jobmart/screens/homeDshboardPage.dart';
import 'package:jobmart/screens/workerProfile.dart';

// [Begin] : class HomePage
class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar:AppBar(
          backgroundColor: Color(0xFFB4A3B3B),
          title: Text('Job Mart - Find your help' ,style: TextStyle(color:  Colors.white,fontSize: 16),),
          actions: [
            IconButton(
              icon: Icon(Icons.menu,color: Colors.white,),
              onPressed: (){},
            )
          ],
          elevation: 10.0,
          bottom: TabBar(
            tabs: [
              Tab(icon: Icon(Icons.home,color: Colors.white,),
                child:Text('Home',style: TextStyle(color: Colors.white),),),
              Tab(icon: Icon(Icons.account_box,color: Colors.white,),
                child:Text('My Account',style: TextStyle(color: Colors.white),),),
//              Tab(icon: Icon(Icons.work,color: Colors.white,),
//                child:Text('Workers',style: TextStyle(color: Colors.white),),),
            ],
          ),
        ),

        body: TabBarView(

          children: [
           Homedashboard(),
            WorkerProfile(),
            //Icon(Icons.directions_transit),

          ],
        ),




      ),
    );
  }
} // [End] : class HomePage
