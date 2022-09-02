import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'addCar.dart';
import 'models/Car.dart';

class ListCar extends StatefulWidget {
  const ListCar({Key? key}) : super(key: key);
  
  final Text title = const Text("Carros");

  @override
  _ListCarState createState() => _ListCarState();
}

class _ListCarState extends State<ListCar>{

  insertCar(Car car) async {
    FirebaseFirestore.instance.collection("cars").add(car.toJson());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: widget.title,
        actions: [
          IconButton(onPressed: (){
            Navigator.push(context,
              MaterialPageRoute(builder:(context) => AddCar()))
              .then((car) => {
                insertCar(car)
              });
          },
          icon: const Icon(Icons.add),
          )
        ],
        ),
      body: buildList(context),
    );
  }

  Widget buildList(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance.collection("cars").snapshots(),
      builder: (context, snapshot) {
        if(!snapshot.hasData) return const LinearProgressIndicator();
        if(snapshot.data == null) {
          return Container(child: const Text("Nenhum carro encontrado"));
        } else {
          return buildListView(context, snapshot.data!.docs);
        }
      },
    );
  }

  Widget buildListView(BuildContext context, List<QueryDocumentSnapshot> snapshot) {
    return ListView(
      padding: const EdgeInsets.only(top: 30),
      children: snapshot.map((data) => buildListItens(context, data)).toList()
    );
  }

  Widget buildListItens(BuildContext context, QueryDocumentSnapshot data){
    Car c = Car.fromSnapshot(data);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(5.0)
        ),
        child: ListTile(
          title: Text(c.name),
          subtitle: Text(c.brand),
          onLongPress: (){
            data.reference.delete();
          },
        ),
      ),
      );
  }
}