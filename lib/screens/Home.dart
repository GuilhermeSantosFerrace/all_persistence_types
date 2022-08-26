import 'package:all_persistence_types/utils/customWidgets.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);
  
  final Text title = const Text("Flutter Persistência");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: title),
      body: ListView(
        children: [
          ListTile(
            leading: buildSvgIcon("images/sqlite-icon.svg"),
            title: const Text("SQLite"),
            subtitle: const Text("List de Pessoas"),
            trailing: const Icon(Icons.navigate_next),
            onTap: (){
              Navigator.pushNamed(context, "/person");
            },
          ),
          divisorListMain(),
        ]
      ),
    );
  }
}