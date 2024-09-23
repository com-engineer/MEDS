import 'package:flutter/material.dart';

class ClaimedMedicinePage extends StatelessWidget {
  final String medicineName;
  final String quantityClaimed;

  ClaimedMedicinePage({required this.medicineName, required this.quantityClaimed});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Medicine Claimed Successfully'),
 backgroundColor: Theme.of(context).colorScheme.primary,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(
                Icons.check_circle_outline,
                color: Colors.green,
                size: 100,
              ),
              SizedBox(height: 20),
              Text(
                'Thank You!',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),
              Text(
                'You have successfully claimed the following medicine:',
                style: TextStyle(fontSize: 16),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20),
              Text(
                'Medicine: $medicineName',
                style: TextStyle(fontSize: 18),
              ),
              Text(
                'Quantity: $quantityClaimed',
                style: TextStyle(fontSize: 18),
              ),
              SizedBox(height: 40),
              Text(
                'Next Steps:',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Text(
                '- We will notify the donor of your request.',
                style: TextStyle(fontSize: 16),
              ),
              Text(
                '- You will receive a notification with pickup or delivery details.',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 30),
              ElevatedButton(
                onPressed: () {
                  // Navigate back to home or dashboard
                  Navigator.of(context).pop();
                },
                child: Text('Return to Home'),
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
