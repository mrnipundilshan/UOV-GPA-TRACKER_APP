import 'package:flutter/material.dart';
import 'package:newgpaapp/background/bg.dart';
import 'package:newgpaapp/homepage.dart';

class itsemone extends StatefulWidget {
  final int studentId; // Add this property
  const itsemone({super.key, required this.studentId});

  @override
  State<itsemone> createState() => _itsemoneState();
}

class _itsemoneState extends State<itsemone> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Background(
      child: Column(
        children: [
          Text(
            widget.studentId.toString(),
            style: TextStyle(
              fontSize: 36,
              color: Colors.white,
              decoration: TextDecoration.none,
            ),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => Homepage()),
                (route) => false,
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color.fromARGB(255, 45, 100, 107),
              padding: const EdgeInsets.symmetric(horizontal: 16),
              minimumSize: Size(width * 0.25, height * 0.06),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              elevation: 2,
            ),
            child: Text(
              'Cancel',
              style: TextStyle(fontSize: 16, color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
