//_______________________________________________________________________________________
// Class Description : WorkerProfile
//                     View his/her own profile as a worker
//                     Show notification about new hiring
//                     Show work history
// Linked Screens    : 
//_______________________________________________________________________________________

import 'package:flutter/material.dart';

//[Begin] : WokerProfile class
class WorkerProfile extends StatefulWidget {
  @override
  _WorkerProfileState createState() => _WorkerProfileState();
}

class _WorkerProfileState extends State<WorkerProfile> {
  @override
  Widget build(BuildContext context) {

    return Container(
      margin: EdgeInsets.only(top: 20),
      child: Column(
        children: [
          //------------[Begin] : Worker detail section ------
          Container(
            margin: EdgeInsets.only(left: 20,right: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Column(
                  children: [
                    CircleAvatar(
                      radius: 60,
                    ),
                    Text('Daily fee : RS 1500/='),
                    Text('Rating Bar'),

                  ],
                ),
                Container(
                  child: Column(
                    children: [
                      Text('Name : '),
                      Text('Job : '),
                      Text('Contact number : '),
                      Text('Address : '),
                      Text('Experience : '),
                      Text('Edit button and availibility button '),
                    ],
                  ),
                )

              ],
            ),

          ),
          //------------[End] : Worker detail section --------

          SizedBox(
            height: 10,
          ),

          Container(
            child: Text('Working history'),
          )

        ],
      ),
    );
  }


  // [Begin] : Method show rating bar
  showRatingBar(){

  }
  // [End] : Method show rating bar
} //[End] : WorkerProfile class

