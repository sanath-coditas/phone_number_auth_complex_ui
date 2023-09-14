import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:phone_number_auth_complex_ui/screens/curved_screen.dart';

class ForgotPassword extends StatelessWidget {
  const ForgotPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return CurvedScreen(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(
            height: 28,
          ),
          Text(
            'Forget password',
            style: GoogleFonts.atkinsonHyperlegible(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              letterSpacing: 1.57,
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.only(left: 27),
              child: Text(
                'Forget password',
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
                keyboardType: TextInputType.emailAddress,
                maxLength: 10,
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.phone),
                  hintText: 'Email',
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
          const SizedBox(
            height: 31,
          ),
          FilledButton(
            onPressed: () {},
            child: const Text('Login'),
          ),
          const SizedBox(
            height: 36,
          ),
          const Row(
            children: [
              SizedBox(
                width: 27,
              ),
              Text('Don’t have an account?'),
              SizedBox(
                width: 10,
              ),
              Text('Sign up Now'),
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
                const Text('Already have an account?'),
                const SizedBox(
                  width: 13,
                ),
                Text(
                  'Sign in',
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
  }
}
