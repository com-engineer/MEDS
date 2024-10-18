import 'package:flutter/material.dart';
 // Import Firebase Core
import 'package:local_auth/local_auth.dart';  // Import the local_auth package
import 'package:my_first_app/Donor/donor_Dashboard.dart';
import 'package:my_first_app/Donor/login_signUp.dart';
import 'package:my_first_app/Donor/seller_Dashboard.dart';
import 'package:my_first_app/NGO/login_signUp.dart';
import 'package:my_first_app/Recipients/login_signUp.dart';
import 'package:my_first_app/splash_screen.dart';

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
          primary: Color(0xFFC2005D), // Custom color as primary
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: Color(0xFFC2005D), // Button background color
            foregroundColor: Colors.white, // Button text color
            textStyle: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        textTheme: TextTheme(
          displayLarge: TextStyle(fontFamily: 'BodyFont', fontSize: 34, color: Colors.black),
        ),
      ),
      // routes: {
      //   '/seller_Dashboard': (context) => SellerDashboard(),
      //   '/donor_Dashboard': (context) => DonorDashboard(),
      // },
      home: SplashScreen(),
    );
  }
}

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
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
          // biometricOnly: true,
        ),
      );
    } catch (e) {
      print("Error during authentication: $e");
    }

    if (authenticated) {
      // Navigate to EntryTypeSelection after successful authentication
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => EntryTypeSelection()),
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
        child: CircularProgressIndicator(),  // Show loading indicator
      ),
    );
  }
}

class EntryTypeSelection extends StatefulWidget {
  @override
  State<EntryTypeSelection> createState() => _EntryTypeSelectionState();
}

class _EntryTypeSelectionState extends State<EntryTypeSelection> {
  String? selectedType;
  bool showProceedButtons = false;

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
                style: Theme.of(context).textTheme.displayLarge,
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    child: Text("Recipients"),
                    onPressed: () {
                      setState(() {
                        selectedType = "Recipients";
                        showProceedButtons = false;
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: selectedType == "Recipients"
                          ? Theme.of(context).colorScheme.primary
                          : Colors.white,
                      foregroundColor: selectedType == "Recipients"
                          ? Colors.white
                          : Colors.black,
                    ),
                  ),
                  ElevatedButton(
                    child: Text("NGO"),
                    onPressed: () {
                      setState(() {
                        selectedType = "NGO";
                        showProceedButtons = false;
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: selectedType == "NGO"
                          ? Theme.of(context).colorScheme.primary
                          : Colors.white,
                      foregroundColor: selectedType == "NGO"
                          ? Colors.white
                          : Colors.black,
                    ),
                  ),
                  ElevatedButton(
                    child: Text("Donor"),
                    onPressed: () {
                      setState(() {
                        selectedType = "Donor";
                        showProceedButtons = false;
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: selectedType == "Donor"
                          ? Theme.of(context).colorScheme.primary
                          : Colors.white,
                      foregroundColor: selectedType == "Donor"
                          ? Colors.white
                          : Colors.black,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              ElevatedButton(
                child: Text("Proceed to Login/Signup"),
                onPressed: () {
                  if (selectedType != null) {
                    setState(() {
                      showProceedButtons = true;
                    });
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("Please select an entry type")),
                    );
                  }
                },
              ),
              SizedBox(height: 20),
              if (showProceedButtons)
                Column(
                  children: [
                    ElevatedButton(
                      child: Text("Login"),
                      onPressed: () {
                        // _handleLogin(); // Call Firebase Login
                      },
                    ),
                    SizedBox(height: 10),
                    ElevatedButton(
                      child: Text("SignUp"),
                      onPressed: () {
                        // _handleSignUp(); // Call Firebase SignUp
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

  // void _handleLogin() async {
  //   // Implement login logic using FirebaseAuth
  //   UserCredential userCredential = await _auth.signInWithEmailAndPassword(
  //     email: 'test@example.com',
  //     password: 'password123',
  //   );
  //   if (userCredential.user != null) {
  //     // Navigate to the respective dashboard
  //     if (selectedType == "Donor") {
  //       Navigator.push(
  //         context,
  //         MaterialPageRoute(builder: (context) => DonorDashboard()),
  //       );
  //     } else if (selectedType == "Recipients") {
  //       Navigator.push(
  //         context,
  //         MaterialPageRoute(builder: (context) => RecipientsLoginPage()),
  //       );
  //     } else if (selectedType == "NGO") {
  //       Navigator.push(
  //         context,
  //         MaterialPageRoute(builder: (context) => NGOLoginPage()),
  //       );
  //     }
  //   } else {
  //     ScaffoldMessenger.of(context).showSnackBar(
  //       SnackBar(content: Text("Login failed")),
  //     );
  //   }
  // }

//   void _handleSignUp() async {
//     // Implement sign-up logic using FirebaseAuth
//     UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
//       email: 'test@example.com',
//       password: 'password123',
//     );
//     if (userCredential.user != null) {
//       // Handle the signup redirection
//       if (selectedType == "Donor") {
//         Navigator.push(
//           context,
//           MaterialPageRoute(builder: (context) => DonorSignUpPage()),
//         );
//       } else if (selectedType == "Recipients") {
//         Navigator.push(
//           context,
//           MaterialPageRoute(builder: (context) => RecipientsSignUpPage()),
//         );
//       } else if (selectedType == "NGO") {
//         Navigator.push(
//           context,
//           MaterialPageRoute(builder: (context) => NGOSignUpPage()),
//         );
//       }
//     } else {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text("Signup failed")),
//       );
//     }
//   }
// }
}