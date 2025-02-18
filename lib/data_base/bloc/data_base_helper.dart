import 'dart:async';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'model.dart';

class DatabaseHelper {
  static final DatabaseHelper instance = DatabaseHelper._instance();
  static Database? _database;

  DatabaseHelper._instance();

  Future<Database> get db async {
    _database ??= await initDb();
    return _database!;
  }

  Future<Database> initDb() async {
    String databasesPath = await getDatabasesPath();
    String path = join(databasesPath, 'geeksrgeeks.db');
    return await openDatabase(path, version: 10, onCreate: _onCreate);
  }

  Future _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE loacl_storage (
        id INTEGER PRIMARY KEY,
        username TEXT,
        email TEXT,
        timestamp TEXT
      )
    ''');
  }

  //insertIng The Nwe User
  Future<int> insertUser(User user) async {
    Database db = await instance.db;
    return await db.insert('loacl_storage', user.toMap());
  }


  //updating The  User
  Future<int> updateUserById(User user) async {
    Database db = await instance.db;
    return await db.update('loacl_storage', user.toMap(), where: 'id = ?', whereArgs: [user.id]);
  }
  //deleting the user
  Future<int> deleteUserBuID(int id) async {
    Database db = await instance.db;
    return await db.delete('loacl_storage', where: 'id = ?', whereArgs: [id]);
  }
  //search
  Future<List<User>> getSearchByEmail(String email)async{
    Database db=await instance.db;
    List<Map<String, dynamic>> users =await db.query('loacl_storage',where: 'email = ?',whereArgs: [email]);
    print("ACTIVE USER LENGTH IS >>>>>>$users}");
    List<User> activeUser= users.map((e) {
      return User.fromMap(e);
    },).toList();
    print("ACTIVE USER LENGTH IS >>>>>>${activeUser.length}");
    return activeUser;
  }
  Future<List<User>> getSearchByEmailAndUsername(String email, String username) async {
    Database db = await instance.db;
    List<Map<String, dynamic>> users  = await db.query(
      'loacl_storage',
      where: 'email = ? AND username = ?',
      whereArgs: [email, username],
    );
    print("ACTIVE USER LENGTH IS >>>>>>$users}");

    List<User> activeUser= users.map((e) {
      return User.fromMap(e);
    },).toList();
    print("ACTIVE USER LENGTH IS >>>>>>${activeUser.length}");
    return activeUser; // Return the matching records
  }



  //Getting all The userd
  Future<List<User>> getAllUser()async{
    final db = await instance.db;
    List<Map<String, dynamic>> users = await db.query('loacl_storage');
    List<User> activeUser= users.map((e) {
      return User.fromMap(e);
    },).toList();
    return activeUser;
  }
}
