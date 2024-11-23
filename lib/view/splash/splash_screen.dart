import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/shared/navigation_helper.dart';
import 'package:flutter_application_1/core/styles/colors.dart';
import 'package:flutter_application_1/core/styles/styles.dart';
import 'package:flutter_application_1/view/onboading/onboading.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: ColorsManager.primaryColor,
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Lottie.asset("assets/Animation - 1732286646228.json",
             delegates: LottieDelegates(),
             onLoaded: (loaded) {
               Future.delayed(loaded.duration ,() {
                print(loaded.duration);
                  NavigationHelper.goOff(context , OnboardingScreen());
               });
             },
               ),

               Text("CLOT",
               style: TextStyles.clotStyle,

               )
            ],
          ),
        ),
    );
  }
}