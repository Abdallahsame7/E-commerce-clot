import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'onboarding_state.dart';

class OnboardingCubit extends Cubit<OnboardingState> {
  OnboardingCubit() : super(OnboardingInitial());

  final pageController = PageController();
  int currentPage = 0;

  void updatePage(int index) {
    currentPage = index;
    emit(OnboardingPageChanged(index));
  }

  void goToNextPage(context) {
    if (currentPage < 2) {
      pageController.nextPage(
        duration: const Duration(milliseconds: 600),
        curve: Curves.easeInOut,
      );
    } else {
      emit(OnboardingCompleted());
    }
  }
}
