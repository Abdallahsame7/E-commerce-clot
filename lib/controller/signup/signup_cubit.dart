import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'signup_state.dart';

class SignupCubit extends Cubit<SignupState> {
  SignupCubit() : super(SignupInitial());

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  void validateAndSubmit() {
    if (formKey.currentState?.validate() ?? false) {
      emit(SignupSuccess());
    } else {
      emit(SignupError("Please fill all the fields"));
    }
  }

   void createAccountFirebase(
      {required String email, required String password}) async {
    await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password)
        .then((value) {
      emit(SignupSuccess());
    }).catchError((error) {
      emit(SignupError("error"));
    });
  }
}
