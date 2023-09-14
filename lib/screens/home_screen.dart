import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:phone_number_auth_complex_ui/screens/curved_screen.dart';
import 'package:phone_number_auth_complex_ui/screens/forgot_password_screen.dart';
import 'package:phone_number_auth_complex_ui/screens/phone_number_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
                'Sign in',
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
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.person),
                  hintText: 'Email/Phone',
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
            height: 32,
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 27,
              right: 54,
            ),
            child: SizedBox(
              height: 45,
              child: TextField(
                decoration: InputDecoration(
                  hintStyle: GoogleFonts.inter(
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                  ),
                  prefixIcon: const Icon(Icons.lock),
                  hintText: 'Password',
                  contentPadding: EdgeInsets.zero,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 28,
          ),
          FilledButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => PhoneNumberScreen(),
              ));
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
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const ForgotPassword(),
                  ));
                },
                child: const Text('Forgot Password?'),
              ),
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
  }
}
