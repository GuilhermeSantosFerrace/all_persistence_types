import 'package:all_persistence_types/sqlite/addPerson.dart';
import 'package:all_persistence_types/sqlite/daos/PersonDao.dart';
import 'package:all_persistence_types/sqlite/models/Person.dart';
import 'package:flutter/material.dart';

class ListPerson extends StatefulWidget {
  const ListPerson({Key? key}) : super(key: key);
  
  final Text title = const Text("Pessoas");

  @override
  _ListPersonState createState() => _ListPersonState();
}

class _ListPersonState extends State<ListPerson>{

  List<Person> persons = <Person>[];

  @override
  void initState(){
    super.initState();
    getAllPersons();
  }

  getAllPersons() async{
    List<Person> result = await PersonDAO().readAll();
    setState(() {
      persons = result;
    });
  }

  insertPerson(Person person) async {
    int id = await PersonDAO().insertPerson(person);
    person.id = id;
    if(id > 0) {
      setState((){
        persons.add(person);
      });
    }
  }

  deletePerson(int index) async {
    Person person = persons[index];
    if(person.id != null) {
      await PersonDAO().deletePersonById(person.id!);
      setState(() {
        persons.add(person);
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
              MaterialPageRoute(builder:(context) => AddPerson()))
              .then((person) => {
                insertPerson(person)
              });
          },
          icon: const Icon(Icons.add),
          )
        ],
        ),
      body: ListView.separated(
          itemCount: persons.length,
          itemBuilder: (context, index) => buildListItens(index),
          separatorBuilder: (context, index) => const Divider( height: 1),
      ),
    );
  }

  Widget buildListItens(int index){
    Person p = persons[index];
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(5.0)
        ),
        child: ListTile(
          leading: Text(p.id != null ? p.id.toString() : "-1"),
          title: Text(p.firstName),
          subtitle: Text(p.lastName),
          onLongPress: (){
            deletePerson(index);
          },
        ),
      ),
      );
  }
}