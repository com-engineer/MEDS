import 'package:flutter/material.dart';
import 'package:my_first_app/Recipients/Donated_Medicines.dart';
import 'package:my_first_app/Recipients/Selling_Medicines.dart';

class RecipientsHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Recipients Home Page'),
          backgroundColor: Theme.of(context).colorScheme.primary,
          actions: [
            IconButton(
              icon: Icon(Icons.logout),
              onPressed: () {
                // Add your logout functionality here
                // For example: Navigator.pop(context);
                Navigator.of(context).pop(); // This will log out the user
              },
            ),
          ],
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Reselled_Medicines()),
                  );
                },
                child: Text('Buyer'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Donated_Medicines()),
                  );
                },
                child: Text('Needy'),
              ),
            ],
          ),
        ));
  }
}
