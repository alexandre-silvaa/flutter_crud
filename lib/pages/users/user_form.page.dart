import 'package:flutter/material.dart';
import 'package:flutter_crud/models/user.model.dart';
import 'package:flutter_crud/provider/users.provider.dart';
import 'package:provider/provider.dart';

class UserFormPage extends StatelessWidget {
  UserFormPage({super.key});

  final _form = GlobalKey<FormState>();
  final Map<String, String> _formData = {};

  void _loadFormData(User? user) {
    if (user != null) {
      _formData['id'] = user.id!;
      _formData['name'] = user.name;
      _formData['email'] = user.email;
      _formData['avatarUrl'] = user.avatarUrl;
    }
  }

  @override
  Widget build(BuildContext context) {
    final Object? user = ModalRoute.of(context)!.settings.arguments;
    if (user != null && user is User) _loadFormData(user);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyan,
        leading: const BackButton(
          color: Colors.white,
        ),
        actions: <Widget>[
          IconButton(
            onPressed: () {
              final isValid = _form.currentState?.validate();
              if (isValid == true) {
                _form.currentState?.save();

                Provider.of<UsersProvider>(context, listen: false).createOrPut(
                  User(
                    id: _formData['id'],
                    name: _formData['name']!,
                    email: _formData['email']!,
                    avatarUrl: _formData['avatarUrl']!,
                  ),
                );

                Navigator.of(context).pop();
              }
            },
            icon: const Icon(Icons.save),
            color: Colors.white,
          ),
        ],
        title: const Center(
          child: Text(
            'Formulário',
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Form(
          key: _form,
          child: Column(
            children: <Widget>[
              TextFormField(
                initialValue: _formData['name'],
                decoration: const InputDecoration(labelText: 'Nome'),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Campo obrigatório';
                  }
                  if (value.trim().length < 3) {
                    return 'Nome muito pequeno';
                  }
                  return null;
                },
                onSaved: (value) => _formData['name'] = value!,
              ),
              TextFormField(
                initialValue: _formData['email'],
                decoration: const InputDecoration(labelText: 'E-mail'),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Campo obrigatório';
                  }
                  final bool emailValid = RegExp(
                          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                      .hasMatch(value);
                  if (!emailValid) {
                    return 'Email inválido';
                  }
                  return null;
                },
                onSaved: (value) => _formData['email'] = value!,
              ),
              TextFormField(
                initialValue: _formData['avatarUrl'],
                decoration: const InputDecoration(labelText: 'URL do Avatar'),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Campo obrigatório';
                  }
                  return null;
                },
                onSaved: (value) => _formData['avatarUrl'] = value!,
              )
            ],
          ),
        ),
      ),
    );
  }
}
