// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'phone_auth_bloc.dart';

sealed class PhoneAuthEvent {}

class VerifyPhoneNumberEvent extends PhoneAuthEvent {
  final String phoneNumber;
  VerifyPhoneNumberEvent({required this.phoneNumber});
}

class EmitFailureEvent extends PhoneAuthEvent {
  final String message;
  EmitFailureEvent({required this.message});
}

class EmitCodeSentEvent extends PhoneAuthEvent {
  final String verificationId;
  final int? resendToken;
  EmitCodeSentEvent({
    required this.verificationId,
    this.resendToken,
  });
}

class VerifyOtpAndSignInEvent extends PhoneAuthEvent {
  final String otp;
  final String verificationId;
  VerifyOtpAndSignInEvent({required this.otp,required this.verificationId});
}
