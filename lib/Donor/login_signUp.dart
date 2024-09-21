
import 'package:flutter/material.dart';
import 'package:my_first_app/Donor/donor_after_login.dart';

class Donor extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
   return Scaffold(
     appBar: AppBar(
      title: Text("Login/SignUp"),
backgroundColor: Theme.of(context).colorScheme.inversePrimary,
    ),
    body:Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children:[
            ElevatedButton(
              child:Text("Login"),
              onPressed: () {
               Navigator.push(context, MaterialPageRoute(builder:(context)=> DonorLoginPage()));
              },
            ),
            ElevatedButton(
              child: Text("SignUp"),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => DonorSignUpPage()),
                );
              },
            ),
          ],
        ),
      ),
   );
  }

}

class DonorLoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar: AppBar(
      title: Text("Login As a Donor"),
backgroundColor: Theme.of(context).colorScheme.inversePrimary,
    ),
    body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              decoration: InputDecoration(
                labelText: 'Email',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.emailAddress,
            ),
            SizedBox(height: 20),
            TextField(
              decoration: InputDecoration(
                labelText: 'Password',
                border: OutlineInputBorder(),
              ),
              obscureText: true,
            ),
            SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
 Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => DonorOptionsPage()),
                );
                // Add login functionality here
              },
              child: Text('Login'),
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
              ),
                ),
                
               SizedBox(
                height: 20),
            
            // "Not a member? Sign Up" section
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Not a member? "),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => DonorSignUpPage()),
                    );
                  },
                  child: Text(
                    'Sign Up',
                    style: TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight.bold,
                    ),
            ),
                ),
            ],
            )

          ],
        ),
      ),
   );
  }

}

class DonorSignUpPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Container(
        color: Colors.amber,
      )
    );
  }

}