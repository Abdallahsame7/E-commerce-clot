import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'signin_state.dart';

class SigninCubit extends Cubit<SigninState> {
  SigninCubit() : super(SigninInitial());
   
     
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
}
