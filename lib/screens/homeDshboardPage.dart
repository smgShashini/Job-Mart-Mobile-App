//_______________________________________________________________________________________
// Class Description : Homedashboard
//                     Let users to search workers by job tittle and location
//                     Let user to choose job category
//                     Best workers suggestions as a list
// Linked Screens    : All the job category pages
//_______________________________________________________________________________________


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jobmart/screens/jobCategoryPage.dart';
import 'package:jobmart/screens/loginPage.dart';


class Homedashboard extends StatelessWidget {
  //final ScrollController _scrollController = ScrollController();
  final List<String> names = <String>['Baby Sitter', 'Mason', 'Indoor Helper', 'Painter',
                                      'Pipe Bass', 'Roof fixer', 'Carpenter', 'Garden Helper',
                                      ];
  //final List<int> msgCount = <int>[2, 0, 10, 6, 52, 4, 0, 2];
  //final List<IconData> _iconlist = <IconData>[Icons.account_box,Icons.account_box,Icons.account_box,Icons.account_box,Icons.account_box,Icons.account_box,Icons.account_box,Icons.account_box];
  final List<Image> _imageList = <Image>[Image.asset('assets/images/baby_sitter.jpg'),Image.asset('assets/images/brush.png'),
                                         Image.asset('assets/images/tool.png'),Image.asset('assets/images/painter.png'),
                                          Image.asset('assets/images/water tap.png'),Image.asset('assets/images/roof.jpg'),
                                          Image.asset('assets/images/carpenter.png'),Image.asset('assets/images/tree.png'),];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // Search Section
          Container(
            margin: EdgeInsets.only(right: 10,top: 10),

            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,

              children: [
                // Search by job tittle
                Container(
                  margin: EdgeInsets.only(left: 10),
                  width: 145.0,
                  height: 35.0,
                  child: TextField(
                    decoration:InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30)
                        ),
                        labelText: 'Job tittle'
                    ),
                  ),
                ),

                // Search by location
                Container(
                  margin: EdgeInsets.only(left: 10),
                  width: 145.0,
                  height: 35.0,
                  child: TextField(
                    decoration:InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30)
                        ),
                        labelText: 'Location'
                    ),
                  ),
                ),

                // Search icon
                Container(
                    child: Icon(Icons.search,)

                ),
              ],
            ),
          ),

          //----------------------  [Begin ] : Job category section  -----------------------
          Container(
            height: 125,
            margin: EdgeInsets.only(top: 10),
            child: Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: names.length,
                itemBuilder: (BuildContext context, int index){
                  return GestureDetector(
                    child: Container(
                      width: 80,
                      margin: EdgeInsets.all(5.0),
                      padding: EdgeInsets.all(10),
                      color: Colors.white,
                        child: Column(
                          children: [
                            Container(
                              child: _imageList[index],
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 10),
                                child: Text('${names[index]}',style: TextStyle(fontSize: 14,color:Colors.black ),))
                          ],
                        ),
                    ),
                    onTap: (){
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (_){
                            return JobCategory(jobCategory:names[index]);
                          }
                      ));
                      // TODO: Navigate to job category page
                    },
                  );
                }
                ),
              ),
          ),
//----------------------  [End ] : Job category section  -----------------------


          Container(
            margin: EdgeInsets.only(top: 15,bottom: 10),

            child: Text('Best Workers ',style: TextStyle(color: Color(0xFFB4A3B3B),fontSize: 17),)
          ),


          Expanded(
            child: ListView.builder(
              shrinkWrap: true,
              itemBuilder: (ctx,int){
                return Card(
                  child: ListTile(
                      title: Text('Motivation $int'),
                      subtitle: Text('this is a description of the motivation'),


                  ),
                );
              },
            ),
          ),

        ],
      )




    );
  }
}

class JobButton extends StatelessWidget {
  final String jobBtnTittle;
  final Icon jobIcon;
  JobButton({this.jobBtnTittle,this.jobIcon});
  @override
  Widget build(BuildContext context) {
    return Container(

      child: ButtonTheme(
        child: RaisedButton.icon(
          onPressed: (){ print('Button Clicked.'); },
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(180.0))),
          label: Text(jobBtnTittle,
            style: TextStyle(color: Colors.white,fontSize: 14),
          ),
            icon: jobIcon,


          //textColor: Colors.white,
          splashColor: Colors.white,
          color: Color(0xFFB4A3B3B)),
      )

    );
  }
}

