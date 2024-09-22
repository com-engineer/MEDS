import 'package:flutter/material.dart';
import 'package:my_first_app/Buyer/Payment_gateway.dart';

class BuyerPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Available Medicines for Purchase'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,

      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          MedicineCard(
            name: 'Aspirin',
            price: 150,
            quantityAvailable: 20,
            expirationDate: '2024-06-15',
          ),
          MedicineCard(
            name: 'Amoxicillin',
            price: 250,
            quantityAvailable: 30,
            expirationDate: '2025-02-01',
          ),
          // Add more medicines here
        ],
      ),
    );
  }
}

class MedicineCard extends StatelessWidget {
  final String name;
  final int price;
  final int quantityAvailable;
  final String expirationDate;

  MedicineCard({
    required this.name,
    required this.price,
    required this.quantityAvailable,
    required this.expirationDate,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: ListTile(
        title: Text('$name ($quantityAvailable available)'),
        subtitle: Text('Price: ₹$price\nExpires on: $expirationDate'),
        trailing: ElevatedButton(
          onPressed: () {
            // Navigate to payment gateway page
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => PaymentGatewayPage(medicineName: name, price: price),
              ),
            );
          },
          child: Text('Buy'),
        ),
      ),
    );
  }
}
