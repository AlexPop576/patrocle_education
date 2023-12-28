import 'package:path/path.dart';
import 'package:patrocle_education/Database/note.dart';
import 'package:sqflite/sqflite.dart';
//import 'package:sqflite_database_example/model/note.dart';

class NotesDatabase {
  static final NotesDatabase instance = NotesDatabase._init();

  static Database? _database;

  NotesDatabase._init();

  Future<Database> get database async {
    if(_database != null) return _database!;

    _database = await _initDB('notes.db');
    return _database!;
  }
  
  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future _createDB(Database db, int version) async {
    final idType = 'INTEGER PRIMARY KEY AUTOINCREMENT';
    final textType = 'TEXT NOT NULL';
    final integerType = 'INTEGER NOT NULL';

    await db.execute('''
CREATE TABLE $tableNotes (
  ${NoteFields.id} $idType,
  ${NoteFields.country} $textType,
  ${NoteFields.subject} $textType,
  ${NoteFields.lesson} $textType,
  ${NoteFields.questions} $textType,
  ${NoteFields.answers} $textType,
  ${NoteFields.correctAnswers} $integerType,
  )
''');
  }

  Future<Note> create(Note note) async {
    final db = await instance.database;
    final id = await db.insert(tableNotes, note.toJson());
    return note.copy(id: id);
  }

  Future close() async {
    final db = await instance.database;

    db.close();
  }
}