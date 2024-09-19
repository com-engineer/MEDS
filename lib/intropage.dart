import 'package:flutter/material.dart';
import 'package:my_first_app/main.dart';

class Intropage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(appBar: AppBar(
      backgroundColor: Colors.green,
      title:Text('intro'),
    ),
    body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
       
        children: [
          Text('Welcome',style: TextStyle(
            fontSize: 34,
            fontWeight: FontWeight.bold,
          ),),
          SizedBox(
            height:11,
          ),
          ElevatedButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder:(context){
              return MyHomePage(title: 'Home',);
            }, ));
          }, child: Text('next'))
        ],
      ),
    ),
    );
  
  }
  
}