import 'package:flutter/material.dart';
import 'package:training_project/core/widgets/big_icon.dart';

import '../../core/widgets/default_elevated_button.dart';

class Orders1 extends StatefulWidget {
  const Orders1({super.key});

  @override
  State<Orders1> createState() => _Orders1State();
}

class _Orders1State extends State<Orders1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Orders', style: TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BigIcon(
              big_icon: "assets/shopping_car.png",
            ),
            Text(
              "No orders yet",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.w500),
            ),
            SizedBox(
              height: MediaQuery.sizeOf(context).height * 0.025,
            ),
            DefaultElevatedButton(
              button_text: "Explore Categories",
            )
          ],
        ),
      ),
    );
  }
}
