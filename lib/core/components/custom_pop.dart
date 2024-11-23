import 'package:flutter/material.dart';

class CustomPop extends StatelessWidget {
  const CustomPop({super.key, required this.ontap});
  final VoidCallback ontap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
     onTap: ontap,
      child: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Color.fromRGBO(226, 226, 226, 1)
        ),
        child: Center(child: Icon(Icons.arrow_back_ios_sharp , size: 20,),),
      ),
    );
  }
}