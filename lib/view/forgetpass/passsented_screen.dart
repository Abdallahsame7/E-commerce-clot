import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/shared/navigation_helper.dart';
import 'package:flutter_application_1/core/styles/colors.dart';
import 'package:flutter_application_1/core/styles/styles.dart';
import 'package:flutter_application_1/view/signin/signin_screen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PasssentedScreen extends StatelessWidget {
  const PasssentedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body:  Center(
        child:  Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset("assets/image 4.png"),

            SizedBox(height: 24.h,),
            Text(
              "We Sent you an Email to reset\nyour password.",
              textAlign: TextAlign.center,
               style: TextStyle(
              fontSize: 24, fontWeight: FontWeight.w500
              ),
              ),

              SizedBox(height: 24.h,),
              InkWell(
                onTap: () {
                 NavigationHelper.goto(context, SigninScreen()); 
                },
                child: Container(
                  width: 159.h,
                  height: 52.h,
                  decoration: BoxDecoration(
                    color: ColorsManager.primaryColor,
                    borderRadius: BorderRadius.circular(100.r),
                  ),
                  child: Center(child: Text("Return to Login" , style: TextStyles.font16colorwhite,),),
                ),
              )
          ],
        ),
      ),
    );
  }
}