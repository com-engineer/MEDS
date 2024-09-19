import 'dart:async';
import 'package:my_first_app/intropage.dart';

import 'package:flutter/material.dart';
import 'package:my_first_app/main.dart';

class SplashScreen extends StatefulWidget{
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
      super.initState();
     Timer(Duration(seconds: 5), (){
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context){
       return MyHomePage();
      },));
     },);
  }
  @override
  Widget build(BuildContext context) {
 return Scaffold(
  body: Container(
    color: Colors.blue,
    child: Center(
      child: Text('MEDS',style: TextStyle(fontWeight: FontWeight.w700,
      color: Colors.white,
      fontSize: 30),
      ),
    ),
  ),
 );
  }
}