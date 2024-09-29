
import 'package:flutter/material.dart';
import 'package:my_first_app/Donor/donor_after_login.dart';
import 'package:my_first_app/Donor/sell_medicines.dart';

class seller_Dashboard extends StatelessWidget {
  final List<Map<String, dynamic>> medicines = [
    {
      'name': 'Paracetamol',
      'dosageForm': 'Tablet',
      'strength': '500mg',
      'quantityAvailable': 10,
      'expiryDate': '2025-12-01',
      'manufacturer': 'ABC Pharmaceuticals',
      'conditionTreated': 'Fever',
        'image': 'Paracetamol.jpeg',
    },
    {
      'name': 'Ibuprofen',
      'dosageForm': 'Tablet',
      'strength': '200mg',
      'quantityAvailable': 15,
      'expiryDate': '2024-06-15',
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
        title: Text('Hi!,User'),
        backgroundColor: Theme.of(context).colorScheme.primary,
         leading: Builder(
          builder: (context) => IconButton(
            icon: Icon(Icons.menu), // Hamburger icon
            onPressed: () {
              Scaffold.of(context).openDrawer(); // Opens the drawer
            },
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context)=>DonorOptionsPage())) ;// This will log out the user

            },
          ),
        ],
        
      ),
        drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.all(8),
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text(
                'Menu',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.local_hospital),
              title: Text('Sell Medicine'),
              onTap: () {
                                Navigator.of(context).pop();

                Navigator.push(context, MaterialPageRoute(builder: (context)=>SellMedicinePage()));
              },
            ),
            ListTile(
              leading: Icon(Icons.share),
              title: Text('Share'),
              onTap: () {
                // Navigator.of(context).pop();
                // Navigator.push(context, MaterialPageRoute(builder: (context)=>DonateMedicinePage()));
              },
            ),
          ],
        ),
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