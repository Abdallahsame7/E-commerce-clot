part of 'signin_cubit.dart';

@immutable
sealed class SigninState {}

final class SigninInitial extends SigninState {}

final class  SigninLoding extends SigninState {}

final class  SigninSuccess extends SigninState {}

final class  SigninError extends SigninState {
  final String message;
  SigninError(this.message);
}