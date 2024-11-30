import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/shared/sharedPref.dart';
import 'package:flutter_application_1/view/home/home.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../core/shared/navigation_helper.dart';

part 'signin_state.dart';

class SigninCubit extends Cubit<SigninState> {
  SigninCubit() : super(SigninInitial());

     static SigninCubit get(context) => BlocProvider.of(context);

     
     void validateAndSignin(bool isValid) {
        if (isValid) {
      emit(SigninLoding());
      Future.delayed(Duration(seconds: 1), () {
        emit(SigninSuccess());
      }
      );
    } else {
      emit(SigninError("Please fill all the fields"));
    }
  }

  void loginFirebase(
      {required String email,
      required String password,
      required BuildContext context}) async {
    await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password)
        .then((value) {
          validateAndSignin(true);
          print("succcccccesss");
          // emit(SigninSuccess());
          CacheHelper.sharedPreferences.setBool('isLoggedIn', true);
        NavigationHelper.goOff(context, HomeScreen());
      
    }).catchError((error) {
     emit(SigninError(error.toString()));
    });
  }
}
