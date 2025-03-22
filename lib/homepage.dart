import 'background/bg.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

// ignore: camel_case_types
class homepage extends StatelessWidget {
  const homepage({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Background(
      child: Scaffold(
        body: Background(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                'assets/profile.svg',
                width: width * 0.5,
                colorFilter: ColorFilter.mode(Colors.white, BlendMode.srcIn),
              ),
              SizedBox(height: height * 0.01),
              Text(
                "Add Student",
                style: TextStyle(color: Colors.white, fontSize: width * 0.1),
              ),
              IconButton(
                alignment: Alignment.topRight,
                onPressed: () {
                  // Add your button action here
                },
                icon: Icon(
                  Icons.add_circle_outline,
                  size: width * 0.2,
                  color: Colors.white,
                ),
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
