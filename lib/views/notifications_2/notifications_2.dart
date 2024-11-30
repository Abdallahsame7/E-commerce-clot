import 'package:flutter/material.dart';
import 'package:training_project/core/app_colors.dart';

class Notifications2 extends StatefulWidget {
  const Notifications2({super.key});

  @override
  State<Notifications2> createState() => _Notifications2State();
}

class _Notifications2State extends State<Notifications2> {
  final List<String> notifi = [
    "Habiba, you placed and order check your order history for full details",
    "Habiba, Thank you for shopping with us we have canceled order #24568.",
    "Habiba, your Order #24568 has been confirmed check your order history"
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Notifications',
              style: TextStyle(fontWeight: FontWeight.bold)),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(15),
          child: Container(
            // color: Colors.amber,
            height: MediaQuery.sizeOf(context).height * 0.40,
            child: ListView.builder(
              itemCount: notifi.length,
              itemBuilder: (context, index) {
                return Container(
                    alignment: Alignment.center,
                    margin: EdgeInsets.only(bottom: 10),
                    height: MediaQuery.sizeOf(context).height * 0.12,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: AppColors.grey),
                    child: ListTile(
                      leading: Icon(
                        Icons.notifications_active_outlined,
                        size: 35,
                        color: AppColors.black,
                      ),
                      title: Text(notifi[index]),
                      titleTextStyle: TextStyle(
                          fontWeight: FontWeight.w400,
                          color: AppColors.black,
                          fontSize: 18),
                    ));
              },
            ),
          ),
        ));
  }
}
