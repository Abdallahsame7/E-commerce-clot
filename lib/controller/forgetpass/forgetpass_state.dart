part of 'forgetpass_cubit.dart';

@immutable
sealed class ForgetpassState {}

final class ForgetpassInitial extends ForgetpassState {}

class ForgetpassSuccess extends ForgetpassState {}

class ForgetpassError extends ForgetpassState {
  final String message;
  ForgetpassError(this.message);
}

