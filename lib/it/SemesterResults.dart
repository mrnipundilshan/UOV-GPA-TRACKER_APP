import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:newgpaapp/background/bg.dart';
import 'package:newgpaapp/databasehelper.dart';
import 'package:newgpaapp/homepage.dart';
import 'package:sqflite/sqflite.dart';

class SemesterResults extends StatefulWidget {
  final int studentId;
  final int semester; // 1, 2, 3...
  final List<String> courseCodes; // Semester-specific courses

  const SemesterResults({
    super.key,
    required this.studentId,
    required this.semester,
    required this.courseCodes,
  });

  @override
  State<SemesterResults> createState() => _SemesterResultsState();
}

class _SemesterResultsState extends State<SemesterResults> {
  final List<String> gradeOptions = [
    'A+/A',
    'A-',
    'B+',
    'B',
    'B-',
    'C+',
    'C',
    'C-',
    'D+',
    'D',
    'E',
  ];

  final DatabaseHelper _dbHelper = DatabaseHelper();
  List<Map<String, dynamic>> subjects = [];
  Map<String, String?> selectedResults = {};

  @override
  void initState() {
    super.initState();
    _loadSubjects();
  }

  Future<void> _loadSubjects() async {
    try {
      final db = await _dbHelper.database;

      // 1. Load subjects for this semester
      final List<Map<String, dynamic>> loadedSubjects = await db.query(
        'subjects',
        where:
            'course_code IN (${List.filled(widget.courseCodes.length, '?').join(',')})',
        whereArgs: widget.courseCodes,
      );

      // 2. Load saved results for this student and semester
      final List<Map<String, dynamic>> savedResults = await db.query(
        'gpa_results',
        where: 'student_id = ? AND semester = ?',
        whereArgs: [widget.studentId, widget.semester],
      );

      // 3. Initialize selectedResults with all subjects
      final Map<String, String?> initialResults = {
        for (var subject in loadedSubjects)
          subject['course_code'] as String: null,
      };

      // 4. Update with saved grades
      for (var result in savedResults) {
        final courseCode = result['course_code'] as String;
        if (initialResults.containsKey(courseCode)) {
          initialResults[courseCode] = result['gpa'] as String?;
        }
      }

      setState(() {
        subjects = loadedSubjects;
        selectedResults = initialResults;
      });
    } catch (e) {
      print('Error loading subjects: $e');
      // Optionally show error to user
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Failed to load subjects')));
    }
  }

  Future<void> _saveResults() async {
    final db = await _dbHelper.database;

    await db.transaction((txn) async {
      for (var subject in subjects) {
        final courseCode = subject['course_code'] as String;
        final gpa = selectedResults[courseCode];

        if (gpa != null) {
          // Try update first
          int updated = await txn.update(
            'gpa_results',
            {'gpa': gpa},
            where: 'student_id = ? AND course_code = ? AND semester = ?',
            whereArgs: [widget.studentId, courseCode, widget.semester],
          );

          // Insert if no existing record
          if (updated == 0) {
            await txn.insert('gpa_results', {
              'student_id': widget.studentId,
              'course_code': courseCode,
              'semester': widget.semester,
              'gpa': gpa,
            });
          }
        }
      }
    });

    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => Homepage()),
      (route) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Background(
      child: Column(
        children: [
          if (subjects.isEmpty)
            const Center(
              child: Text(
                "No subjects found",
                style: TextStyle(color: Colors.white),
              ),
            )
          else
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.all(16),
                itemCount: subjects.length,
                itemBuilder: (context, index) {
                  final subject = subjects[index];
                  return Card(
                    color: const Color.fromARGB(255, 45, 100, 107),
                    margin: EdgeInsets.only(
                      bottom: 16,
                      left: 5,
                      right: 5,
                      top: index == 0 ? 16 : 0,
                    ),
                    child: ListTile(
                      title: Text(subject['course_code']),
                      subtitle: Text(subject['course_title']),
                      trailing: DropdownButton2(
                        underline: SizedBox.shrink(),
                        value: selectedResults[subject['course_code']],
                        onChanged:
                            (String? newValue) => setState(() {
                              selectedResults[subject['course_code']] =
                                  newValue;
                            }),
                        items:
                            gradeOptions
                                .map(
                                  (grade) => DropdownMenuItem(
                                    value: grade,
                                    child: Text(
                                      grade,
                                      style: const TextStyle(
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                )
                                .toList(),
                        // ... (keep your existing dropdown styling)
                        buttonStyleData: ButtonStyleData(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: const Color.fromARGB(255, 45, 100, 107),
                          ),
                          padding: const EdgeInsets.symmetric(horizontal: 18),
                          height: height * 0.07,
                          width: width * 0.25,
                          elevation: 1,
                        ),
                        iconStyleData: const IconStyleData(
                          icon: Icon(Icons.arrow_forward_ios_outlined),
                          iconSize: 14,
                          iconDisabledColor: Colors.white,
                          iconEnabledColor: Colors.white,
                        ),
                        dropdownStyleData: DropdownStyleData(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(14),
                            color: const Color.fromARGB(255, 48, 131, 151),
                          ),
                          offset: const Offset(0, 0),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          // Save & Cancel buttons (same as before)
          Padding(
            padding: EdgeInsets.only(bottom: height * 0.15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
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
                ElevatedButton(
                  onPressed: _saveResults, // Save results to the database
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
                    'Save',
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
