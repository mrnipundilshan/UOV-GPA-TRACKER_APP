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
              colors: [Color(0xFF42A5F5), Color(0xFF1E88E5)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: SafeArea(child: child),
        ),
        Positioned(
          top: height * 0.6, // Adjust the top position
          left: width * -0.3, // Adjust the left position
          child: Image.asset(
            'assets/bg.png',
            fit: BoxFit.fitWidth,
            opacity: AlwaysStoppedAnimation(0.1),
          ),
        ),
      ],
    );
  }
}
