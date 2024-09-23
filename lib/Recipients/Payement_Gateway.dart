import 'package:flutter/material.dart';

class PaymentGatewayPage extends StatelessWidget {
  final String medicineName;
  final int price;
  PaymentGatewayPage({required this.medicineName, required this.price});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Payment for $medicineName'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Medicine: $medicineName',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 20),
            Text(
              'Total Price: ₹$price',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 40),
            ElevatedButton(
              onPressed: () {
                // Simulate payment processing
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Payment Successful for $medicineName!')),
                );
                // After payment, navigate back or to an order confirmation page
                Navigator.pop(context);
              },
              child: Text('Proceed to Payment'),
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
              ),
            ),
          ],
        ),
      ),
    );
  }
}