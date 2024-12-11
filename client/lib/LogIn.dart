import 'package:flutter/material.dart';

class LogIn extends StatefulWidget {
  @override
  _LogInState createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Container(
            child: Image.asset("images/login_bg_1.jpeg", fit: BoxFit.cover,),
          ),
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            color: Color.fromRGBO(0, 0, 0, 0.6),
          ),
          Center(
            child : Container(
                height: MediaQuery.of(context).size.height/2,
                width: MediaQuery.of(context).size.width*3/4,
                alignment: Alignment.center,
                child: Column(
                children: [
                    Center(
                    child: Text('Log In', style: TextStyle(color: Colors.white, fontSize: 30, fontWeight: FontWeight.w600)),
                    ),
                    SizedBox(height: 20),
                    TextFormField(
                    decoration: InputDecoration(
                        labelText: 'Email',
                        labelStyle: TextStyle(color: Colors.white),
                        border: OutlineInputBorder(),
                    ),
                    ),
                    SizedBox(height: 20),
                    TextFormField(
                        obscureText: true,
                        decoration: InputDecoration(
                        labelStyle: TextStyle(color: Colors.white),
                        labelText: 'Password',
                        border: OutlineInputBorder(),
                    ),
                    ),
                    SizedBox(height: 20,),
                    InkWell(
                        child: Container(
                            color: Colors.white,
                            padding: EdgeInsets.all(6),
                            width: MediaQuery.of(context).size.width*3/4,
                            child: Center(
                                child : Text('Log In', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black) )
                            )
                        ),

                        onTap: () {

                        },
                    ),
                    
                ],
                ),
            )
          )
        ],
      ),
    );
  }
}
