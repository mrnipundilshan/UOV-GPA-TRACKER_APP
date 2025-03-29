import 'package:flutter/material.dart';
import 'package:newgpaapp/it/semone.dart';

class sembutton extends StatelessWidget {
  const sembutton({
    super.key,
    required this.width,
    required this.height,
    required this.name,
    required this.studentId,
  });

  final String name;
  final double width;
  final double height;
  final int studentId;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => itsemone(studentId: studentId),
          ),
        );
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color.fromARGB(255, 45, 100, 107),
        padding: const EdgeInsets.symmetric(horizontal: 16),
        minimumSize: Size(width * 0.35, height * 0.08),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        elevation: 2,
      ),
      child: Text(name, style: TextStyle(fontSize: 16, color: Colors.white)),
    );
  }
}
