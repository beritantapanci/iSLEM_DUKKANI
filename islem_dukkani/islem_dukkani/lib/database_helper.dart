import 'dart:async';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = new DatabaseHelper.internal();

  factory DatabaseHelper() => _instance;

  static Database? _db;

  Future<Database?> get db async {
    if (_db != null) return _db;
    _db = await initDb();
    return _db;
  }

  DatabaseHelper.internal();

  Future<Database> initDb() async {
    String databasesPath = await getDatabasesPath();
    String path = join(databasesPath, 'question.db');
    var theDb = await openDatabase(path, version: 1, onCreate: _onCreate);
    return theDb;
  }

  void _onCreate(Database db, int version) async {
    // Create the table
    await db.execute('''
      CREATE TABLE questions (
        id INTEGER PRIMARY KEY,
        question TEXT,
        aSikki TEXT,
        bSikki TEXT,
        cSikki TEXT,
        dSikki TEXT,
        answer TEXT
      )
    ''');
  }

  // Insert a question into the database
  Future<int> insertQuestion(Map<String, dynamic> question) async {
    Database? dbClient = await db;
    int res = await dbClient!.insert("questions", question);
    return res;
  }

  // Get all questions from the database
  Future<List<Map<String, dynamic>>> getQuestions() async {
    Database? dbClient = await db;
    List<Map<String, dynamic>> result = await dbClient!.query("questions");
    return result;
  }

  // Delete all questions from the database
  Future<int> deleteAllQuestions() async {
    Database? dbClient = await db;
    int res = await dbClient!.rawDelete("DELETE FROM questions");
    return res;
  }
}
