import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

import '../models/lists_model.dart';

class ListDatabaseHelper {
  static Database? _listDatabase;
  static const _databaseVersion = 1;

  Future<Database> get database async => _listDatabase ??= await initDatabase();

  Future<Database> initDatabase() async {
    return await openDatabase(
        join(await getDatabasesPath(),
            (await getApplicationDocumentsDirectory()).path + "lists.db"),
        version: _databaseVersion,
        onCreate: createTables);
  }

  void createTables(Database db, int version) {
    createListTable(db, version);
    createItemTable(db, version);
  }

  void createListTable(Database db, int version) {
    db.execute('''
      CREATE TABLE lists (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        name TEXT NOT NULL,
        type TEXT NOT NULL,
        totalItems INTEGER NOT NULL,
        totalAmount INTEGER NOT NULL )
      ''');
  }

  void createItemTable(Database db, int version) {
    db.execute('''
      CREATE TABLE items (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        name TEXT NOT NULL,
        quantity INTEGER NOT NULL,
        price INTEGER NOT NULL,
        description TEXT NOT NULL )
      ''');
  }

  Future<int> insertList(UList list) async {
    Database db = await database;
    return await db.insert(
      'lists',
      {
        // 'id': list.id,
        'name': list.name,
        'type': list.type,
        'totalItems': list.totalItems,
        'totalAmount': list.totalAmount
      },
    );
  }

  Future<int> updateList(UList list) async {
    Database db = await database;
    int id = list.toMap()['id'];
    return await db
        .update('lists', list.toMap(), where: 'id = ?', whereArgs: [id]);
  }

  Future<int> deleteList(int id) async {
    Database db = await database;
    return await db.delete('lists', where: 'id = ?', whereArgs: [id]);
  }

  Future<List<Map<String, dynamic>>> queryAllLists() async {
    Database db = await database;
    return await db.query('lists');
  }

  Future<List<Map<String, dynamic>>> queryLists(name) async {
    Database db = await database;
    return await db.query('lists', where: "name LIKE '%$name%'");
  }

  Future<int> queryListCount() async {
    Database db = await database;
    return (await db.query('lists')).length;
  }

  Future<int> insertItem(Item item) async {
    Database db = await database;
    return await db.insert(
      'items',
      {
        'name': item.name,
        'quantity': item.quantity,
        'price': item.price,
        'description': item.description
      },
    );
  }

  Future<int> updateItem(Item item) async {
    Database db = await database;
    int id = item.toMap()['id'];
    return await db
        .update('items', item.toMap(), where: 'id = ?', whereArgs: [id]);
  }

  Future<int> deleteItem(int id) async {
    Database db = await database;
    return await db.delete('items', where: 'id = ?', whereArgs: [id]);
  }

  Future<List<Map<String, dynamic>>> queryAllItems() async {
    Database db = await database;
    return await db.query('items');
  }

  Future<List<Map<String, dynamic>>> queryItems(name) async {
    Database db = await database;
    return await db.query('items', where: "name LIKE '%$name%'");
  }

  Future<int> queryItemCount() async {
    Database db = await database;
    return (await db.query('items')).length;
  }
}
