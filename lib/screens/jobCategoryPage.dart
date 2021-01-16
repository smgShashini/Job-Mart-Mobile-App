//_______________________________________________________________________________________
// Class Description : jobCategory
//                     Let user to choose workers
// Action            : Make a phone call to worker
// Linked Screens    :
//_______________________________________________________________________________________

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:jobmart/screens/worker.dart';
import 'package:provider/provider.dart';

// TODO: style the page


class JobCategory extends StatefulWidget {
  final String jobCategory;
  JobCategory({this.jobCategory});


  @override
  _JobCategoryState createState() => _JobCategoryState();
}

class _JobCategoryState extends State<JobCategory> {


  //CollectionReference databaseRef = FirebaseFirestore.instance.collection('test');

  List finalWorkerList =[];

  @override
  void initState() {
    fetchData();
    super.initState();
  }

  fetchData()async{
    dynamic result = await getWorkerDetails();
    if (result==null){
      print('No data');
    }else{
      setState(() {
        finalWorkerList=result;
      });
    }

  }



  @override
  Widget build(BuildContext context) {
    WorkerNotifier workerNotifier = Provider.of<WorkerNotifier>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.jobCategory),
      ),
      body: ListView.separated(
          itemBuilder: (BuildContext context,int index){
            return ListTile(
              leading: CircleAvatar(radius: 50,),
              title:Text('${finalWorkerList[index]['name']}'),
              subtitle: Text('${finalWorkerList[index]['location']}'),
            );
          },
          itemCount: finalWorkerList.length,
          separatorBuilder: (BuildContext context,int index){
            return Divider(color: Colors.black,);
          },
        )

    );
  }
//  getDataFromDatabase(WorkerNotifier workerNotifier)async{
//    QuerySnapshot querySnapshot = await FirebaseFirestore.instance.collection('worker').get();
//    List <Worker> workerList =[];
//    querySnapshot.docs.forEach((doc) {
//      Worker worker = Worker.fromMap(doc.data());
//      workerList.add(worker);
//
//    });
//    workerNotifier.workerList=workerList;
//  }

  Future getWorkerDetails () async{
    List workerList =[];
    try{
      await FirebaseFirestore.instance.collection(widget.jobCategory).get().then((querySnapshot){
        querySnapshot.docs.forEach((element) {
          workerList.add(element.data());
        });

      });
      return workerList;


    }catch(e){
      print(e.toString());

    }
  }
}


