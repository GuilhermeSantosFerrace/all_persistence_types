import 'package:all_persistence_types/nosql/addBook.dart';
import 'package:all_persistence_types/nosql/database/appDatabase.dart';
import 'package:flutter/material.dart';

import 'daos/BookDAO.dart';
import 'models/Book.dart';

class ListBook extends StatefulWidget {
  const ListBook({Key? key}) : super(key: key);
  
  final Text title = const Text("Livro");

  @override
  _ListBookState createState() => _ListBookState();
}

class _ListBookState extends State<ListBook>{

  BookDao? dao;
  List<Book> books = <Book>[];

  @override
  void initState(){
    super.initState();
    getAllBooks();
  }

  getAllBooks() async{
    final database = await $FloorappDatabase
        .databaseBuilder("app_floor_database.db")
        .build();
    dao = database.bookDao;
    if(dao != null) {
      final result = await dao!.findAll();
      if(result.isNotEmpty){
        setState(() {
          books = result;
        });
      }
    }
  }

  insertBook(Book book) async {
    if(dao != null) {
      final id = await dao!.insertBook(book);
      book.id = id;
      setState(() {
        books.add(book);
      });
    }
  }

  deleteBook(int index) async {
    if(dao != null) {
      final book = books[index];
      await dao!.deleteBook(book);
      setState(() {
        books.removeAt(index);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: widget.title,
        actions: [
          IconButton(onPressed: (){
            Navigator.push(context,
              MaterialPageRoute(builder:(context) => AddBook()))
              .then((book) => {
                // insertBook(book)
              });
          },
          icon: const Icon(Icons.add),
          )
        ],
        ),
      body: ListView.separated(
          itemCount: books.length,
          itemBuilder: (context, index) => buildListItens(index),
          separatorBuilder: (context, index) => const Divider( height: 1),
      ),
    );
  }

  Widget buildListItens(int index){
    Book p = books[index];
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(5.0)
        ),
        child: ListTile(
          leading: Text(p.id != null ? p.id.toString() : "-1"),
          // title: Text(p.firstName),
          // subtitle: Text(p.lastName),
          onLongPress: (){
            // deleteBook(index);
          },
        ),
      ),
      );
  }
}