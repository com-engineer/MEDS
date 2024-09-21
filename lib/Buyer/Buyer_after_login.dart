import 'package:flutter/material.dart';

class BuyerPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Checkout the medicines'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,

      ),
      body:Container(
        color:Colors.pink
      )
    );
  }
}
