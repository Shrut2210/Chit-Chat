import 'dart:io';

import 'package:client/HomePage.dart';
import 'package:client/personalInfomation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

class Editprofile extends StatefulWidget {  @override
  State<Editprofile> createState() => _EditprofileState();
}

class _EditprofileState extends State<Editprofile> {

  Map<String, String> data = {
    'name' : '',
    'email' : '',
    'bio' : '',
    'contact_no' : '',
    'profile_picture' : ''
  };

  File? image_data;
  final TextEditingController profilePictureController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController bioController = TextEditingController();
  final TextEditingController contactNoController = TextEditingController();

  void initState() {
    super.initState();
    getData();
  }

  Future getData() async {
    Map<String, String> temp = await getProfileData();

    setState(() {
      data = temp;
    });
    profilePictureController.text = data['profile_picture'] ?? '';
    nameController.text = data['name'] ?? '';
    bioController.text = data['bio'] ?? '';
    contactNoController.text = data['contact_no'] ?? '';
  }

  Future pickImage() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);

      if ( image == null ) return ;

      final imageTemp = File(image.path);
      profilePictureController.text = imageTemp.toString();

      setState(() => image_data = imageTemp);
    }
    catch (e) {
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Image.asset("assets/images/login_bg_2.jpeg", fit: BoxFit.cover,),
          ),
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            alignment: Alignment.center,
            color: Color.fromRGBO(0, 0, 0, 0.75),
            child: Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width*2/3,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  InkWell(
                    child: Stack(
                      children : [
                        Container(
                          height: 250,
                          width: 250,
                          child: Icon(Icons.account_circle, size: 250,color: Colors.white38,),
                        ),
                        Container(
                          height: 230,
                          width: 220,
                          alignment: Alignment.bottomRight,
                          child: Icon(Icons.edit_note, color: Colors.white, size: 40,),
                        )
                      ]
                    ),
                    onTap: pickImage
                  ),
                  TextFormField(
                    controller: nameController,
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      labelStyle: TextStyle(color: Colors.white),
                      labelText: 'name',
                      border: UnderlineInputBorder(),
                    ),
                  ),
                  SizedBox(height: 10,),
                  TextFormField(
                    controller: bioController,
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      labelStyle: TextStyle(color: Colors.white),
                      labelText: 'bio',
                      border: UnderlineInputBorder(),
                    ),
                  ),
                  SizedBox(height: 10,),
                  TextFormField(
                    keyboardType: TextInputType.number,
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.digitsOnly
                    ],
                    controller: contactNoController,
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      labelStyle: TextStyle(color: Colors.white),
                      labelText: 'contactNo',
                      border: UnderlineInputBorder(),
                    ),
                  ),
                  SizedBox(height: 20,),
                  InkWell(
                    child: Container(
                        padding: EdgeInsets.all(6),
                        width: MediaQuery.of(context).size.width*3/4,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          color: Colors.white,
                        ),
                        child: Center(
                            child : Text('Save', style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold, color: Colors.black) )
                        )
                    ),

                    onTap: () async {
                      final response = await editProfile(
                          profilePicture: profilePictureController.text,
                        name:  nameController.text,
                        bio: bioController.text,
                        contact_no: contactNoController.text
                      );

                      showDialog(context: context, builder: (context) =>
                          AlertDialog(
                            backgroundColor: Colors.black,
                            shadowColor: Colors.white24,
                            elevation: 30,
                            content: Text(response, style: TextStyle(color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold),),
                            actions: [
                              TextButton(
                                onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (builder) {
                                  return Homepage();
                                })),
                                child: Text("Ok", style: TextStyle(color: Colors.blue, fontSize: 20, fontWeight: FontWeight.bold),),
                              ),
                            ],
                          )
                      );
                    },
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
    // TODO: implement build
    throw UnimplementedError();
  }}
