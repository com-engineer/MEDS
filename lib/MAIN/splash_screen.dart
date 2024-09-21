import 'dart:async';

import 'package:flutter/material.dart';
import 'package:my_first_app/MAIN/main.dart';

class SplashScreen extends StatefulWidget{
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
@override
  void initState() {
   Timer(Duration(seconds: 5), (){
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context){
      return Dashboard();
    }));
   });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
   return Scaffold(
    body:Container(
      color: Colors.pink,
      child:Center(
        child: Text("MEDS",style:TextStyle(
          fontSize: 34,
          fontWeight: FontWeight.w800,
          color:Colors.white
        )),
      )
    )
   );
  }
}