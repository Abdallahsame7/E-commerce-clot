import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'forgetpass_state.dart';

class ForgetpassCubit extends Cubit<ForgetpassState> {
  ForgetpassCubit() : super(ForgetpassInitial());

   final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  void validateAndProceed(BuildContext context) {
    if (formKey.currentState?.validate() ?? false) {
      emit(ForgetpassSuccess());
    } else {
      emit(ForgetpassError("Please fill all the fields"));
    }
  }

  void forgetPassword({required String email}) async {
    await FirebaseAuth.instance
        .sendPasswordResetEmail(email: email)
        .then((value) {
      emit(ForgetpassSuccess());
    }).catchError((error) {
      emit(ForgetpassError("error"));
    });
  }

}
