import 'background/bg.dart';
import 'package:flutter/material.dart';

class itgpapage extends StatefulWidget {
  final int studentId; // Add this property
  const itgpapage({super.key, required this.studentId}); // Update constructor

  @override
  State<itgpapage> createState() => _itgpapageState();
}

class _itgpapageState extends State<itgpapage> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Background(
      child: Column(
        children: [
          Center(
            child: Text(
              'Student ID: ${widget.studentId}', // Display the student ID
              style: TextStyle(
                decoration: TextDecoration.none,
                color: Colors.white,
                fontSize: width * 0.05,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
