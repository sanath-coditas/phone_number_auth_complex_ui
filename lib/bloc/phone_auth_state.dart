part of 'phone_auth_bloc.dart';

sealed class PhoneAuthState {}

final class PhoneAuthInitial extends PhoneAuthState {}

class PhoneAuthLoadingState extends PhoneAuthState {}

class PhoneAuthFailureState extends PhoneAuthState {
  final String message;
  PhoneAuthFailureState({required this.message});
}

class CodeSentState extends PhoneAuthState {
  final String verificationId;
  final int? resendToken;
  CodeSentState({required this.verificationId, this.resendToken});
}
class SignInSuccessState extends PhoneAuthState{}
