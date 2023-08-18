import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class MyDbHelper {
  var TODO_TABLE = "todo";
  var COLUMN_TODO_ID = "todo_id";
  var COLUMN_TODO_TITLE = "title";

  Future<Database> openDB() async {
    var mDirectory = await getApplicationDocumentsDirectory();

    await mDirectory.create(recursive: true);

    var dbPath = "$mDirectory/tododb.db";

    return await openDatabase(dbPath, version: 1, onCreate: (db, version) {
      var createTableQuery =
          "create table $TODO_TABLE ($COLUMN_TODO_ID integer primary key autoincrement ,$COLUMN_TODO_TITLE text)";

      db.execute(createTableQuery);
    });
  }

  Future<bool> addTodos(
    String title,
  ) async {
    var db = await openDB();

    var check = await db.insert(TODO_TABLE, {
      COLUMN_TODO_TITLE: title,
    });
    return check > 0;
  }

  Future<List<Map<String, dynamic>>> fetchAllTodos() async {
    var db = await openDB();
    List<Map<String, dynamic>> todos = await db.query(TODO_TABLE);
    return todos;
  }

  Future<bool> deleteTodos(int id) async {
    var db = await openDB();
    var check = await db
        .delete(TODO_TABLE, where: "$COLUMN_TODO_ID = ? ", whereArgs: ["$id"]);
    return check > 0;
  }
}
