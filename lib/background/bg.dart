import 'package:flutter/material.dart';

class Background extends StatelessWidget {
  final Widget child;

  const Background({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: double.infinity,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFF05BAFF), Color(0xFF0092C2)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
        Positioned(
          top: height * 0.6,
          left: width * -0.3,
          child: Image.asset(
            'assets/bg.png',
            fit: BoxFit.cover,
            opacity: AlwaysStoppedAnimation(0.1),
          ),
        ),
        SafeArea(child: child),
      ],
    );
  }
}
