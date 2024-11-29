import 'package:flutter/material.dart';
import 'package:flutter_application_1/controller/onbaording/onboarding_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_application_1/core/components/custom_container.dart';
import 'package:flutter_application_1/core/shared/navigation_helper.dart';
import 'package:flutter_application_1/core/styles/colors.dart';
import 'package:flutter_application_1/model/onboading_model.dart';
import 'package:flutter_application_1/view/signin/signin_screen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<OnboardingCubit, OnboardingState>(
        listener: (context, state) {
          if (state is OnboardingCompleted) {
            NavigationHelper.goOff(context, SigninScreen());
          }
        },
        builder: (context, state) {
          final cubit = context.read<OnboardingCubit>();
          return Stack(
            children: [
              PageView(
                controller: cubit.pageController,
                onPageChanged: (index) {
                  cubit.updatePage(index);
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
                  controller: cubit.pageController,
                  count: 3,
                  effect: const WormEffect(
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
                  ontap: () {
                    cubit.goToNextPage(context);
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
