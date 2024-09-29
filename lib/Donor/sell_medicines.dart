import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:my_first_app/Donor/seller_Dashboard.dart';

class SellMedicinePage extends StatefulWidget {
  @override
  State<SellMedicinePage> createState() => _SellMedicinePageState();
}

class _SellMedicinePageState extends State<SellMedicinePage> {
  String? Medicine_Image;
   Future<void> _pickImage() async {
    final ImagePicker _picker = ImagePicker();
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      setState(() {
        Medicine_Image = image.path; // Save the selected image path
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sell Medicines'),
 backgroundColor: Theme.of(context).colorScheme.primary,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              TextField(
                decoration: InputDecoration(
                  labelText: 'Medicine Name',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 20),
              TextField(
                decoration: InputDecoration(
                  labelText: 'Dosage Form (e.g., Tablet, Syrup)',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 20),
              TextField(
                decoration: InputDecoration(
                  labelText: 'Strength (e.g., 500 mg)',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 20),
              TextField(
                decoration: InputDecoration(
                  labelText: 'Quantity Available',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
              ),
              SizedBox(height: 20),
              TextField(
                decoration: InputDecoration(
                  labelText: 'Expiration Date (YYYY-MM-DD)',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.datetime,
              ),
              SizedBox(height: 20),
              TextField(
                decoration: InputDecoration(
                  labelText: 'Manufacturer',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 20),
              TextField(
                decoration: InputDecoration(
                  labelText: 'Condition Treated',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 20),
              TextField(
                decoration: InputDecoration(
                  labelText: 'Side Effects',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 20),
              TextField(
                decoration: InputDecoration(
                  labelText: 'Storage Conditions',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 20),
              // TextField(
              //   decoration: InputDecoration(
              //     labelText: 'Price',
              //     border: OutlineInputBorder(),
              //   ),
              //   keyboardType: TextInputType.number,
              // ),
              // SizedBox(height: 20),
              TextField(
                decoration: InputDecoration(
                  labelText: 'Additional Notes (optional)',
                  border: OutlineInputBorder(),
                ),
              ),
              Container(
              width: double.infinity,
              height: 200,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Medicine_Image == null
                  ? Center(child: Text('No image selected'))
                  : Image.file(
                      File(Medicine_Image!), // Display the selected image
                      fit: BoxFit.cover,
                    ),
            ),
             SizedBox(height: 10),
            
            // Button to select image
            ElevatedButton(
                onPressed: _pickImage,
                child: Text('Upload Image'),
              ),
           
              SizedBox(height: 30),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>Sell_Confirmation_page()));
                },
                child: Text('Submit for Sale'),
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Sell_Confirmation_page extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
   return Scaffold(
    appBar: AppBar(
      title:Text("Confirmation page"),
       backgroundColor: Theme.of(context).colorScheme.primary,
    ),
    body:Column(
      children: [
        Center(
          child: Container(child: Text("Thanks For reselling to us !", style: TextStyle(
            fontSize: 50,
            fontWeight: FontWeight.w800,
            
          ),),),
        ),
        ElevatedButton(
          onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>seller_Dashboard()));
          }, child: Text("Go to Dashboard"))
      ],
    )

   );
  }
  
}