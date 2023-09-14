import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:phone_number_auth_complex_ui/screens/home_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.red,
        filledButtonTheme: FilledButtonThemeData(
            style: ButtonStyle(
          minimumSize: MaterialStateProperty.all<Size>(
            const Size(179, 45),
          ),
        )),
        inputDecorationTheme: const InputDecorationTheme(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(52),
            ),
          ),
        ),
      ),
      home: const HomeScreen(),
    );
  }
}
