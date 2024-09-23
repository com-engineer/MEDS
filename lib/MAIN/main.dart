import 'package:flutter/material.dart';
import 'package:my_first_app/Donor/login_signUp.dart';
import 'package:my_first_app/NGO/login_signUp.dart';
import 'package:my_first_app/Recipients/login_signUp.dart';
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
 colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: Color(0xFFC2005D), // Custom color as primary
        ), 
         elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
               backgroundColor: Color(0xFFC2005D), // Button background color
            foregroundColor: Colors.white, // Button text color
            textStyle: TextStyle(fontWeight: FontWeight.bold),  ),
                ),
        ),
                
        home:SplashScreen(),
       );
  }

}

class EntryTypeSelection extends StatefulWidget{
  @override
  State<EntryTypeSelection> createState() => _EntryTypeSelectionState();
}

class _EntryTypeSelectionState extends State<EntryTypeSelection> {
  String? selectedType;
  @override
  Widget build(BuildContext context) {
   return Scaffold(
    appBar: AppBar(
      title: Text("Welcome to MEDS"),
 backgroundColor: Theme.of(context).colorScheme.primary,    ),
    body:Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text('Enter As:',style:TextStyle(
                fontSize: 34,
                color:Colors.black,
              )),
                          SizedBox(height: 20),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children:[
                 ElevatedButton(
              child: Text("Recipients"), // This opens the needy/buyer screen
              onPressed: () {
                setState(() {
                  selectedType = "Recipients"; // Set selected type to Recipients
                });
              },
            ),

                  
                              SizedBox(height: 20),
          
                 ElevatedButton(
              child: Text("NGO"),
              onPressed: () {
                setState(() {
                  selectedType = "NGO"; // Set selected type to NGO
                });
              },
            ),
                              SizedBox(height: 20),
          
 ElevatedButton(
              child: Text("Donor"),
              onPressed: () {
                setState(() {
                  selectedType = "Donor"; // Set selected type to Donor
                });
              },
            ),
                ],
              ),
              SizedBox(height: 20),
ElevatedButton(
              child: Text("Proceed to Login/Signup"),
              onPressed: () {
                if (selectedType != null) {
                  // Navigate to the respective login/signup page
                  if (selectedType == "Donor") {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Donor()),
                    );
                  } else if (selectedType == "Recipients") {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Recipients()),
                    );
                  } else if (selectedType == "NGO") {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => NGO()),
                    );
                  }
                } else {
                  // Show an error if no type is selected
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("Please select an entry type")),
                  );
                }
              },
            ),
            ],
          ),
        ),
      ),
   );
  }
}
