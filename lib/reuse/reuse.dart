import 'package:flutter/material.dart';
import 'package:newgpaapp/it/semesterResults.dart';
import 'package:newgpaapp/databasehelper.dart';

class sembutton extends StatefulWidget {
  const sembutton({
    super.key,
    required this.width,
    required this.height,
    required this.name,
    required this.studentId,
    required this.sem,
    required this.studentcourse,
  });

  final String name;
  final double width;
  final double height;
  final int studentId;
  final int sem;
  final String studentcourse;

  @override
  State<sembutton> createState() => _sembuttonState();
}

class _sembuttonState extends State<sembutton> {
  final DatabaseHelper _dbHelper = DatabaseHelper();
  double semesterGPA = 0.0;

  @override
  void initState() {
    super.initState();
    _loadSemesterGPA();
  }

  Future<void> _loadSemesterGPA() async {
    double gpa = await _dbHelper.calculateSemesterGPA(
      widget.studentId,
      widget.sem,
    );
    setState(() {
      semesterGPA = gpa;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        if (widget.studentcourse == "IT") {
          if (widget.sem == 1) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder:
                    (context) => SemesterResults(
                      studentId: widget.studentId,
                      semester: widget.sem,
                      courseCodes: [
                        'IT113',
                        'IT1122',
                        'IT1134',
                        'IT1144',
                        'IT1152',
                      ],
                    ),
              ),
            );
          }
          if (widget.sem == 2) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder:
                    (context) => SemesterResults(
                      studentId: widget.studentId,
                      semester: widget.sem,
                      courseCodes: [
                        'IT1214',
                        'IT1223',
                        'IT1232',
                        'IT1242',
                        'IT1252',
                        'IT11262',
                      ],
                    ),
              ),
            );
          }
          if (widget.sem == 3) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder:
                    (context) => SemesterResults(
                      studentId: widget.studentId,
                      semester: widget.sem,
                      courseCodes: [
                        'IT2114',
                        'IT2122',
                        'IT2133',
                        'IT2143',
                        'IT2153',
                      ],
                    ),
              ),
            );
          }
          if (widget.sem == 4) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder:
                    (context) => SemesterResults(
                      studentId: widget.studentId,
                      semester: widget.sem,
                      courseCodes: [
                        'IT2212',
                        'IT2223',
                        'IT2234',
                        'IT2244',
                        'IT2252',
                      ],
                    ),
              ),
            );
          }
          if (widget.sem == 5) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder:
                    (context) => SemesterResults(
                      studentId: widget.studentId,
                      semester: widget.sem,
                      courseCodes: [
                        'IT3113',
                        'IT3122',
                        'IT3133',
                        'IT3143',
                        'IT3152',
                        'IT3162',
                      ],
                    ),
              ),
            );
          }
          if (widget.sem == 6) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder:
                    (context) => SemesterResults(
                      studentId: widget.studentId,
                      semester: widget.sem,
                      courseCodes: [
                        'IT3213',
                        'IT3223',
                        'IT3232',
                        'IT3243',
                        'IT3252',
                        'IT3262',
                      ],
                    ),
              ),
            );
          }
          if (widget.sem == 7) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder:
                    (context) => SemesterResults(
                      studentId: widget.studentId,
                      semester: widget.sem,
                      courseCodes: [
                        'IT4113',
                        'IT4123',
                        'IT4133',
                        'IT4142',
                        'IT4153',
                        'EL4112',
                        'EL4122',
                        'EL4132',
                        'EL4142',
                        'EL4152',
                        'EL4162',
                        'EL4172',
                        'EL4182',
                        'EL4192',
                      ],
                    ),
              ),
            );
          }
          if (widget.sem == 8) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder:
                    (context) => SemesterResults(
                      studentId: widget.studentId,
                      semester: widget.sem,
                      courseCodes: ['IT4216', 'IT4226'],
                    ),
              ),
            );
          }
        }
        //-------------------------------//
        if (widget.studentcourse == "AMC") {
          if (widget.sem == 1) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder:
                    (context) => SemesterResults(
                      studentId: widget.studentId,
                      semester: widget.sem,
                      courseCodes: [
                        'AMA1113',
                        'PMA1113',
                        'STA1113',
                        'CSC1113',
                        'CSC1123',
                      ],
                    ),
              ),
            );
          }
          if (widget.sem == 2) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder:
                    (context) => SemesterResults(
                      studentId: widget.studentId,
                      semester: widget.sem,
                      courseCodes: [
                        'AMA1213',
                        'PMA1213',
                        'STA1213',
                        'CSC1213',
                        'CSC1223',
                      ],
                    ),
              ),
            );
          }
          if (widget.sem == 3) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder:
                    (context) => SemesterResults(
                      studentId: widget.studentId,
                      semester: widget.sem,
                      courseCodes: [
                        'AMA2113',
                        'AMA2122',
                        'PMA2113',
                        'STA2113',
                        'CSC2113',
                        'CSC2122',
                      ],
                    ),
              ),
            );
          }
          if (widget.sem == 4) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder:
                    (context) => SemesterResults(
                      studentId: widget.studentId,
                      semester: widget.sem,
                      courseCodes: [
                        'AMA2213',
                        'STA2213',
                        'CSC2212',
                        'CSC2222',
                        'CSC2234',
                      ],
                    ),
              ),
            );
          }
          if (widget.sem == 5) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder:
                    (context) => SemesterResults(
                      studentId: widget.studentId,
                      semester: widget.sem,
                      courseCodes: [
                        'AMA3113',
                        'AMA3122',
                        'STA3113',
                        'CSC3112',
                        'CSC3123',
                        'CSC3132',
                      ],
                    ),
              ),
            );
          }
          if (widget.sem == 6) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder:
                    (context) => SemesterResults(
                      studentId: widget.studentId,
                      semester: widget.sem,
                      courseCodes: [
                        'AMA3213',
                        'PMA3213',
                        'STA3212',
                        'CSC3213',
                        'CSC3222',
                      ],
                    ),
              ),
            );
          }
        }
        //-------------------------------//
        if (widget.studentcourse == "CS") {
          if (widget.sem == 1) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder:
                    (context) => SemesterResults(
                      studentId: widget.studentId,
                      semester: widget.sem,
                      courseCodes: [
                        'AMA1113',
                        'PMA1113',
                        'STA1113',
                        'CSC1113',
                        'CSC1123',
                      ],
                    ),
              ),
            );
          }
          if (widget.sem == 2) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder:
                    (context) => SemesterResults(
                      studentId: widget.studentId,
                      semester: widget.sem,
                      courseCodes: [
                        'AMA1213',
                        'PMA1213',
                        'STA1213',
                        'CSC1213',
                        'CSC1223',
                      ],
                    ),
              ),
            );
          }
          if (widget.sem == 3) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder:
                    (context) => SemesterResults(
                      studentId: widget.studentId,
                      semester: widget.sem,
                      courseCodes: [
                        'AMA2113',
                        'AMA2122',
                        'PMA2113',
                        'STA2113',
                        'CSC2113',
                        'CSC2122',
                      ],
                    ),
              ),
            );
          }
          if (widget.sem == 4) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder:
                    (context) => SemesterResults(
                      studentId: widget.studentId,
                      semester: widget.sem,
                      courseCodes: [
                        'AMA2213',
                        'STA2213',
                        'CSC2212',
                        'CSC2222',
                        'CSC2234',
                      ],
                    ),
              ),
            );
          }
          if (widget.sem == 5) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder:
                    (context) => SemesterResults(
                      studentId: widget.studentId,
                      semester: widget.sem,
                      courseCodes: [
                        'AMA3122',
                        'CSC3112',
                        'CSC3123',
                        'CSC3132',
                        'CSH3143',
                        'CSH3153',
                        'CSH3163',
                      ],
                    ),
              ),
            );
          }
          if (widget.sem == 6) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder:
                    (context) => SemesterResults(
                      studentId: widget.studentId,
                      semester: widget.sem,
                      courseCodes: [
                        'CSC3213',
                        'CSC3222',
                        'CSH3242',
                        'CSH3254',
                        'CSH3273',
                        'CSH3273',
                      ],
                    ),
              ),
            );
          }
          if (widget.sem == 7) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder:
                    (context) => SemesterResults(
                      studentId: widget.studentId,
                      semester: widget.sem,
                      courseCodes: [
                        'CSH4112',
                        'CSH4123',
                        'CSH4133',
                        'CSH4144',
                        'CSH4152',
                        'CSH4162',
                        'CSH4173',
                      ],
                    ),
              ),
            );
          }
          if (widget.sem == 8) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder:
                    (context) => SemesterResults(
                      studentId: widget.studentId,
                      semester: widget.sem,
                      courseCodes: ['CSH4216', 'CSH4226'],
                    ),
              ),
            );
          }
        }

        //BIO
        //-------------------------------//
        if (widget.studentcourse == "BIO") {
          if (widget.sem == 1) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder:
                    (context) => SemesterResults(
                      studentId: widget.studentId,
                      semester: widget.sem,
                      courseCodes: [
                        'ENS1112',
                        'ENS1121',
                        'ENS1132',
                        'ENS1142',
                        'ENS1162',
                        'CCU1113',
                      ],
                    ),
              ),
            );
          }
          if (widget.sem == 2) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder:
                    (context) => SemesterResults(
                      studentId: widget.studentId,
                      semester: widget.sem,
                      courseCodes: [
                        'ENS1212',
                        'ENS1223',
                        'ENS1232',
                        'ENS1242',
                        'ENS1253',
                      ],
                    ),
              ),
            );
          }
          if (widget.sem == 3) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder:
                    (context) => SemesterResults(
                      studentId: widget.studentId,
                      semester: widget.sem,
                      courseCodes: [
                        'ENS2112',
                        'ENS2123',
                        'ENS2132',
                        'ENS2142',
                        'ENS2152',
                        'ENS2162',
                        'ENS2172',
                      ],
                    ),
              ),
            );
          }
          if (widget.sem == 4) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder:
                    (context) => SemesterResults(
                      studentId: widget.studentId,
                      semester: widget.sem,
                      courseCodes: [
                        'ENS2213',
                        'ENS2222',
                        'ENS2233',
                        'ENS2242',
                        'ENS2252',
                        'ENS2263',
                      ],
                    ),
              ),
            );
          }
          if (widget.sem == 5) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder:
                    (context) => SemesterResults(
                      studentId: widget.studentId,
                      semester: widget.sem,
                      courseCodes: [
                        'ENS3113',
                        'ENS3122',
                        'ENS3132',
                        'ENS3143',
                        'ENS3153',
                        'ENS3162',
                      ],
                    ),
              ),
            );
          }
          if (widget.sem == 6) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder:
                    (context) => SemesterResults(
                      studentId: widget.studentId,
                      semester: widget.sem,
                      courseCodes: [
                        'ENS3213',
                        'ENS3222',
                        'ENS3232',
                        'ENS3242',
                        'ENS3251',
                        'ENS3262',
                        'ENS3273',
                      ],
                    ),
              ),
            );
          }
          if (widget.sem == 7) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder:
                    (context) => SemesterResults(
                      studentId: widget.studentId,
                      semester: widget.sem,
                      courseCodes: [
                        'ENS4112',
                        'ENS4122',
                        'ENS4133',
                        'ENS4142',
                        'ENS4152',
                        'ENS4163',
                        'ENS4173',
                        'ENS4183',
                        'ENS4192',
                        'ENS41(10)2',
                        'ENS41(11)3',
                      ],
                    ),
              ),
            );
          }
          if (widget.sem == 8) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder:
                    (context) => SemesterResults(
                      studentId: widget.studentId,
                      semester: widget.sem,
                      courseCodes: [
                        'ENS4211',
                        'ENS4226',
                        'ENS4232',
                        'ENS4242',
                        'ENS4252',
                      ],
                    ),
              ),
            );
          }
        }

        //TECH
        //-------------------------------//
        if (widget.studentcourse == "Tech") {
          if (widget.sem == 1) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder:
                    (context) => SemesterResults(
                      studentId: widget.studentId,
                      semester: widget.sem,
                      courseCodes: [
                        'TICT1114',
                        'TICT1123',
                        'TICT1134',
                        'TICT1142',
                        'TICT1152',
                      ],
                    ),
              ),
            );
          }
          if (widget.sem == 2) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder:
                    (context) => SemesterResults(
                      studentId: widget.studentId,
                      semester: widget.sem,
                      courseCodes: [
                        'TICT1212',
                        'TICT1224',
                        'TICT1233',
                        'TICT1243',
                        'TICT1252',
                        'TICT1261',
                      ],
                    ),
              ),
            );
          }
          if (widget.sem == 3) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder:
                    (context) => SemesterResults(
                      studentId: widget.studentId,
                      semester: widget.sem,
                      courseCodes: [
                        'TICT2113',
                        'TICT2122',
                        'TICT2134',
                        'TICT2142',
                        'TICT2153',
                      ],
                    ),
              ),
            );
          }
          if (widget.sem == 4) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder:
                    (context) => SemesterResults(
                      studentId: widget.studentId,
                      semester: widget.sem,
                      courseCodes: [
                        'TICT2212',
                        'TICT2222',
                        'TICT2233',
                        'TICT2244',
                        'TICT2252',
                        'TICT2263',
                      ],
                    ),
              ),
            );
          }
          if (widget.sem == 5) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder:
                    (context) => SemesterResults(
                      studentId: widget.studentId,
                      semester: widget.sem,
                      courseCodes: [
                        'TICT3113',
                        'TICT3123',
                        'TICT3132',
                        'TICT3142',
                        'TICT3153',
                        'TICT3162',
                      ],
                    ),
              ),
            );
          }
          if (widget.sem == 6) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder:
                    (context) => SemesterResults(
                      studentId: widget.studentId,
                      semester: widget.sem,
                      courseCodes: [
                        'TICT3214',
                        'TICT3222',
                        'TICT3232',
                        'TICT3243',
                        'TICT3252',
                        'TICT3262',
                      ],
                    ),
              ),
            );
          }
          if (widget.sem == 7) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder:
                    (context) => SemesterResults(
                      studentId: widget.studentId,
                      semester: widget.sem,
                      courseCodes: ['TICT4116', 'TICT4126'],
                    ),
              ),
            );
          }
          if (widget.sem == 8) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder:
                    (context) => SemesterResults(
                      studentId: widget.studentId,
                      semester: widget.sem,
                      courseCodes: [
                        'TICT4213',
                        'TICT4223',
                        'TICT4233',
                        'TICT4242',
                        'TICT4253',
                        'TICT4262',
                        'TICT4272',
                      ],
                    ),
              ),
            );
          }
        }
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color.fromARGB(255, 45, 100, 107),
        padding: EdgeInsets.symmetric(
          horizontal: widget.width * 0.05,
          vertical: widget.height * 0.02,
        ),
        minimumSize: Size(widget.width * 0.35, widget.height * 0.1),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        elevation: 2,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            widget.name,
            style: TextStyle(
              fontSize: widget.width * 0.04,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: widget.height * 0.005),
          Text(
            'GPA: ${semesterGPA.toStringAsFixed(2)}',
            style: TextStyle(
              fontSize: widget.width * 0.035,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
