import 'package:flutter/material.dart';
import 'package:training_project/core/widgets/big_icon.dart';
import 'package:training_project/core/widgets/default_elevated_button.dart';

class Notifications1 extends StatefulWidget {
  const Notifications1({super.key});

  @override
  State<Notifications1> createState() => _Notifications1State();
}

class _Notifications1State extends State<Notifications1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notifications',
            style: TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BigIcon(
              big_icon: "assets/notfications.png",
            ),
            Text(
              "No notifications yet",
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
