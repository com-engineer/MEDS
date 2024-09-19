import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:my_first_app/intropage.dart';
import 'package:my_first_app/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
      theme: ThemeData(
        
        colorScheme: ColorScheme.fromSeed(seedColor:Colors.green),
        useMaterial3: true,
      ),
      
      home: SplashScreen(),
    );
  }
}

class MyHomePage extends StatelessWidget {

  var nameController=TextEditingController();

  @override
  Widget build(BuildContext context) {
   
    return Scaffold(
      appBar: AppBar(

        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
    
        title: Text('Home'),
      ),
      body:
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
           
            children: [
              Text('Welcome',style: TextStyle(
                fontSize: 34,
                fontWeight: FontWeight.bold,
              ),),
              SizedBox(
                height:11,
              ),
              Container(
                width: 100,
                height: 100,
                child: TextField(
                  controller: nameController,
                ),
              ),
              ElevatedButton(onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder:(context){
           return Intropage(nameController.text.toString());;
                }, ));
              }, child: Text('next'))
            ],
          
        
      ),
    
    );
  }
}

