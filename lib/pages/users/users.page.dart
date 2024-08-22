import 'package:flutter/material.dart';
import 'package:flutter_crud/components/UserTile.dart';
import 'package:flutter_crud/data/dummy_users.dart';

class UsersPage extends StatelessWidget {
  const UsersPage({super.key});
  static const users = {...DUMMY_USERS};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        actions: <Widget>[
          IconButton(
              onPressed: () {},
              icon: const Icon(Icons.add),
              color: Colors.white),
        ],
        title: const Center(
            child: Text(
          'Lista de Usuários',
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.white),
        )),
      ),
      body: ListView.builder(
        itemCount: users.length,
        itemBuilder: (context, index) =>
            UserTile(users.values.elementAt(index)),
      ),
    );
  }
}
