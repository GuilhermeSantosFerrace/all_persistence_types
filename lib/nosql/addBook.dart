import 'package:all_persistence_types/nosql/models/Book.dart';
import 'package:flutter/material.dart';


class AddBook extends StatelessWidget {

  final _formKey = GlobalKey<FormState>();

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _authorController = TextEditingController();

  AddBook({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Novo livro"),
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
                  controller: _nameController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Insira o nome do livro';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  decoration: const InputDecoration(
                      hintText: "Autor",
                      labelText: "Autor"
                  ),
                  controller: _authorController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Insira o autor do livro';
                    }
                    return null;
                  },
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        Book book = Book(
                            name: _nameController.text,
                            author: _authorController.text,
                        );
                        Navigator.pop(context, book);
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