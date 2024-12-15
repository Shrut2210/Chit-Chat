import 'package:client/EditProfile.dart';
import 'package:client/LogIn.dart';
import 'package:client/authentication.dart';
import 'package:client/main.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class Signup extends StatefulWidget {
  @override
  _LogInState createState() => _LogInState();
}

class _LogInState extends State<Signup> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Container(
            child: Image.asset("images/login_signup_bg.png", fit: BoxFit.cover,),
          ),
          Center(
              child : Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width*3/5,
                alignment: Alignment.center,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(
                      child: Text('Welcome, New User !', style: TextStyle(color: Colors.white, fontSize: 40, fontWeight: FontWeight.w600)),
                    ),
                    SizedBox(height: 20),
                    TextFormField(
                      style: TextStyle(color: Colors.white),
                      controller: nameController,
                      decoration: InputDecoration(
                        labelText: 'Name',
                        labelStyle: TextStyle(color: Colors.white),
                        border: OutlineInputBorder(),
                      ),
                    ),
                    SizedBox(height: 20),
                    TextFormField(
                      style: TextStyle(color: Colors.white),
                      controller: emailController,
                      decoration: InputDecoration(
                        labelText: 'Email',
                        labelStyle: TextStyle(color: Colors.white),
                        border: OutlineInputBorder(),
                      ),
                    ),
                    SizedBox(height: 20),
                    TextFormField(
                      style: TextStyle(color: Colors.white),
                      controller: passwordController,
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
                              child : Text('Sign Up', style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold, color: Colors.black) )
                          )
                      ),

                      onTap: () async {
                        final response = await sign_up(
                          name: nameController.text,
                          email: emailController.text,
                          password: passwordController.text
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
                                return Editprofile();
                              })),
                              child: Text("Ok", style: TextStyle(color: Colors.blue, fontSize: 20, fontWeight: FontWeight.bold),),
                            ),
                          ],
                        )
                        );
                      },
                    ),
                    SizedBox(height: 20,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("have an account ? ", style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.white60)),
                        InkWell(
                          child: Text("log in", style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.blue, decoration: TextDecoration.underline, decorationColor: Colors.blue)),
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(builder: (builder) {
                              return LogIn();
                            }));
                          },
                        )
                      ],
                    )
                  ],
                ),
              )
          )
        ],
      ),
    );
  }
}
