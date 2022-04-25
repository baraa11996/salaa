import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class MyHederDrawer extends StatefulWidget {
  const MyHederDrawer({Key? key}) : super(key: key);

  @override
  _MyHederDrawerState createState() => _MyHederDrawerState();
}

class _MyHederDrawerState extends State<MyHederDrawer> {

  @override
  Widget build(BuildContext context) {
    return  Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
            Colors.teal.shade400,
            Colors.teal.shade200,
          ])),
      width: double.infinity,
      height: 210,
      padding: EdgeInsets.only(top: 40.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 60,
            backgroundImage: AssetImage('images/logo.png'),
          ),
          SizedBox(height: 3,),
          Text(
            '',
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
        ],
      ),
    );
  }
}
