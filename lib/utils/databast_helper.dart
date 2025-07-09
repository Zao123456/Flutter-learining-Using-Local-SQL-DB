import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:wintest/models/data.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper._internal();
  factory DatabaseHelper() => _instance;
  static Database? _database;

  DatabaseHelper._internal();

  Future<Database> get database async {
    if (_database != null)
    { 
      return _database!;}
    
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    try {
      String path = join(await getDatabasesPath(), 'data.db');
      return await openDatabase(
        path,
        version: 1,
        onCreate: (db, version) {
          return db.execute(
            'CREATE TABLE data(id INTEGER PRIMARY KEY AUTOINCREMENT, country TEXT, item TEXT, cost REAL, shipping_price REAL, buying_price REAL, selling_price REAL, earnings REAL)',
          );
          
        },
      );
    } catch (e) {
      print('Error initializing database: $e');
      rethrow;
    }
  }

  Future<void> insertData(Data data) async {
    try {
      final db = await database;
      await db.insert(
        'data',
        data.toMap(),
      );
    } catch (e) {
      print('Error inserting data: $e');
    }
  }

  Future<List<Data>> getDataList() async {
    try {
      final db = await database;
      final List<Map<String, dynamic>> maps = await db.query('data');
      return List.generate(maps.length, (i) {
        return Data.fromMap(maps[i]);
      });
    } catch (e) {
      print('Error fetching data: $e');
      return [];
    }
  }
}