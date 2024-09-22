import 'package:flutter/material.dart';

class ViewDonatedMedicinesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('View Donated Medicines'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,

      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          MedicineCard(
            name: 'Paracetamol',
            quantity: 100,
            expirationDate: '2025-12-01',
          ),
          MedicineCard(
            name: 'Ibuprofen',
            quantity: 50,
            expirationDate: '2024-05-20',
          ),
          // Add more MedicineCard widgets for other medicines
        ],
      ),
    );
  }
}

class MedicineCard extends StatelessWidget {
  final String name;
  final int quantity;
  final String expirationDate;

  MedicineCard({required this.name, required this.quantity, required this.expirationDate});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: ListTile(
        title: Text('$name ($quantity available)'),
        subtitle: Text('Expires on: $expirationDate'),
        trailing: ElevatedButton(
          onPressed: () {
            // Logic to claim the medicine
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Medicine claimed!')));
          },
          child: Text('Claim'),
        ),
      ),
    );
  }
}
