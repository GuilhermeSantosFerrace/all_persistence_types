import 'package:floor/floor.dart';
import 'package:flutter/material.dart';

@entity
class Book {
  @primaryKey
  int? id;

  String name;
  String author;

  Book({this.id, required this.name, required this.author});
}