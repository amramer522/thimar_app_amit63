
import 'package:app/core/logic/helper_methods.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../../views/products/model.dart';

class SqlHelper {
  static late Database db;
  static late String path;

  static Future<void> open() async {
    final dbPath = await getDatabasesPath();
    path = join(dbPath, 'amoora.db');

    db = await openDatabase(
      path,
      version: 1,
      onCreate: (db2, version) async {
        await db2.execute(
            'CREATE TABLE Products (id INTEGER PRIMARY KEY, name TEXT, desc TEXT, price DOUBLE)');
      },
    );
  }

  static Future<void> deleteDB() async {
    await deleteDatabase(path);
    print("Database Deleted Success");
  }

  static Future<void> insertProduct(ProductModel model) async {
    await db.insert("Products", model.toJson());
    showMessage("Saved Success", messageType: MessageType.success);
  }
  static Future<void> updateProduct(int id, ProductModel model) async {
    await db.update("Products", model.toJson(),
        where: "id = ?", whereArgs: ["$id"]);
    showMessage("Updated Success",messageType: MessageType.success);
  }
  static Future<void> deleteProduct(int id) async {
    await db.rawDelete('DELETE FROM Products WHERE id = ?', [id]);
    showMessage("Deleted Success", messageType: MessageType.success);
  }
  static Future<List<ProductModel>> getProducts() async {
    List<Map> list = await db.rawQuery('SELECT * FROM Products');

    final result = List.from(list)
        .map(
          (e) => ProductModel.formJson(e),
        )
        .toList();
    return result;
  }




  static Future<void> close() async {
    db.close();
  }


}
