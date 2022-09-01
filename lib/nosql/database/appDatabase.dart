import 'dart:async';

import 'package:all_persistence_types/nosql/daos/BookDAO.dart';
import 'package:all_persistence_types/nosql/models/Book.dart';
import 'package:floor/floor.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

part 'appDatabase.g.dart';

@Database(version: 1, entities: [Book])
abstract class appDatabase extends FloorDatabase {
  BookDao get bookDao;

}