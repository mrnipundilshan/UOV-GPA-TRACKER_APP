import 'package:flutter/material.dart';
import 'package:newgpaapp/background/bg.dart';
import 'package:newgpaapp/databasehelper.dart';

class itsemone extends StatefulWidget {
  final int studentId;
  const itsemone({super.key, required this.studentId});

  @override
  State<itsemone> createState() => _itsemoneState();
}

class _itsemoneState extends State<itsemone> {
  final DatabaseHelper _dbHelper = DatabaseHelper();
  List<Map<String, dynamic>> subjects = [];

  @override
  void initState() {
    super.initState();
    _loadSubjects();
  }

  Future<void> _loadSubjects() async {
    final db = await _dbHelper.database;
    // Get first year first semester subjects (IT113, IT1122, IT1134, IT1144, IT1152, ACU1113)
    final List<Map<String, dynamic>> loadedSubjects = await db.query(
      'subjects',
      where: 'course_code IN (?, ?, ?, ?, ?, ?)',
      whereArgs: ['IT113', 'IT1122', 'IT1134', 'IT1144', 'IT1152', 'ACU1113'],
    );
    setState(() {
      subjects = loadedSubjects;
    });
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Background(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 45, 100, 107),
          title: const Text(
            'First Year - Semester 1',
            style: TextStyle(color: Colors.white),
          ),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () => Navigator.pop(context),
          ),
        ),
        body:
            subjects.isEmpty
                ? const Center(
                  child: Text(
                    'No subjects found',
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                )
                : ListView.builder(
                  padding: const EdgeInsets.all(16),
                  itemCount: subjects.length,
                  itemBuilder: (context, index) {
                    final subject = subjects[index];
                    return Card(
                      color: const Color.fromARGB(255, 45, 100, 107),
                      margin: const EdgeInsets.only(bottom: 16),
                      child: ListTile(
                        contentPadding: const EdgeInsets.all(16),
                        title: Text(
                          subject['course_code'],
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 8),
                            Text(
                              subject['course_title'],
                              style: const TextStyle(color: Colors.white70),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              'Credits: ${subject['credits']}',
                              style: const TextStyle(color: Colors.white70),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
      ),
    );
  }
}
