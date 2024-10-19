import 'package:flutter/material.dart';
import 'package:local_auth/local_auth.dart';
import 'package:my_first_app/Donor/donor_Dashboard.dart';
import 'package:my_first_app/Donor/login_signUp.dart';
import 'package:my_first_app/Donor/seller_Dashboard.dart';
import 'package:my_first_app/NGO/login_signUp.dart';
import 'package:my_first_app/Recipients/login_signUp.dart';
import 'package:my_first_app/splash_screen.dart'; // Import Authentication Screen

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
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
          primary: Color(0xFFC2005D),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: Color(0xFFC2005D),
            foregroundColor: Colors.white,
            textStyle: TextStyle(fontWeight: FontWeight.bold, fontFamily: 'button'),
          ),
        ),
        textTheme: TextTheme(
          headlineLarge: TextStyle(fontFamily: 'heading', fontSize: 25, color: Colors.white),
          bodyMedium: TextStyle(fontFamily: 'BodyFont'),
        ),
      ),
      routes: {
        '/seller_Dashboard': (context) => seller_Dashboard(),
        '/donor_Dashboard': (context) => donor_Dashboard(),
      },
      home: AuthenticationScreen(), // Start with the Authentication Screen
    );
  }
}


class AuthenticationScreen extends StatefulWidget {
  @override
  State<AuthenticationScreen> createState() => _AuthenticationScreenState();
}

class _AuthenticationScreenState extends State<AuthenticationScreen> {
  final LocalAuthentication auth = LocalAuthentication();

  @override
  void initState() {
    super.initState();
    _authenticateUser();  // Call biometric authentication
  }

  // Method to handle biometric authentication
  Future<void> _authenticateUser() async {
    bool authenticated = false;
    try {
      authenticated = await auth.authenticate(
        localizedReason: 'Please authenticate to access the app',
        options: const AuthenticationOptions(
          stickyAuth: true,
        ),
      );
    } catch (e) {
      print("Error during authentication: $e");
    }

    if (authenticated) {
      // Navigate to SplashScreen after successful authentication
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => SplashScreen()), // Move to SplashScreen
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Authentication failed")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CircularProgressIndicator(), // Loading indicator while authentication happens
      ),
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
        title: Text("Welcome to MEDS",style: Theme.of(context).textTheme.headlineLarge,
),
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
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(fontSize: 25),
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
