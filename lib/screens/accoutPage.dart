//_______________________________________________________________________________________
// Class Description : Display worker account
// Linked Screens    :
//_______________________________________________________________________________________



import 'package:flutter/material.dart';
import 'package:jobmart/screens/inputWithIcon.dart';
import 'package:jobmart/screens/primaryButton.dart';
import 'package:path/path.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';


class NewAccount extends StatefulWidget {
  @override
  _NewAccountState createState() => _NewAccountState();
}

class _NewAccountState extends State<NewAccount> {
  File _image;
  List<File> _images = [];
  @override
  Widget build(BuildContext context) {
    Future getImage(bool gallery) async {
      ImagePicker picker = ImagePicker();
      PickedFile pickedFile;
      // Let user select photo from gallery
      if(gallery) {
        pickedFile = await picker.getImage(
          source: ImageSource.gallery,);
      }
      // Otherwise open camera to get new photo
      else{
        pickedFile = await picker.getImage(
          source: ImageSource.camera,);
      }

      setState(() {
        if (pickedFile != null) {
          _images.add(File(pickedFile.path));
          //_image = File(pickedFile.path); // Use if you only need a single picture
        } else {
          print('No image selected.');
        }
      });
    }
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).backgroundColor,
        title: Text('Create New Account'),
        actions: [
          IconButton(
            icon: Icon(Icons.menu,color: Colors.white,),
            onPressed: (){
              getImage(true);
            },
          )
        ],
      ),

      body: Builder(

        builder: (context)=> Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // ______circle frame to picture_____
                  Align(
                    alignment: Alignment.center,
                    child: CircleAvatar(
                      radius: 100,
                      backgroundColor: Color(0xFFB4A3B3B),
                      child: ClipOval(
                        child: SizedBox(
                          width: 195,
                          height: 195,
                          child:  (_image!=null)?Image.file(_image,fit: BoxFit.fill,):
                          Image.asset('assets/images/bear.jpg'),


                        ),
                      ),
                    ),

                  ),

                  //_____ Camera icon_______
                  Padding(
                    padding: EdgeInsets.only(top: 130),
                    child: IconButton(
                      icon: Icon(Icons.add_a_photo,size: 30.0,color: Color(0xFFB4A3B3B)),
                      onPressed: (){
                        getImage(true);
                      },
                    ),
                  )
                ],
              ),
              SizedBox(height: 10,),

                  Inputwithicon(
                    textFieldHint: 'Enter your name',
                    textFiledName: 'Name',
                    textIcon: Icon(Icons.account_box_rounded),
                  ),
                  Inputwithicon(
                    textFieldHint: 'Enter your name',
                    textFiledName: 'Name',
                    textIcon: Icon(Icons.account_box_rounded),
                  ),
                  Inputwithicon(
                    textFieldHint: 'Enter your name',
                    textFiledName: 'Name',
                    textIcon: Icon(Icons.account_box_rounded),
                  ),
                  Inputwithicon(
                    textFieldHint: 'Enter your name',
                    textFiledName: 'Name',
                    textIcon: Icon(Icons.account_box_rounded),
                  ),
                  Inputwithicon(
                    textFieldHint: 'Enter your name',
                    textFiledName: 'Name',
                    textIcon: Icon(Icons.account_box_rounded),
                  ),

                  // Button row
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Primarybutton(
                        btnText: 'Delete',
                      ),
                      Primarybutton(
                        btnText: 'Save',
                      ),

                    ],
                  ),

                ],
              ),



              // Set profile section








        ),
      ),

    );
  }
}

