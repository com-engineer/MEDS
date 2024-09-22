import 'package:flutter/material.dart';
import 'package:my_first_app/Needy/Needy_after_claim.dart';

class NeedyPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Available Medicines for Free'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,

      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: <Widget>[
            MedicineCard(
              name: 'Paracetamol',
              dosageForm: 'Tablet',
              strength: '500 mg',
              quantityAvailable: 50,
              expirationDate: '2025-12-01',
              manufacturer: 'XYZ Pharma',
              conditionTtreated: 'Fever and Pain',
            ),
            MedicineCard(
              name: 'Amoxicillin',
              dosageForm: 'Capsule',
              strength: '250 mg',
              quantityAvailable: 30,
              expirationDate: '2024-08-15',
              manufacturer: 'ABC Pharma',
              conditionTtreated: 'Bacterial Infections',
            ),
            MedicineCard(
              name: 'Cough Syrup',
              dosageForm: 'Syrup',
              strength: '100 ml',
              quantityAvailable: 10,
              expirationDate: '2024-01-01',
              manufacturer: 'DEF Pharma',
              conditionTtreated: 'Cough',
            ),
          ],
        ),
      ),
    );
  }
}

class MedicineCard extends StatelessWidget {
  final String name;
  final String dosageForm;
  final String strength;
  final int quantityAvailable;
  final String expirationDate;
  final String manufacturer;
  final String conditionTtreated;

  MedicineCard({
    required this.name,
    required this.dosageForm,
    required this.strength,
    required this.quantityAvailable,
    required this.expirationDate,
    required this.manufacturer,
    required this.conditionTtreated,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 10.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Medicine: $name', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 10),
            Text('Dosage Form: $dosageForm'),
            Text('Strength: $strength'),
            Text('Quantity Available: $quantityAvailable'),
            Text('Expiration Date: $expirationDate'),
            Text('Manufacturer: $manufacturer'),
            Text('Condition Treated: $conditionTtreated'),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ClaimedMedicinePage(
                        medicineName:'$name',
                        quantityClaimed:'$quantityAvailable'
                      )),
                    );              },
              child: Text('Claim Medicine'),
            ),
          ],
        ),
      ),
    );
  }
}
