import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/styles/colors.dart';
import 'package:flutter_application_1/core/styles/styles.dart';

class CustomContainer extends StatelessWidget {
  const CustomContainer({super.key, this.name, this.color, this.ontap});
  final String? name;
  final Color? color;
  final VoidCallback? ontap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: Container(
        height: 49,
        width: 344,
        //margin: EdgeInsets.symmetric(horizontal: 23),
        decoration: BoxDecoration(
          color: color ?? ColorsManager.primaryColor,
          borderRadius: BorderRadius.circular(100),
      
        ),
        child: Center(child: Text(name.toString(),style: TextStyles.font16colorwhite,)) ,
      ),
    );
  }
}