import 'package:flutter/material.dart';

class BigIcon extends StatelessWidget {
  const BigIcon({super.key,required this.big_icon});
  final String big_icon ; 

  @override
  Widget build(BuildContext context) {
    return   Container(
              height: MediaQuery.sizeOf(context).height * 0.20,
              width: MediaQuery.sizeOf(context).width * 0.50,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(big_icon),
                      fit: BoxFit.cover)),
            );
  }
}