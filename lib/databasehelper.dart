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
      CREATE TABLE gpa_results(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        student_id INTEGER NOT NULL,
        course_code TEXT NOT NULL,
        gpa TEXT NOT NULL,
        FOREIGN KEY (student_id) REFERENCES students(id)
      )
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
    await _insertSubject(db, 'ACU1113', 'English Language I', 3);

    await _insertSubject(db, 'IT1214', 'OOP', 4);
    await _insertSubject(db, 'IT1223', 'DMS', 3);
    await _insertSubject(db, 'IT1232', 'Project Management', 2);
    await _insertSubject(db, 'IT1242', 'Computer Networks', 2);
    await _insertSubject(db, 'IT1252', 'Electronics', 2);
    await _insertSubject(db, 'IT11262', 'Mathematics for Computing', 2);
    await _insertSubject(db, 'ACU1212', 'Social Harmony', 2);

    await _insertSubject(db, 'IT2114', 'Data Structures', 2);
    await _insertSubject(db, 'IT2122', 'Software Engineering', 2);
    await _insertSubject(db, 'IT2133', 'Advanced Web Programming', 3);
    await _insertSubject(db, 'IT2143', 'Visual Programming', 3);
    await _insertSubject(db, 'IT2153', 'Computer Graphics', 3);
    await _insertSubject(db, 'ACU2113', 'English Language II', 3);

    await _insertSubject(db, 'IT2212', 'Management Information Systems', 2);
    await _insertSubject(db, 'IT2223', 'Design and Analysis of Algorithms', 3);
    await _insertSubject(
      db,
      'IT2234',
      'Web Services and Server Technologies',
      4,
    );
    await _insertSubject(db, 'IT2244', 'Operating Systems', 4);
    await _insertSubject(
      db,
      'IT2252',
      'Social and Professional Issues in IT',
      2,
    );
    await _insertSubject(db, 'ACU2212', 'Communication and Soft Skills', 2);

    await _insertSubject(
      db,
      'IT3113',
      'Knowledge Based Systems and Logic Programming',
      3,
    );
    await _insertSubject(db, 'IT3122', 'Computer Security', 2);
    await _insertSubject(db, 'IT3133', 'Mobile Communication and Computing', 3);
    await _insertSubject(db, 'IT3143', 'Digital Image Processing', 3);
    await _insertSubject(db, 'IT3152', 'Software Quality Assurance', 2);
    await _insertSubject(db, 'IT3162', 'Group Project', 2);
    await _insertSubject(db, 'ACU3112', 'Career Guidance', 2);

    await _insertSubject(db, 'IT3213', 'Human Computer Interaction', 3);
    await _insertSubject(
      db,
      'IT3223',
      'Advanced Database Management Systems',
      3,
    );
    await _insertSubject(db, 'IT3232', 'E-Commerce', 2);
    await _insertSubject(db, 'IT3243', 'Parallel Computing', 3);
    await _insertSubject(db, 'IT3252', 'Multimedia Computing', 2);
    await _insertSubject(db, 'IT3262', 'Operations Research', 2);
    await _insertSubject(
      db,
      'ACU3212',
      'Management and Entrepreneurial Skills',
      2,
    );
    await _insertSubject(
      db,
      'ACU3222',
      'Research Methodology and Scientific Writing',
      2,
    );
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
}
