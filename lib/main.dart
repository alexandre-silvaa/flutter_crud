import 'package:flutter/material.dart';
import 'package:flutter_crud/pages/users/user_form.page.dart';
import 'package:flutter_crud/pages/users/users.page.dart';
import 'package:flutter_crud/provider/users.provider.dart';
import 'package:flutter_crud/routes/app.routes.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (ctx) => UsersProvider(),
        )
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
          useMaterial3: true,
        ),
        routes: {
          AppRoutes.HOME: (_) => UsersPage(),
          AppRoutes.USER_FORM: (_) => UserFormPage()
        },
      ),
    );
  }
}
