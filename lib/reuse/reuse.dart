import 'package:flutter/material.dart';
import 'package:newgpaapp/it/semesterResults.dart';

class sembutton extends StatelessWidget {
  const sembutton({
    super.key,
    required this.width,
    required this.height,
    required this.name,
    required this.studentId,
    required this.sem,
  });

  final String name;
  final double width;
  final double height;
  final int studentId;
  final int sem;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        if (sem == 1) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder:
                  (context) => SemesterResults(
                    studentId: studentId,
                    semester: sem,
                    courseCodes: [
                      'IT113',
                      'IT1122',
                      'IT1134',
                      'IT1144',
                      'IT1152',
                      'ACU1113',
                    ],
                  ),
            ),
          );
        }
        if (sem == 2) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder:
                  (context) => SemesterResults(
                    studentId: studentId,
                    semester: sem,
                    courseCodes: [
                      'IT1214',
                      'IT1223',
                      'IT1232',
                      'IT1242',
                      'IT1252',
                      'IT11262',
                      'ACU1212',
                    ],
                  ),
            ),
          );
        }
        if (sem == 3) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder:
                  (context) => SemesterResults(
                    studentId: studentId,
                    semester: sem,
                    courseCodes: [
                      'IT2114',
                      'IT2122',
                      'IT2133',
                      'IT2143',
                      'IT2153',
                      'ACU2113',
                    ],
                  ),
            ),
          );
        }
        if (sem == 4) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder:
                  (context) => SemesterResults(
                    studentId: studentId,
                    semester: sem,
                    courseCodes: [
                      'IT2212',
                      'IT2223',
                      'IT2234',
                      'IT2244',
                      'IT2252',
                      'ACU2212',
                    ],
                  ),
            ),
          );
        }
        if (sem == 5) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder:
                  (context) => SemesterResults(
                    studentId: studentId,
                    semester: sem,
                    courseCodes: [
                      'IT3113',
                      'IT3122',
                      'IT3133',
                      'IT3143',
                      'IT3152',
                      'IT3162',
                      'ACU3112',
                    ],
                  ),
            ),
          );
        }
        if (sem == 6) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder:
                  (context) => SemesterResults(
                    studentId: studentId,
                    semester: sem,
                    courseCodes: [
                      'IT3213',
                      'IT3223',
                      'IT3232',
                      'IT3243',
                      'IT3252',
                      'IT3262',
                      'ACU3212',
                      'ACU3222',
                    ],
                  ),
            ),
          );
        }
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
