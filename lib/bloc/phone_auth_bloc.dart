import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'phone_auth_event.dart';
part 'phone_auth_state.dart';

class PhoneAuthBloc extends Bloc<PhoneAuthEvent, PhoneAuthState> {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  PhoneAuthBloc() : super(PhoneAuthInitial()) {
    on<PhoneAuthEvent>((event, emit) {});
    on<VerifyPhoneNumberEvent>(_verifyPhoneNumber);
    on<EmitFailureEvent>(_emitFailure);
    on<EmitCodeSentEvent>(_emitCodeSentState);
    on<VerifyOtpAndSignInEvent>(_verifyOtpAndSignIn);
  }

  FutureOr<void> _verifyOtpAndSignIn(
      VerifyOtpAndSignInEvent event, Emitter<PhoneAuthState> emit) async {
    emit(PhoneAuthLoadingState());
    PhoneAuthCredential phoneAuthCredential = PhoneAuthProvider.credential(
        verificationId: event.verificationId, smsCode: event.otp);
    try {
      await _firebaseAuth.signInWithCredential(phoneAuthCredential);
      emit(SignInSuccessState());
    } on FirebaseAuthException catch (e) {
      emit(PhoneAuthFailureState(message: e.message.toString()));
    }
  }

  FutureOr<void> _emitCodeSentState(
      EmitCodeSentEvent event, Emitter<PhoneAuthState> emit) {
    emit(CodeSentState(
        verificationId: event.verificationId, resendToken: event.resendToken));
  }

  FutureOr<void> _emitFailure(
      EmitFailureEvent event, Emitter<PhoneAuthState> emit) {
    emit(PhoneAuthFailureState(message: event.message));
  }

  FutureOr<void> _verifyPhoneNumber(
      VerifyPhoneNumberEvent event, Emitter<PhoneAuthState> emit) async {
    emit(PhoneAuthLoadingState());
    await _firebaseAuth.verifyPhoneNumber(
      phoneNumber: '+91${event.phoneNumber}',
      verificationCompleted: (PhoneAuthCredential credential) {},
      verificationFailed: (FirebaseAuthException e) {
        add(EmitFailureEvent(message: e.message.toString()));
      },
      codeSent: (String verificationId, int? resendToken) {
        add(EmitCodeSentEvent(
            verificationId: verificationId, resendToken: resendToken));
      },
      codeAutoRetrievalTimeout: (String verificationId) {},
    );
    return null;
  }
}
