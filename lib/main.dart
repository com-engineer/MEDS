import 'package:flutter/material.dart';

import 'package:shared_preferences/shared_preferences.dart';


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
      
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var nameController=TextEditingController();
  static const String KEYNAME="name";//static variable is written in the capital alphabets
  var nameValue="No value Saved";
@override
  void initState() {
   
    super.initState();
    getValue();
  }
  @override
  Widget build(BuildContext context) {
   
    return Scaffold(
      appBar: AppBar(

        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
    
        title: Text('Home'),
      ),
      body:Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: nameController,
              decoration: InputDecoration(
                label: Text('Name'),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(21),
                )
              ),
            ),
             SizedBox(
              height: 11,
             ),
            ElevatedButton(onPressed: ()async{
                var name=nameController.text.toString();
                var pref=await SharedPreferences.getInstance();
                pref.setString(KEYNAME, name);
            },
             child: Text('save')),
             SizedBox(
              height: 11,
             ),
             Text(nameValue)
          ],
        ),
      )
    );
  }
  
  void getValue() async{
    var pref=await SharedPreferences.getInstance();
    var getName=pref.getString(KEYNAME);
    nameValue=getName ?? "no Value Saved";
  setState(() {
    
  });
  }
}

