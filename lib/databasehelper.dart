import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper._internal();
  static Database? _database;

  factory DatabaseHelper() {
    return _instance;
  }

  DatabaseHelper._internal();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    String path = join(await getDatabasesPath(), 'student.db');
    return await openDatabase(path, version: 1, onCreate: _onCreate);
  }

  Future<void> _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE students(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        name TEXT NOT NULL,
        faculty TEXT NOT NULL,
        course TEXT NOT NULL,
        gpa REAL NOT NULL
        )
        ''');

    // Create subjects table
    await db.execute('''
      CREATE TABLE subjects(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        course_code TEXT NOT NULL,
        course_title TEXT NOT NULL,
        credits INTEGER NOT NULL
      )
    ''');

    // Create student_subjects junction table (for tracking which students take which subjects)
    await db.execute('''
      CREATE TABLE student_subjects(
        student_id INTEGER NOT NULL,
        subject_id INTEGER NOT NULL,
        grade TEXT,
        PRIMARY KEY (student_id, subject_id),
        FOREIGN KEY (student_id) REFERENCES students(id),
        FOREIGN KEY (subject_id) REFERENCES subjects(id)
      )
    ''');

    //create gpa_results table
    await db.execute('''
      CREATE TABLE gpa_results (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        student_id INTEGER NOT NULL,
        course_code TEXT NOT NULL,
        semester INTEGER NOT NULL,
        gpa TEXT,
        UNIQUE(student_id, course_code, semester) ON CONFLICT REPLACE
      )
    ''');
    // Add an index for faster semester-wise queries
    await db.execute('''
    CREATE INDEX idx_student_semester ON gpa_results(student_id, semester);
  ''');

    // Insert all the IT subjects
    await _insertAllSubjects(db);
  }

  Future<int> insertStudent(Map<String, dynamic> student) async {
    Database db = await database;
    return await db.insert('students', student);
  }

  Future<List<Map<String, dynamic>>> getStudents() async {
    Database db = await database;
    return await db.query('students');
  }

  Future<void> _insertAllSubjects(Database db) async {
    // Insert all subjects without level/semester information
    await _insertSubject(db, 'IT113', 'Fundamentals of IT', 3);
    await _insertSubject(db, 'IT1122', 'Mathematics', 2);
    await _insertSubject(db, 'IT1134', 'Programming', 4);
    await _insertSubject(db, 'IT1144', 'Web Programming', 4);
    await _insertSubject(db, 'IT1152', 'Statistics', 2);

    await _insertSubject(db, 'IT1214', 'OOP', 4);
    await _insertSubject(db, 'IT1223', 'DMS', 3);
    await _insertSubject(db, 'IT1232', 'Project Management', 2);
    await _insertSubject(db, 'IT1242', 'Computer Networks', 2);
    await _insertSubject(db, 'IT1252', 'Electronics', 2);
    await _insertSubject(db, 'IT11262', 'Mathematics for Computing', 2);

    await _insertSubject(db, 'IT2114', 'Data Structures', 2);
    await _insertSubject(db, 'IT2122', 'Software Engineering', 2);
    await _insertSubject(db, 'IT2133', 'Advanced Web Programming', 3);
    await _insertSubject(db, 'IT2143', 'Visual Programming', 3);
    await _insertSubject(db, 'IT2153', 'Computer Graphics', 3);

    await _insertSubject(db, 'IT2212', 'MIS', 2);
    await _insertSubject(db, 'IT2223', 'DAA', 3);
    await _insertSubject(db, 'IT2234', 'Web Services', 4);
    await _insertSubject(db, 'IT2244', 'Operating Systems', 4);
    await _insertSubject(db, 'IT2252', 'Social and Professional Issues', 2);

    await _insertSubject(db, 'IT3113', 'KBS', 3);
    await _insertSubject(db, 'IT3122', 'Computer Security', 2);
    await _insertSubject(db, 'IT3133', 'MCC', 3);
    await _insertSubject(db, 'IT3143', 'Digital Image Processing', 3);
    await _insertSubject(db, 'IT3152', 'Software Quality Assurance', 2);

    await _insertSubject(db, 'IT3213', 'Human Computer Interaction', 3);
    await _insertSubject(db, 'IT3223', 'ADMS', 3);
    await _insertSubject(db, 'IT3232', 'E-Commerce', 2);
    await _insertSubject(db, 'IT3243', 'Parallel Computing', 3);
    await _insertSubject(db, 'IT3252', 'Multimedia Computing', 2);
    await _insertSubject(db, 'IT3262', 'Operations Research', 2);

    // Semester I
    await _insertSubject(db, 'AMA1113', 'Differential Equations', 3);
    await _insertSubject(db, 'PMA1113', 'Foundation of Mathematics', 3);
    await _insertSubject(db, 'STA1113', 'Introduction to Statistics', 3);
    await _insertSubject(db, 'CSC1113', 'Foundation of Computer Science', 3);
    await _insertSubject(db, 'CSC1123', 'Introduction to Programming', 3);

    // Semester II
    await _insertSubject(db, 'AMA1213', 'Methods of Applied Mathematics', 3);
    await _insertSubject(db, 'PMA1213', 'Analysis and Number Theory', 3);
    await _insertSubject(db, 'STA1213', 'Statistical Inference', 3);
    await _insertSubject(db, 'CSC1213', 'Object Oriented Programming', 3);
    await _insertSubject(db, 'CSC1223', 'Database Systems', 3);

    // Semester I
    await _insertSubject(db, 'AMA2113', 'Optimization I', 3);
    await _insertSubject(db, 'AMA2122', 'Vector Calculus', 2);
    await _insertSubject(db, 'PMA2113', 'Linear Algebra', 3);
    await _insertSubject(db, 'STA2113', 'Design of Experiments', 3);
    await _insertSubject(db, 'CSC2113', 'Data Structures and Algorithms', 3);
    await _insertSubject(db, 'CSC2122', 'Computer Security', 2);

    // Semester II
    await _insertSubject(db, 'AMA2213', 'Mechanics', 3);
    await _insertSubject(db, 'STA2213', 'Sampling Theory', 3);
    await _insertSubject(db, 'CSC2212', 'Data Communication and CN', 2);
    await _insertSubject(db, 'CSC2222', 'Software Engineering', 2);
    await _insertSubject(db, 'CSC2234', 'Numerical Computing', 4);

    // Semester I
    await _insertSubject(db, 'AMA3113', 'Mathematical Modelling', 3);
    await _insertSubject(db, 'AMA3122', 'Optimization II', 2);
    await _insertSubject(db, 'STA3113', 'Regression Analysis & TA', 3);
    await _insertSubject(db, 'CSC3112', 'Computer Graphics', 2);
    await _insertSubject(db, 'CSC3123', 'Operating Systems', 3);
    await _insertSubject(db, 'CSC3132', 'Web Application Development', 2);

    // Semester II
    await _insertSubject(db, 'AMA3213', 'Analytical Dynamics', 3);
    await _insertSubject(db, 'PMA3213', 'Complex Variables', 3);
    await _insertSubject(db, 'STA3212', 'Statistical Quality Control', 2);
    await _insertSubject(db, 'CSC3213', 'Computer Architecture', 3);
    await _insertSubject(db, 'CSC3222', 'Graph Theory', 2);

    //maths
    // Semester I
    await _insertSubject(db, 'AMA3122', 'Optimization – II', 2);
    await _insertSubject(db, 'CSC3112', 'Computer Graphics', 2);
    await _insertSubject(db, 'CSC3123', 'Operating Systems', 3);
    await _insertSubject(db, 'CSC3132', 'Web Application Development', 2);
    await _insertSubject(db, 'CSH3143', 'Knowledge Representation', 3);
    await _insertSubject(db, 'CSH3153', 'Human Computer Interaction', 3);
    await _insertSubject(db, 'CSH3163', 'Advanced Database System', 3);

    // Semester II
    await _insertSubject(db, 'CSC3213', 'Computer Architecture', 3);
    await _insertSubject(db, 'CSC3222', 'Graph Theory', 2);
    await _insertSubject(db, 'CSH3242', 'Theory of Computation', 2);
    await _insertSubject(db, 'CSH3254', 'Parallel Computing', 4);
    await _insertSubject(db, 'CSH3273', 'Advanced Computer Networks', 3);
    await _insertSubject(db, 'CSH3273', 'Artificial Intelligence', 3);

    // Semester I
    await _insertSubject(db, 'CSH4112', 'System Analysis and Design', 2);
    await _insertSubject(db, 'CSH4123', 'Bioinformatics', 3);
    await _insertSubject(db, 'CSH4133', 'Digital Image Processing', 3);
    await _insertSubject(db, 'CSH4144', 'Machine Learning', 4);
    await _insertSubject(db, 'CSH4152', 'Cryptography', 2);
    await _insertSubject(db, 'CSH4162', 'Compiler Design', 2);
    await _insertSubject(db, 'CSH4173', 'Numerical Linear Algebra', 3);

    // Semester II
    await _insertSubject(db, 'CSH4216', 'Research Project', 6);
    await _insertSubject(db, 'CSH4226', 'Industrial Training', 6);
  }

  Future<void> _insertSubject(
    Database db,
    String courseCode,
    String courseTitle,
    int credits,
  ) async {
    await db.insert('subjects', {
      'course_code': courseCode,
      'course_title': courseTitle,
      'credits': credits,
    });
  }

  Future<double> calculateGPA(int studentId) async {
    final db = await database;

    // Query GPA results and subject credits
    final List<Map<String, dynamic>> results = await db.rawQuery(
      '''
      SELECT g.gpa, s.credits
      FROM gpa_results g
      INNER JOIN subjects s ON g.course_code = s.course_code
      WHERE g.student_id = ?
    ''',
      [studentId],
    );

    if (results.isEmpty) return 0.0;

    double totalPoints = 0.0;
    int totalCredits = 0;

    for (var result in results) {
      final grade = result['gpa'] as String;
      final credits = result['credits'] as int;

      // Convert grade to GPA points
      double gradePoints = _gradeToPoints(grade);
      totalPoints += gradePoints * credits;
      totalCredits += credits;
    }

    return totalCredits > 0 ? totalPoints / totalCredits : 0.0;
  }

  double _gradeToPoints(String grade) {
    switch (grade) {
      case 'A+/A':
        return 4.0;
      case 'A-':
        return 3.7;
      case 'B+':
        return 3.3;
      case 'B':
        return 3.0;
      case 'B-':
        return 2.7;
      case 'C+':
        return 2.3;
      case 'C':
        return 2.0;
      case 'C-':
        return 1.7;
      case 'D+':
        return 1.3;
      case 'D':
        return 1.0;
      case 'E':
        return 0.0;
      default:
        return 0.0;
    }
  }

  Future<void> updateStudentGPA(int studentId) async {
    final db = await database;
    final gpa = await calculateGPA(studentId);

    await db.update(
      'students',
      {'gpa': gpa},
      where: 'id = ?',
      whereArgs: [studentId],
    );
  }
}
