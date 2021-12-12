import 'package:irle_ref2/repositories/database_connection.dart';
import 'package:sqflite/sqflite.dart';

class Repository {
  DatabaseConnection _databaseConnection;

  Repository() {
    _databaseConnection = DatabaseConnection();
  }

  static Database _database;

  Future<Database> get database async {
    if (_database != null) return _database;
    _database = await _databaseConnection.createDatabase();
    return _database;
  }

  insertUserData(table, data) async {
    var connection = await database;
    return await connection.insert(table, data);
  }

  readDataByUsername(table, userUsername) async {
    var connection = await database;
    return await connection
        .query(table, where: 'username=?', whereArgs: [userUsername]);
  }

  readDataByPassword(table, userPassword) async {
    var connection = await database;
    return await connection
        .query(table, where: 'password=?', whereArgs: [userPassword]);
  }
}
