import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/shared/navigation_helper.dart';
import 'package:flutter_application_1/core/shared/sharedPref.dart';
import 'package:flutter_application_1/core/styles/colors.dart';
import 'package:flutter_application_1/core/styles/styles.dart';
import 'package:flutter_application_1/view/home/home.dart';
import 'package:flutter_application_1/view/onboading/onboading.dart';
import 'package:flutter_application_1/view/signin/signin_screen.dart';
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
                final hasSeenOnboarding = CacheHelper.sharedPreferences
                      .getBool('hasSeenOnboarding') ??
                      false;
                  final isLoggedIn = CacheHelper.sharedPreferences
                      .getBool('isLoggedIn') ??
                      false;

                  if (isLoggedIn) {
                    NavigationHelper.goOff(context, HomeScreen());
                  } else if (hasSeenOnboarding) {
                    NavigationHelper.goOff(context, SigninScreen());
                  } else {
                    NavigationHelper.goOff(context, OnboardingScreen());
               }
               }
               );
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