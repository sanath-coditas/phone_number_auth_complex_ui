import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:phone_number_auth_complex_ui/bloc/phone_auth_bloc.dart';
import 'package:phone_number_auth_complex_ui/screens/curved_screen.dart';
import 'package:phone_number_auth_complex_ui/screens/success_screen.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class OtpScreen extends StatelessWidget {
  OtpScreen({super.key, required this.verificationId});
  final String verificationId;
  final TextEditingController _otpController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocProvider<PhoneAuthBloc>(
      create: (context) => PhoneAuthBloc(),
      child: BlocConsumer<PhoneAuthBloc, PhoneAuthState>(
        listener: (context, state) {
          if (state is SignInSuccessState) {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => const SuccessScreen(),
            ));
          }
          if (state is PhoneAuthFailureState) {
            ScaffoldMessenger.of(context).removeCurrentSnackBar();
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                backgroundColor: Colors.transparent,
                content: DecoratedBox(
                  decoration: const BoxDecoration(
                    color: Colors.white,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      state.message,
                      style: const TextStyle(color: Colors.black),
                    ),
                  ),
                )));
          }
        },
        builder: (context, state) {
          return CurvedScreen(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('OTP NUmber'),
                const SizedBox(
                  height: 46,
                ),
                SizedBox(
                  height: 30,
                  width: double.infinity,
                  child: PinCodeTextField(
                    appContext: context,
                    controller: _otpController,
                    length: 6,
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.digitsOnly,
                    ],
                    keyboardType: TextInputType.phone,
                    mainAxisAlignment: MainAxisAlignment.center,
                    cursorColor: Colors.black,
                    cursorHeight: 20,
                    pinTheme: PinTheme(
                      fieldOuterPadding:
                          const EdgeInsets.symmetric(horizontal: 10),
                      shape: PinCodeFieldShape.box,
                      borderRadius: BorderRadius.zero,
                      fieldHeight: 30,
                      fieldWidth: 30,
                      activeColor: Colors.black,
                      selectedColor: Colors.black,
                      inactiveColor: Colors.black,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 46,
                ),
                (state is PhoneAuthLoadingState)
                    ? const Center(
                        child: CircularProgressIndicator(),
                      )
                    : FilledButton(
                        onPressed: () {
                          if (_otpController.text.length == 6) {
                            context.read<PhoneAuthBloc>().add(
                                  VerifyOtpAndSignInEvent(
                                    verificationId: verificationId,
                                    otp: _otpController.text,
                                  ),
                                );
                          } else {
                            ScaffoldMessenger.of(context)
                                .removeCurrentSnackBar();
                            ScaffoldMessenger.of(context)
                                .showSnackBar(const SnackBar(
                                    backgroundColor: Colors.transparent,
                                    content: DecoratedBox(
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                      ),
                                      child: Padding(
                                        padding: EdgeInsets.all(8.0),
                                        child: Text(
                                          'Enter all digits',
                                          style: TextStyle(color: Colors.black),
                                        ),
                                      ),
                                    )));
                          }
                        },
                        child: const Text('Sign in'))
              ],
            ),
          );
        },
      ),
    );
  }
}
