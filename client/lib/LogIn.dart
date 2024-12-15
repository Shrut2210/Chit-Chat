import 'package:client/HomePage.dart';
import 'package:client/SignUp.dart';
import 'package:client/authentication.dart';
import 'package:flutter/material.dart';

class LogIn extends StatefulWidget {
  @override
  _LogInState createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
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
                    child: Text('Welcome, Back !!!', style: TextStyle(color: Colors.white, fontSize: 40, fontWeight: FontWeight.w600)),
                    ),
                    SizedBox(height: 20),
                    TextFormField(
                      controller: emailController,
                      style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                        labelText: 'Email',
                        labelStyle: TextStyle(color: Colors.white),
                        border: OutlineInputBorder(),
                    ),
                    ),
                    SizedBox(height: 20),
                    TextFormField(
                      controller: passwordController,
                      style: TextStyle(color: Colors.white),
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
                                child : Text('Log In', style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold, color: Colors.black) )
                            )
                        ),

                        onTap: () async {
                          final response = await log_in(
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
                                      return Homepage();
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
                        Text("create an account ? ", style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.white60)),
                        InkWell(
                            child: Text("sign up", style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.blue, decoration: TextDecoration.underline, decorationColor: Colors.blue)),
                          onTap: () {
                              Navigator.push(context, MaterialPageRoute(builder: (builder) {
                                return Signup();
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
