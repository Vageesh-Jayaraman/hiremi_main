import 'package:flutter/material.dart';
import 'package:hiremi_version_two/FirstLandingPage.dart';

class HiremiScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    double imageSize = MediaQuery.of(context).size.width * 0.6;

    // Delayed navigation logic
    Future.delayed(Duration(seconds: 2), () {
      Navigator.pushReplacement(
        context,
        PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) => FirstLandingPage(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            const begin = 0.0;
            const end = 1.0;
            const curve = Curves.easeInOut;
            var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
            return FadeTransition(
              opacity: animation.drive(tween),
              child: child,
            );
          },
        ),
      );
    });

    return Scaffold(
      body: Center(
        child: Image.asset(
          'images/Hiremi_new_Icon.png',
          width: imageSize,
          height: imageSize,
        ),
      ),
    );
  }
}
