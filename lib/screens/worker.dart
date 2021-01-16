import 'dart:collection';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
class Worker{
  String age;
  String job;
  String name;
  String phone;
  String experience;
  String location;

  //Name constructor
  Worker.fromMap(Map<String,dynamic> data){
    age=data['age'];
    job=data['job'];
    name=data['name'];
    phone=data['phone'];
    experience = data['experience'];
    location= data['location'];
  }

}

class WorkerNotifier with ChangeNotifier{
  List <Worker> _workerList=[];
  Worker _currentWorker;
  UnmodifiableListView <Worker> get workerList => UnmodifiableListView(_workerList);
  Worker get currentWorker => _currentWorker;

  set workerList(List<Worker> workerList){
    _workerList = workerList;
    notifyListeners();

  }

  set currentWorker(Worker worker){
    _currentWorker = worker;
    notifyListeners();

  }






}