import 'package:newgpaapp/reuse/reuse.dart';

import '../background/bg.dart';
import 'package:flutter/material.dart';

class itgpapage extends StatefulWidget {
  final int studentId; // Add this property
  final String studentcourse;
  const itgpapage({
    super.key,
    required this.studentId,
    required this.studentcourse,
  }); // Update constructor

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
          SizedBox(height: height * 0.03),
          Text(
            "1st Year",
            style: TextStyle(
              fontSize: 36,
              color: Colors.white,
              decoration: TextDecoration.none,
            ),
          ),
          SizedBox(height: height * 0.01),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              sembutton(
                width: width,
                height: height,
                name: 'Semester 01',
                studentId: widget.studentId,
                studentcourse: widget.studentcourse,
                sem: 1,
              ),
              sembutton(
                width: width,
                height: height,
                name: 'Semester 02',
                studentId: widget.studentId,
                studentcourse: widget.studentcourse,
                sem: 2,
              ),
            ],
          ),

          SizedBox(height: height * 0.03),
          Text(
            "2nd Year",
            style: TextStyle(
              fontSize: 36,
              color: Colors.white,
              decoration: TextDecoration.none,
            ),
          ),
          SizedBox(height: height * 0.01),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              sembutton(
                width: width,
                height: height,
                name: 'Semester 01',
                studentId: widget.studentId,
                studentcourse: widget.studentcourse,
                sem: 3,
              ),
              sembutton(
                width: width,
                height: height,
                name: 'Semester 02',
                studentId: widget.studentId,
                studentcourse: widget.studentcourse,
                sem: 4,
              ),
            ],
          ),

          SizedBox(height: height * 0.03),
          Text(
            "3rd Year",
            style: TextStyle(
              fontSize: 36,
              color: Colors.white,
              decoration: TextDecoration.none,
            ),
          ),
          SizedBox(height: height * 0.01),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              sembutton(
                width: width,
                height: height,
                name: 'Semester 01',
                studentId: widget.studentId,
                studentcourse: widget.studentcourse,
                sem: 5,
              ),
              sembutton(
                width: width,
                height: height,
                name: 'Semester 02',
                studentId: widget.studentId,
                studentcourse: widget.studentcourse,
                sem: 6,
              ),
            ],
          ),
          SizedBox(height: height * 0.03),
          Text(
            "4th Year",
            style: TextStyle(
              fontSize: 36,
              color: Colors.white,
              decoration: TextDecoration.none,
            ),
          ),
          SizedBox(height: height * 0.01),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              sembutton(
                width: width,
                height: height,
                name: 'Semester 01',
                studentId: widget.studentId,
                studentcourse: widget.studentcourse,
                sem: 7,
              ),
              sembutton(
                width: width,
                height: height,
                name: 'Semester 02',
                studentId: widget.studentId,
                studentcourse: widget.studentcourse,
                sem: 8,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
