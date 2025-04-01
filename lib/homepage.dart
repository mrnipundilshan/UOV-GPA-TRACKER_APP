import 'dart:ui';
import 'package:newgpaapp/it/itgpapage.dart';
import 'background/bg.dart';
import 'facultyselectionpage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'databasehelper.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final DatabaseHelper _dbHelper = DatabaseHelper();
  List<Map<String, dynamic>> students = [];

  @override
  void initState() {
    super.initState();
    _loadStudents();
  }

  Future<void> _loadStudents() async {
    final loadedStudents = await _dbHelper.getStudents();
    setState(() {
      students = loadedStudents;
    });
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Background(
      child: Stack(
        children: [
          students.isEmpty
              ? Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      'assets/profile.svg',
                      width: width * 0.5,
                      colorFilter: ColorFilter.mode(
                        Colors.white,
                        BlendMode.srcIn,
                      ),
                    ),
                    SizedBox(height: height * 0.02),
                    Text(
                      'Add Student',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        decoration: TextDecoration.none,
                        color: Colors.white,
                        fontSize: width * 0.1,
                      ),
                    ),
                  ],
                ),
              )
              : ListView.builder(
                itemCount: students.length,
                itemBuilder: (context, index) {
                  final student = students[index];
                  return Card(
                    color: const Color.fromARGB(255, 45, 100, 107),
                    margin:
                        index == 0
                            ? const EdgeInsets.only(
                              bottom: 16,
                              left: 5,
                              right: 5,
                              top: 16,
                            )
                            : const EdgeInsets.only(
                              bottom: 16,
                              left: 5,
                              right: 5,
                            ),
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder:
                                (context) => itgpapage(
                                  studentId:
                                      student['id'], // Pass the student ID
                                  studentcourse:
                                      student['course'], //pass course
                                ),
                          ),
                        );
                      },
                      child: ListTile(
                        contentPadding: EdgeInsets.only(
                          left: width * 0.05,
                          right: width * 0.05,
                        ),
                        title: Text(
                          student['name'],
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: width * 0.05,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 8),
                            Text(
                              'Faculty: ${student['faculty']}',
                              style: const TextStyle(color: Colors.white70),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              'Course: ${student['course']}',
                              style: const TextStyle(color: Colors.white70),
                            ),
                          ],
                        ),
                        trailing: Text(
                          'GPA: ${student['gpa'].toStringAsFixed(2)}', // Format GPA to 2 decimal places
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: width * 0.05,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
          Positioned(
            bottom: 20,
            right: 20,
            child: IconButton(
              onPressed: () async {
                final result = await showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
                      child: Dialog(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20.0),
                          child: SizedBox(
                            width: width * 0.8,
                            height: height * 0.7,
                            child: FacSelectionPage(),
                          ),
                        ),
                      ),
                    );
                  },
                );
                // Reload students if a student was added successfully
                if (result == true) {
                  _loadStudents();
                }
              },
              icon: Icon(
                Icons.add_circle_outline,
                size: width * 0.2,
                color: Colors.white,
              ),
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
            ),
          ),
        ],
      ),
    );
  }
}
