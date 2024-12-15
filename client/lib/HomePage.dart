import 'package:flutter/material.dart';

class Homepage extends StatefulWidget {  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Container(
            padding: EdgeInsets.all(15),
            width: MediaQuery.of(context).size.width,
            color: Colors.black,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Chit-Chat", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 30),),
                    Icon(Icons.menu, color: Colors.white, size: 30,)
                  ],
                ),
                Container(
                  padding: EdgeInsets.only(left: 15, right: 15),
                  margin: EdgeInsets.only(top: 15),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.white),
                    borderRadius: BorderRadius.circular(30)
                  ),
                    child: Row(
                      children: [
                        Icon(Icons.search, color: Colors.white, size: 30,),
                        SizedBox(width: 10,),
                        Expanded(
                          child: TextField(
                            style: TextStyle(color: Colors.white38, fontSize: 25,),
                            decoration: InputDecoration(
                              hintText: 'Search',
                              hintStyle: TextStyle(fontSize: 25, color: Colors.white38),
                              border: InputBorder.none,
                              focusColor: Colors.white
                            ),
                          ),
                        )
                      ],
                    )
                )
              ],
            ),
          )
        ],
      ),
    );
    // TODO: implement build
    throw UnimplementedError();
  }}
