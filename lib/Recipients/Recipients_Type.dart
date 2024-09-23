
import 'package:flutter/material.dart';
import 'package:my_first_app/Recipients/Buyer_Home_page.dart';
import 'package:my_first_app/Recipients/Needy_Home_page.dart';

class RecipientsOptions extends StatefulWidget {
  @override
  State<RecipientsOptions> createState() => _RecipientsOptionsState();
}

class _RecipientsOptionsState extends State<RecipientsOptions> {
  String? selectedRole; 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Choose Your Role"),
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              child: Text("Proceed as Buyer"),
              onPressed: () {
                // Navigate to the Buyer home page
               setState(() {
                  selectedRole = "Buyer"; // Set selected role to Buyer
                });
                navigateToHome(selectedRole,context); 
              },
            ),
            SizedBox(height: 20),
            ElevatedButton(
              child: Text("Proceed as Needy"),
              onPressed: () {
                // Navigate to the Needy home page
                setState(() {
                  selectedRole = "Needy"; // Set selected role to Needy
                });
                navigateToHome(selectedRole,context);
              },
            ),
          ],
        ),
      ),
    );
  }
}

  void navigateToHome(String? selectedRole,context) {
    // Conditional navigation based on the selected role
    if (selectedRole == "Buyer") {
      
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => BuyerPage()), // Navigate to BuyerHome
      );
    } else if (selectedRole == "Needy") {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => NeedyPage()), // Navigate to NeedyHome
      );
    }
  }
