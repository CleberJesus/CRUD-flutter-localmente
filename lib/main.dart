import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sqlite_teste/provider/users.dart';
import 'package:sqlite_teste/rotas/app_rotas.dart';
import 'package:sqlite_teste/telas/user_form.dart';

import 'telas/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (ctx) => Users(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'SqfLite Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        //home: const Home(),
        routes: {
          AppRotas.HOME: (_) => const Home(),
          AppRotas.USER_FORM: (ctx) => UserForm(),
        },
      ),
    );
  }
}
