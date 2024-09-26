import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ConfirmOrderPage extends StatefulWidget {
  @override
  _ConfirmOrderPageState createState() => _ConfirmOrderPageState();
}

class _ConfirmOrderPageState extends State<ConfirmOrderPage> {
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
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Upload Image of Prescription:',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 10),
            Row(
              children: [
                ElevatedButton(
                  onPressed: _pickImage,
                  child: Text('Upload Image'),
                ),
                SizedBox(width: 10),
                if (prescriptionImage != null)
                  Text('Image Selected'),
              ],
            ),
            SizedBox(height: 20),
            Text(
              'Payment via:',
              style: TextStyle(fontSize: 18),
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
            ElevatedButton(
              onPressed: () {
                // Handle order confirmation logic here
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
