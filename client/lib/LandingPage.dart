import 'package:client/LogIn.dart';
import 'package:flutter/material.dart';

class Landingpage extends StatefulWidget {  @override
  State<Landingpage> createState() => _LandingpageState();
}

class _LandingpageState extends State<Landingpage> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Container(
            child: Image.asset("assets/images/landing_page_bg.png", fit: BoxFit.cover,),
          ),
          Container(
            alignment: Alignment.bottomCenter,
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: InkWell(
              child: Container(
                margin: EdgeInsets.only(bottom: 80),
                  padding: EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white60
                  ),
                  child: Text("Get Started", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 30),)

              ),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (builder) {
                  return LogIn();
                }));
              },
            ),
          )
        ],
      ),
    );
    // TODO: implement build
    throw UnimplementedError();
  }}
