import 'package:flutter/material.dart';

class CurvedScreen extends StatelessWidget {
  const CurvedScreen({super.key, required this.child});
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: CustomPaint(
        size: Size(MediaQuery.sizeOf(context).width,
            MediaQuery.sizeOf(context).height),
        painter: CurvePainter(),
        child: child,
      ),
    );
  }
}

class CurvePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint2 = Paint()
      ..color = const Color.fromRGBO(237, 36, 51, 0.4);
    final Path path2 = Path()
      ..moveTo(0, size.height * 0.13)
      ..lineTo(0, size.height * 0.23)
      ..quadraticBezierTo(
        size.width * 0.2,
        size.width * 0.6,
        size.width * 0.65,
        size.height * 0.13,
      )
      ..quadraticBezierTo(
          size.width * 0.95, size.height * 0.02, size.width, size.height * 0.13)
      ..lineTo(size.width, 0)
      ..close();
    canvas.drawPath(path2, paint2);
    final Paint paint = Paint()..color = Colors.red;
    final Path path = Path()
      ..lineTo(0, size.height * 0.13)
      ..quadraticBezierTo(
        size.width * 0.28,
        size.width * 0.37,
        size.width * 0.63,
        size.height * 0.1,
      )
      ..quadraticBezierTo(size.width, 0, size.width, size.height * 0.13)
      ..lineTo(size.width, 0)
      ..close();
    canvas.drawPath(path, paint);
    final Paint paint3 = Paint()
      ..color = const Color.fromRGBO(237, 36, 51, 0.4);
    final Path path3 = Path()
      ..moveTo(0, size.height * 0.88)
      ..quadraticBezierTo(
        size.width * 0.15,
        size.height + 60,
        size.width * 0.67,
        size.height * 0.8,
      )
      ..quadraticBezierTo(
          size.width * 0.75, size.height * 0.75, size.width, size.height * 0.85)
      ..lineTo(size.width, size.height)
      ..lineTo(0, size.height)
      ..close();
    canvas.drawPath(path3, paint3);
    final Paint paint4 = Paint()..color = Colors.red;
    final Path path4 = Path()
      ..moveTo(0, size.height * 0.91)
      ..quadraticBezierTo(
        0,
        size.height,
        size.width * 0.22,
        size.height,
      )
      ..lineTo(size.width * 0.25, size.height)
      ..quadraticBezierTo(
          size.width * 0.58, size.height * 0.85, size.width, size.height * 0.86)
      ..lineTo(size.width, size.height)
      ..lineTo(0, size.height)
      ..close();
    canvas.drawPath(path4, paint4);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
