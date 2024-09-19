import 'package:flutter/material.dart';
import 'package:my_first_app/main.dart';

class Intropage extends StatelessWidget {
  var nameFromeHome;
  Intropage(this.nameFromeHome);
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
          Text("Welcome,$nameFromeHome",style: TextStyle(fontSize: 34,color: Colors.amber),),
          ElevatedButton(onPressed: (){
           Navigator.pop(context);
          }, child: Text('next'))
        ],
      ),
    ),
    );
  
  }
  
}