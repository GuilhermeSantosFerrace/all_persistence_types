import 'package:all_persistence_types/sqlite/models/Person.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class PersonDAO {

  Future<Database> getDatabase() async{
    Database db = await openDatabase(
      join(await getDatabasesPath(), 'person_database.db'),
      onCreate: (db, version) {
        return db.execute(
          "CREATE TABLE person(id INTEGER PRIMARY KEY, firtName TEXT, lastName TEXT, address TEXT);");
      },
      version: 1,
    );

    return db;
  }

  Future<List<Person>> readAll() async {
    Database db = await getDatabase();
    final List<Map<String, dynamic>> maps = await db.query('person');

    List<Person> result = List.generate(maps.length, (i) {
      return Person(
        maps[i]['id'],
        maps[i]['firstName'],
        maps[i]['lastName'],
        maps[i]['address']
      );
    });

    return result;
  }

  Future<int> insertPerson(Person person) async {
    Database db = await getDatabase();
    return db.insert('person', person.toMap(), conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future deletePersonById(int id) async {
    Database db = await getDatabase();
    return db.delete('person', where: ' id = ? ', whereArgs: [id]);
  }

}