import 'dart:async';

import 'package:flutter/material.dart';
import 'package:my_first_app/main.dart';

class SplashScreen extends StatefulWidget{
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
@override
  void initState() {
   Timer(Duration(seconds: 2), (){
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context){
      return EntryTypeSelection();
    }));
   });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
   return Scaffold(
    body:Container(
      color:Color(0xFFC2005D), 
      child:Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("MEDS",style:TextStyle(
              fontSize: 34,
              fontWeight: FontWeight.w800,
              color:Colors.white
            )),
              Text("Medicine Exchange and Distribution System",style:TextStyle(
          fontSize: 14,
          // fontWeight: FontWeight.w800,
          color:Colors.white
        )),
          ],
        ),
      
      )
    )
   );
  }
}