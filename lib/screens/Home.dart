import 'package:all_persistence_types/utils/customWidgets.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);
  
  final Text title = const Text("Flutter PersistĂȘncia");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: title),
      body: ListView(
        children: [
          ListTile(
            leading: buildSvgIcon("images/sqlite-icon.svg"),
            title: const Text("SQLite"),
            subtitle: const Text("Lista de Pessoas"),
            trailing: const Icon(Icons.navigate_next),
            onTap: (){
              Navigator.pushNamed(context, "/person");
            },
          ),
          divisorListMain(),
          ListTile(
            leading: buildSvgIcon("images/db.svg"),
            title: const Text("Floor"),
            subtitle: const Text("Lista de Livros"),
            trailing: const Icon(Icons.navigate_next),
            onTap: (){
              Navigator.pushNamed(context, "/book");
            },
          ),
          divisorListMain(),
          ListTile(
            leading: buildSvgIcon("images/firebase-icon.svg"),
            title: const Text("Firebase Cloud Firestore"),
            subtitle: const Text("Lista de Carros"),
            trailing: const Icon(Icons.navigate_next),
            onTap: (){
              Navigator.pushNamed(context, "/car");
            },
          ),
          divisorListMain(),
        ]
      ),
    );
  }
}