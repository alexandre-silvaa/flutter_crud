import 'package:flutter/material.dart';
import 'package:flutter_crud/components/UserTile.dart';
import 'package:flutter_crud/provider/users.provider.dart';
import 'package:flutter_crud/routes/app.routes.dart';
import 'package:provider/provider.dart';

class UsersPage extends StatelessWidget {
  const UsersPage({super.key});

  @override
  Widget build(BuildContext context) {
    final UsersProvider users = Provider.of(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyan,
        actions: <Widget>[
          IconButton(
              onPressed: () {
                Navigator.of(context).pushNamed(
                  AppRoutes.USER_FORM,
                );
              },
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
        itemCount: users.all.length,
        itemBuilder: (context, index) => UserTile(users.all.elementAt(index)),
      ),
    );
  }
}
