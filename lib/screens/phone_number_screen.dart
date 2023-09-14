import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:phone_number_auth_complex_ui/bloc/phone_auth_bloc.dart';
import 'package:phone_number_auth_complex_ui/screens/curved_screen.dart';
import 'package:phone_number_auth_complex_ui/screens/otp_screen.dart';

class PhoneNumberScreen extends StatelessWidget {
  PhoneNumberScreen({super.key});
  final ValueNotifier<bool> isValidNumber = ValueNotifier<bool>(true);
  final TextEditingController _editingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider<PhoneAuthBloc>(
      create: (context) => PhoneAuthBloc(),
      child: BlocConsumer<PhoneAuthBloc, PhoneAuthState>(
        listener: (context, state) {
          if (state is CodeSentState) {
            log(state.verificationId.toString());
            log(state.resendToken.toString());
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => OtpScreen(
                  verificationId: state.verificationId,
                ),
              ),
            );
          }
          if (state is PhoneAuthFailureState) {
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
                Text(
                  'Welcome',
                  style: GoogleFonts.atkinsonHyperlegible(
                    fontSize: 48,
                    fontWeight: FontWeight.w400,
                    letterSpacing: 5.04,
                  ),
                ),
                const SizedBox(
                  height: 28,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Expanded(
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 27),
                        child: Divider(
                          color: Colors.black,
                          height: 1,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 28,
                    ),
                    Text(
                      'Log in or sign up',
                      style: GoogleFonts.atkinsonHyperlegible(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        letterSpacing: 1.57,
                      ),
                    ),
                    const Expanded(
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 27),
                        child: Divider(
                          color: Colors.black,
                          height: 1,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 27),
                    child: Text(
                      'Log in',
                      style: GoogleFonts.inter(
                        fontSize: 20,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 29,
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 27,
                    right: 54,
                  ),
                  child: SizedBox(
                    height: 45,
                    child: TextField(
                      controller: _editingController,
                      keyboardType: TextInputType.phone,
                      maxLength: 10,
                      decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.phone),
                        hintText: 'Phone Number',
                        counterText: '',
                        contentPadding: EdgeInsets.zero,
                        hintStyle: GoogleFonts.inter(
                          fontSize: 18,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ),
                ),
                ValueListenableBuilder(
                  valueListenable: isValidNumber,
                  builder: (context, value, child) => Visibility(
                    visible: !value,
                    child: Padding(
                      padding: const EdgeInsets.only(
                        left: 35,
                      ),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Enter a valid number',
                          style: GoogleFonts.inter(
                              fontSize: 10, color: Colors.red),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 28,
                ),
                (state is PhoneAuthLoadingState)
                    ? const CircularProgressIndicator()
                    : FilledButton(
                        onPressed: () {
                          if (_editingController.text.length < 10) {
                            isValidNumber.value = false;
                          } else {
                            isValidNumber.value = true;
                            FocusScope.of(context).unfocus();
                            context.read<PhoneAuthBloc>().add(
                                VerifyPhoneNumberEvent(
                                    phoneNumber: _editingController.text));
                          }
                        },
                        child: const Text('Login'),
                      ),
                const SizedBox(
                  height: 36,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SizedBox(
                          width: 14,
                          height: 14,
                          child: Checkbox(
                            value: false,
                            onChanged: (val) {},
                          ),
                        ),
                        const SizedBox(
                          width: 6,
                        ),
                        const Text('Remember me'),
                      ],
                    ),
                    const Text('Login OTP'),
                    const Text('Forgot Password?'),
                  ],
                ),
                const SizedBox(
                  height: 17,
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 27,
                  ),
                  child: Row(
                    children: [
                      const Text('Don’t have an account?'),
                      const SizedBox(
                        width: 13,
                      ),
                      Text(
                        'Sign up Now',
                        style: GoogleFonts.kanit(
                          fontSize: 13,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
