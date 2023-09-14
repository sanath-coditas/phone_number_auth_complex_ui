import 'package:flutter/widgets.dart';
import 'package:phone_number_auth_complex_ui/screens/curved_screen.dart';

class SuccessScreen extends StatelessWidget {
  const SuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const CurvedScreen(
      child: Center(
        child: Text('Signed In'),
      ),
    );
  }
}
