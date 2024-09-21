import 'package:flutter/material.dart';

class NGO extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
   return Scaffold(
    body:Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children:[
            ElevatedButton(
              child:Text("Login"),
              onPressed: () {
               Navigator.push(context, MaterialPageRoute(builder:(context)=> NGOLoginPage()));
              },
            ),
            ElevatedButton(
              child: Text("SignUp"),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => NGOSignUpPage()),
                );
              },
            ),
          ],
        ),
      ),
   );
  }

}

class NGOLoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Container(
        color: Colors.blue,
      )
    );
  }

}

class NGOSignUpPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Container(
        color: Colors.amber,
      )
    );
  }

}
