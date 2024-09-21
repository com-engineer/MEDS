import 'package:flutter/material.dart';
import 'package:my_first_app/Buyer/login_signUp.dart';
import 'package:my_first_app/Donor/login_signUp.dart';
import 'package:my_first_app/NGO/login_signUp.dart';
import 'package:my_first_app/Needy/login_signUp.dart';
import 'package:my_first_app/MAIN/splash_screen.dart';


void main(){
   runApp(MyApp());
}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
       return MaterialApp(
        title: "MEDS",
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor:Colors.pink),
         ),
        home:SplashScreen(),
       );
  }

}

class Dashboard extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
   return Scaffold(
    appBar: AppBar(
      title: Text("Welcome to MEDS"),
backgroundColor: Theme.of(context).colorScheme.inversePrimary,
    ),
    body:Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children:[
            ElevatedButton(
              child:Text("Needy"),
              onPressed: () {
               Navigator.push(context, MaterialPageRoute(builder:(context)=> Needy()));
              },
            ),
              ElevatedButton(
              child:Text("Buyer"),
              onPressed: () {
               Navigator.push(context, MaterialPageRoute(builder:(context)=> Buyer()));
              },
            ),
            ElevatedButton(
              child: Text("NGO"),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => NGO()),
                );
              },
            ),
            ElevatedButton(
              child:Text("Donar"),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Donor()),
                );
              },
            ),
          ],
        ),
      ),
   );
  }

}
