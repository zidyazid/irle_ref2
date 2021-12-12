import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

class DatabaseConnection {
  createDatabase() async {
    var directory = await getApplicationDocumentsDirectory();
    var path = join(directory.path, 'db_irle');
    var database =
        await openDatabase(path, version: 1, onCreate: _onCreatingDatabase);

    return database;
  }

  _onCreatingDatabase(Database database, int version) async {
    await database.execute(
        "CREATE TABLE user(id INTEGER PRIMARY KEY, namalengkap TEXT, username TEXT UNIQUE, password TEXT)");
  }
}
