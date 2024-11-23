import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/components/custom_container.dart';
import 'package:flutter_application_1/core/shared/navigation_helper.dart';
import 'package:flutter_application_1/core/styles/colors.dart';
import 'package:flutter_application_1/model/onboading_model.dart';
import 'package:flutter_application_1/view/signin/signin_screen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingScreen extends StatefulWidget {
  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  PageController pageController = PageController();
  int currentPage = 0;

  void goToNextPage() {
    if (currentPage < 2) {
      pageController.nextPage(
        duration: Duration(milliseconds: 600),
        curve: Curves.easeInOut,
      );
    } else {
        NavigationHelper.goOff(context, SigninScreen());
    
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: pageController,
            onPageChanged: (index) {
              setState(() {
                currentPage = index;
              });
            },
            children: const [
              OnboardingPage(
                title: 'Easy, Fast & Trusted',
                description:
                    'Fast money transfer and gauranteed safe\ntransactions with others.',
                image: "assets/E-Commerce-PNG-Photo.png",
              ),
              OnboardingPage(
                title: 'Saving Your Money',
                description:
                    'Track the progress of your savings\nand start a habit of saving with TransferMe.',
                image: "assets/e-commerce-png-e-commerce-solutions-ecommerce-png-560.png",
              ),
              OnboardingPage(
                title: 'Free Transactions',
                description:
                    'Provides the quality of the financial system\nwith free money transactions without any fees.',
                image: "assets/E-Commerce-Shopping-PNG-Clipart-Background.png",
              ),
            ],
          ),
          Positioned(
            bottom: 130.h,
            left: 160.w,
            right: 160.w,
            child: SmoothPageIndicator(
              controller: pageController,
              count: 3,
              effect: const WormEffect(
                // dotColor: ColorsManager.blue,
                activeDotColor: ColorsManager.primaryColor,
                dotHeight: 8.0,
                dotWidth: 8.0,
                spacing: 10.0,
              ),
            ),
          ),

          Positioned(
            left: 23.w,
            bottom: 50.h,
            child: CustomContainer(
              name: "Continue",
              ontap: goToNextPage,
              )
              )


          
        ],
      ),
    );
  }
}
