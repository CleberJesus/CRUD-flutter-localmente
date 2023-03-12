import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sqlite_teste/componentes/user_tile.dart';
import 'package:sqlite_teste/rotas/app_rotas.dart';

import '../provider/users.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  //Map<String, User> users = {...DUMMY_USERS};

  @override
  Widget build(BuildContext context) {
    final Users users = Provider.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista de usuários'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).pushNamed(AppRotas.USER_FORM);
            },
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: users.count,
        itemBuilder: (ctx, i) => UserTile(users.byIndex(i)),
      ),
    );
  }
}
