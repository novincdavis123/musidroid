import 'package:sqflite/sqflite.dart' as sql;

class SQLHelper {
  //create table
  static Future<void> createTable(sql.Database db) async {
    await db.execute("""CREATE TABLE login(
       id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
       email TEXT,
       password TEXT
      )""");
  }

  //create database
  static Future<sql.Database> OpenDb() async {
    return sql.openDatabase('datauser', version: 1,
        onCreate: (sql.Database db, int version) async {
      await createTable(db);
    });
  }

  //create newuser
  static Future<int> addNewUser(String email, String password) async {
    final db = await SQLHelper.OpenDb();
    final data = {'email': email, 'password': password};
    final id = db.insert('login', data);
    return id;
  }

  static Future<List<Map>> checklogin(String coemail, String copass) async {
    final db = await SQLHelper.OpenDb();
    final data = await db.rawQuery(
        "SELECT * FROM login WHERE email= '$coemail' AND password = '$copass' ");
    // print(data.toString());
    if (data.isNotEmpty) {
      return data;
    }

    return data;
  }

  static Future<List<Map>> getAll() async {
    final db = await SQLHelper.OpenDb();
    final data = db.rawQuery("SELECT * FROM login");
    return data;
  }
}
