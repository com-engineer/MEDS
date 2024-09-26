import 'package:flutter/material.dart';
import 'package:my_first_app/Recipients/Needy_after_claim.dart';

class NeedyPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Available Medicines for Free'),
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
          child: ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MedicinesPage()),
              );
            },
            child: Text('Get Medicine'),
          ),
        ));
  }
}

class MedicinesPage extends StatelessWidget {
  final List<Map<String, dynamic>> medicines = [
    {
      'name': 'Paracetamol',
      'dosageForm': 'Tablet',
      'strength': '500mg',
      'quantityAvailable': 10,
      'expirationDate': '2025-12-01',
      'manufacturer': 'ABC Pharmaceuticals',
      'conditionTreated': 'Fever',
        'image': 'Paracetamol.jpeg',
    },
    {
      'name': 'Ibuprofen',
      'dosageForm': 'Tablet',
      'strength': '200mg',
      'quantityAvailable': 15,
      'expirationDate': '2024-06-15',
      'manufacturer': 'XYZ Pharmaceuticals',
      'conditionTreated': 'Pain Relief',
       'image': 'Ibuprofen.jpeg',
    },
    // Add more medicines here
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Available Medicines for Free'),
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
      body: Column(
        
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Search Medicines',
                prefixIcon: Icon(Icons.search),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: medicines.length,
              itemBuilder: (context, index) {
                final medicine = medicines[index];
                return Card(
                  margin: EdgeInsets.all(10),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                         Image.asset(
                          'assets/images/${medicine["image"]}',
                          width: 50,
                          height: 50,
                        ),
                        SizedBox(width:10 ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                medicine['name']!,
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text('Manufacturer: ${medicine['manufacturer']}'),
                              Text('Expiry Date: ${medicine['expiryDate']}'),
                              Text('Price: ${medicine['price']}'),
                              
                            ElevatedButton(
                              onPressed: () {
                                Navigator.push(context, MaterialPageRoute(builder: (context)=>ConfirmOrderPage()));
                              },
                              child: Text('Buy'),
                            ),
                            ElevatedButton(
                              onPressed: () {
                                // Add functionality to get free medicine
                              },
                              child: Text('Get Free'),
                            ),
                            ],
                          ),
                        ),
                       
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
// class MedicineCard extends StatelessWidget {
//   final String name;
//   final String dosageForm;
//   final String strength;
//   final int quantityAvailable;
//   final String expirationDate;
//   final String manufacturer;
//   final String conditionTtreated;

//   MedicineCard({
//     required this.name,
//     required this.dosageForm,
//     required this.strength,
//     required this.quantityAvailable,
//     required this.expirationDate,
//     required this.manufacturer,
//     required this.conditionTtreated,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       margin: const EdgeInsets.symmetric(vertical: 10.0),
//       child: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text('Medicine: $name', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
//             SizedBox(height: 10),
//             Text('Dosage Form: $dosageForm'),
//             Text('Strength: $strength'),
//             Text('Quantity Available: $quantityAvailable'),
//             Text('Expiration Date: $expirationDate'),
//             Text('Manufacturer: $manufacturer'),
//             Text('Condition Treated: $conditionTtreated'),
//             SizedBox(height: 10),
//             ElevatedButton(
//               onPressed: () {
//     Navigator.push(
//                       context,
//                       MaterialPageRoute(builder: (context) => ClaimedMedicinePage(
//                         medicineName:'$name',
//                         quantityClaimed:'$quantityAvailable'
//                       )),
//                     );              },
//               child: Text('Claim Medicine'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
