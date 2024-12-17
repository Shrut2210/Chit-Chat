import 'dart:io';

import 'package:client/EditProfile.dart';
import 'package:client/personalInfomation.dart';
import 'package:flutter/material.dart';

class Profilepage extends StatefulWidget {  @override
  State<Profilepage> createState() => _ProfilepageState();
}

class _ProfilepageState extends State<Profilepage> {

  Map<String, String> data = {
    'name' : '',
    'email' : '',
    'bio' : '',
    'contact_no' : '',
    'profile_picture' : ''
  };

  void initState() {
    super.initState();
    getData();
  }

  Future<void> getData() async {
    Map<String, String> temp = await getProfileData();

    setState(() {
      data = temp;
    });
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
            child: Image.asset("images/login_bg_2.jpeg", fit: BoxFit.cover,),
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
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    children: [
                      Container(
                        width: 250,
                        height: 250,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.white),
                          image: data['profile_picture']!.isNotEmpty ?
                              DecorationImage(image: FileImage(File(data['profile_picture']!)), fit: BoxFit.cover) :
                              DecorationImage(image: AssetImage("images/account_logo.png"), fit: BoxFit.cover)
                        ),
                      ),
                      SizedBox(height: 30,),
                      Column(
                        children: [
                          Container(
                            child: Text(data['name']!, style: TextStyle(color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold),),
                          ),
                          SizedBox(height: 20,),
                          Container(
                            child: Text(data['email']!, style: TextStyle(color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold),),
                          ),
                          SizedBox(height: 20,),
                          Container(
                            child: Text(data['contact_no']!, style: TextStyle(color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold),),
                          ),
                          SizedBox(height: 20,),
                          Container(
                            child: Text(data['bio']!, style: TextStyle(color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold),),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      InkWell(
                        child: Container(
                          padding: EdgeInsets.all(7),
                          alignment: Alignment.bottomCenter,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10)
                          ),
                          child: Text('Edit Profile', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 25),),
                        ),
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (builder) {
                            return Editprofile();
                          }));
                        },
                      ),
                    ],
                  )
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
