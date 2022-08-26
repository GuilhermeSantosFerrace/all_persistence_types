import 'package:all_persistence_types/sqlite/models/Person.dart';
import 'package:flutter/material.dart';


class AddPerson extends StatelessWidget {

  final _formKey = GlobalKey<FormState>();

  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();

  AddPerson({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Nova pessoa"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                TextFormField(
                  decoration: const InputDecoration(
                      hintText: "Nome",
                      labelText: "Nome"
                  ),
                  controller: _firstNameController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Insira o nome da pessoa';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  decoration: const InputDecoration(
                      hintText: "Sobrenome",
                      labelText: "Sobrenome"
                  ),
                  controller: _lastNameController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Insira o sobrenome da pessoa';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  decoration: const InputDecoration(
                      hintText: "Endereço",
                      labelText: "Endereço"
                  ),
                  controller: _addressController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Insira o endereço da pessoa';
                    }
                    return null;
                  },
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        Person person = Person(
                            null,
                            _firstNameController.text,
                            _lastNameController.text,
                            _addressController.text
                        );
                        Navigator.pop(context, person);
                      }
                    },
                    child: const Text('Salvar'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

}