import 'package:flutter/material.dart';
import 'package:my_first_app/NGO/NGO_Home_Page.dart';

class NGOLoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      title: Text("NGO Login Page"),
 backgroundColor: Theme.of(context).colorScheme.primary,    ),
      body:Padding(
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
                  MaterialPageRoute(builder: (context) => NGODashboardPage()),
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
                      MaterialPageRoute(builder: (context) => NGOSignUpPage()),
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

class NGOSignUpPage extends StatefulWidget {
  @override
  _NGOSignupPageState createState() => _NGOSignupPageState();
}

class _NGOSignupPageState extends State<NGOSignUpPage> {
  // Define controllers to retrieve the text field data
  final TextEditingController ngoNameController = TextEditingController();
  final TextEditingController regNumberController = TextEditingController();
  final TextEditingController contactPersonController = TextEditingController();
  final TextEditingController contactNumberController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('NGO Signup'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                // NGO Name Field
                TextFormField(
                  controller: ngoNameController,
                  decoration: InputDecoration(labelText: 'NGO Name',
                border: OutlineInputBorder(),),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter NGO name';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20),
                // NGO Registration Number Field
                TextFormField(
                  controller: regNumberController,
                  decoration: InputDecoration(labelText: 'Registration Number',
                  border: OutlineInputBorder(),),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter registration number';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20),
                // Contact Person Field
                TextFormField(
                  controller: contactPersonController,
                  decoration: InputDecoration(labelText: 'Contact Person',
                  border: OutlineInputBorder(),),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter contact person name';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20),
                // Contact Number Field
                TextFormField(
                  controller: contactNumberController,
                  decoration: InputDecoration(labelText: 'Contact Number',
                  border: OutlineInputBorder(),),
                  keyboardType: TextInputType.phone,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter contact number';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20),
                // Email Field
                TextFormField(
                  controller: emailController,
                  decoration: InputDecoration(labelText: 'Email',
                  border: OutlineInputBorder(),),
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter email';
                    } else if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                      return 'Please enter a valid email';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20),
                // Address Field
                TextFormField(
                  controller: addressController,
                  decoration: InputDecoration(labelText: 'Address',
                  border: OutlineInputBorder(),),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter address';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20),
                // Username Field
                TextFormField(
                  controller: usernameController,
                  decoration: InputDecoration(labelText: 'Username',
                  border: OutlineInputBorder(),),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a username';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20),
                // Password Field
                TextFormField(
                  controller: passwordController,
                  decoration: InputDecoration(labelText: 'Password',
                  border: OutlineInputBorder(),),
                  obscureText: true,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a password';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 30),
                // Submit Button
                ElevatedButton(
                  onPressed: () {
                    // Validate the form and process the data
                    if (_formKey.currentState!.validate()) {
                      // Process signup logic
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Signing Up...')),
                      );
                    }
                  },
                  child: Text('Sign Up'),
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

