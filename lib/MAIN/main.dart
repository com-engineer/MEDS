import 'package:flutter/material.dart';
import 'package:my_first_app/Donor/login_signUp.dart';
import 'package:my_first_app/NGO/login_signUp.dart';
import 'package:my_first_app/Recipients/login_signUp.dart';
import 'package:my_first_app/MAIN/splash_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
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
            textStyle: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
      ),
      home: SplashScreen(),
    );
  }
}

class EntryTypeSelection extends StatefulWidget {
  @override
  State<EntryTypeSelection> createState() => _EntryTypeSelectionState();
}

class _EntryTypeSelectionState extends State<EntryTypeSelection> {
  String? selectedType; // Track the selected button type
  bool showProceedButtons = false; // Flag to control the visibility of Login/Signup buttons

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Welcome to MEDS"),
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Enter As:',
                style: TextStyle(
                  fontSize: 34,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  // Recipients Button
                  ElevatedButton(
                    child: Text("Recipients"),
                    onPressed: () {
                      setState(() {
                        selectedType = "Recipients"; // Set selected type to Recipients
                        showProceedButtons = false; // Hide proceed buttons until 'Proceed' is pressed
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: selectedType == "Recipients"
                          ? Theme.of(context).colorScheme.primary
                          : Colors.white, // Change color based on selected state
                      foregroundColor: selectedType == "Recipients"
                          ? Colors.white
                          : Colors.black, // Text color
                    ),
                  ),

                  // NGO Button
                  ElevatedButton(
                    child: Text("NGO"),
                    onPressed: () {
                      setState(() {
                        selectedType = "NGO"; // Set selected type to NGO
                        showProceedButtons = false; // Hide proceed buttons until 'Proceed' is pressed
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: selectedType == "NGO"
                          ? Theme.of(context).colorScheme.primary
                          : Colors.white, // Change color based on selected state
                      foregroundColor: selectedType == "NGO"
                          ? Colors.white
                          : Colors.black, // Text color
                    ),
                  ),

                  // Donor Button
                  ElevatedButton(
                    child: Text("Donor"),
                    onPressed: () {
                      setState(() {
                        selectedType = "Donor"; // Set selected type to Donor
                        showProceedButtons = false; // Hide proceed buttons until 'Proceed' is pressed
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: selectedType == "Donor"
                          ? Theme.of(context).colorScheme.primary
                          : Colors.white, // Change color based on selected state
                      foregroundColor: selectedType == "Donor"
                          ? Colors.white
                          : Colors.black, // Text color
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),

              // Proceed Button
              ElevatedButton(
                child: Text("Proceed to Login/Signup"),
                onPressed: () {
                  if (selectedType != null) {
                    setState(() {
                      showProceedButtons = true; // Show Login/Signup buttons
                    });
                  } else {
                    // Show an error if no type is selected
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("Please select an entry type")),
                    );
                  }
                },
              ),

              SizedBox(height: 20),

              // Conditionally render SignUp and Login buttons if a type is selected and 'Proceed' is pressed
              if (showProceedButtons)
                Column(
                  children: [
                    ElevatedButton(
                      child: Text("Login"),
                      onPressed: () {
                        if (selectedType == "Donor") {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => DonorLoginPage()),
                          );
                        } else if (selectedType == "Recipients") {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => RecipientsLoginPage()),
                          );
                        } else if (selectedType == "NGO") {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => NGOLoginPage()),
                          );
                        }
                      },
                    ),
                    SizedBox(height: 10),
                    ElevatedButton(
                      child: Text("SignUp"),
                      onPressed: () {
                        if (selectedType == "Donor") {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => DonorSignUpPage()),
                          );
                        } else if (selectedType == "Recipients") {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => RecipientsSignUpPage()),
                          );
                        } else if (selectedType == "NGO") {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => NGOSignUpPage()),
                          );
                        }
                      },
                    ),
                  ],
                ),
            ],
          ),
        ),
      ),
    );
  }
}
