import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../modelos/usuarios.dart';
import '../provider/users.dart';
import '../rotas/app_rotas.dart';

class UserTile extends StatelessWidget {
  final User user;
  const UserTile(this.user);

  @override
  Widget build(BuildContext context) {
    final avatar = user.avatarUrl == null || user.avatarUrl!.isEmpty
        ? const CircleAvatar(
            child: Icon(Icons.person),
          )
        : CircleAvatar(
            backgroundImage: NetworkImage(user.avatarUrl!),
          );

    return ListTile(
      leading: avatar,
      title: Text(user.name!),
      subtitle: Text(user.email!),
      trailing: SizedBox(
        width: 100,
        child: Row(
          children: [
            IconButton(
              onPressed: () {
                Navigator.of(context).pushNamed(
                  AppRotas.USER_FORM,
                  arguments: user,
                );
              },
              color: Colors.blue,
              icon: const Icon(Icons.edit),
            ),
            IconButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (ctx) => AlertDialog(
                    title: const Text(
                      'Excluir Usuário',
                    ),
                    content: const Text('Tem certeza?'),
                    actions: [
                      TextButton(
                        child: const Text('Não'),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                      TextButton(
                        child: const Text('Sim'),
                        onPressed: () {
                          Provider.of<Users>(context, listen: false)
                              .remove(user);
                          Navigator.of(context).pop();
                        },
                      ),
                    ],
                  ),
                );
              },
              color: Colors.red,
              icon: const Icon(Icons.delete),
            ),
          ],
        ),
      ),
    );
  }
}
