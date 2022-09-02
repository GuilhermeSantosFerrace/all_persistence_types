import 'package:all_persistence_types/screens/home.dart';
import 'package:all_persistence_types/sqlite/listPerson.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'firebase/listCar.dart';
import 'nosql/listBook.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        
        primarySwatch: Colors.amber,
      ),
      initialRoute: "/",
      routes: {
        "/":(context) => const Home(),
        "/person": (context) => const ListPerson(),
        "/book": (context) => const ListBook(),
        "/car": (context) => const ListCar(),
      },
    );
  }
}