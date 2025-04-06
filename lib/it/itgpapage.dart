import 'package:newgpaapp/reuse/reuse.dart';
import '../background/bg.dart';
import 'package:flutter/material.dart';
import '../databasehelper.dart';

class itgpapage extends StatefulWidget {
  final int studentId;
  final String studentcourse;
  const itgpapage({
    super.key,
    required this.studentId,
    required this.studentcourse,
  });

  @override
  State<itgpapage> createState() => _itgpapageState();
}

class _itgpapageState extends State<itgpapage> {
  final DatabaseHelper _dbHelper = DatabaseHelper();
  Map<int, double> yearGPAs = {};

  @override
  void initState() {
    super.initState();
    _loadYearGPAs();
  }

  Future<void> _loadYearGPAs() async {
    for (int year = 1; year <= 4; year++) {
      double gpa = await _dbHelper.calculateYearGPA(widget.studentId, year);
      setState(() {
        yearGPAs[year] = gpa;
      });
    }
  }

  Widget _buildYearSection(int year, List<Widget> semesterButtons) {
    return Column(
      children: [
        SizedBox(height: MediaQuery.of(context).size.height * 0.03),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "${year}${_getYearSuffix(year)} Year",
              style: TextStyle(
                fontSize: 36,
                color: Colors.white,
                decoration: TextDecoration.none,
              ),
            ),

            Text(
              'GPA: ${yearGPAs[year]?.toStringAsFixed(2) ?? "0.00"}',
              style: TextStyle(
                fontSize: 16,
                color: Colors.white,
                decoration: TextDecoration.none,
              ),
            ),
          ],
        ),
        SizedBox(height: MediaQuery.of(context).size.height * 0.01),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: semesterButtons,
        ),
      ],
    );
  }

  String _getYearSuffix(int year) {
    switch (year) {
      case 1:
        return 'st';
      case 2:
        return 'nd';
      case 3:
        return 'rd';
      default:
        return 'th';
    }
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Background(
      child: SingleChildScrollView(
        child: Column(
          children: [
            _buildYearSection(1, [
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
            ]),
            _buildYearSection(2, [
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
            ]),
            _buildYearSection(3, [
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
            ]),
            _buildYearSection(4, [
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
            ]),
          ],
        ),
      ),
    );
  }
}
