import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:my_first_app/Recipients/Buyer_confirm_page.dart';

class ConfirmOrderPage_Buyer extends StatefulWidget {
  @override
  _ConfirmOrderPageState createState() => _ConfirmOrderPageState();
}

class _ConfirmOrderPageState extends State<ConfirmOrderPage_Buyer> {
  String? prescriptionImage; // Store the image path
  String selectedPaymentMethod = 'Debit Card'; // Default payment method

  // Function to pick an image from the gallery
  Future<void> _pickImage() async {
    final ImagePicker _picker = ImagePicker();
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      setState(() {
        prescriptionImage = image.path; // Save the selected image path
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Confirm Order'),
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Please review your order details:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            
            // Text about uploading prescription image
            Text(
              'Upload Image of Prescription:',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 10),

            // Container to display the uploaded image
            Container(
              width: double.infinity,
              height: 200,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(10),
              ),
              child: prescriptionImage == null
                  ? Center(child: Text('No image selected'))
                  : Image.file(
                      File(prescriptionImage!), // Display the selected image
                      fit: BoxFit.cover,
                    ),
            ),
            SizedBox(height: 10),
            
            // Button to select image
            ElevatedButton(
                onPressed: _pickImage,
                child: Text('Upload Image'),
              ),
           
            SizedBox(height: 20),

            // Payment method selection
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Payment via:',
                style: TextStyle(fontSize: 18),
              ),
            ),
            ListTile(
              title: const Text('Debit Card'),
              leading: Radio<String>(
                value: 'Debit Card',
                groupValue: selectedPaymentMethod,
                onChanged: (value) {
                  setState(() {
                    selectedPaymentMethod = value!;
                  });
                },
              ),
            ),
            ListTile(
              title: const Text('UPI'),
              leading: Radio<String>(
                value: 'UPI',
                groupValue: selectedPaymentMethod,
                onChanged: (value) {
                  setState(() {
                    selectedPaymentMethod = value!;
                  });
                },
              ),
            ),
            SizedBox(height: 20),
            
            // Confirm Order button
           ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>BuyerInformationPage()));
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Order Confirmed!')),
                  );
                  
                },
                child: Text('Confirm Order'),
              ),
            
          ],
        ),
      ),
    );
  }
}
