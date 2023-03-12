import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../modelos/usuarios.dart';
import '../provider/users.dart';

class UserForm extends StatelessWidget {
  final Map<String, String> _formData = {};
  final _form = GlobalKey<FormState>();

  UserForm({super.key});

  void _loadFormData(User? user) {
    if (user != null) {
      _formData['id'] = user.id!;
      _formData['name'] = user.name!;
      _formData['email'] = user.email!;
      _formData['avatarUrl'] = user.avatarUrl!;
    }
  }

  @override
  Widget build(BuildContext context) {
    //obtendo usuario ja cadastrado

    Object? user = ModalRoute.of(context)!.settings.arguments;

    _loadFormData(user as User?);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Formulário de Usuário'),
        actions: [
          IconButton(
            onPressed: () {
              final isValido = _form.currentState!.validate();

              if (isValido) {
                _form.currentState!.save();
                Provider.of<Users>(context, listen: false).put(User(
                  id: _formData['id'],
                  name: _formData['name'],
                  email: _formData['email'],
                  avatarUrl: _formData['urlAvatar'],
                ));
                Navigator.of(context).pop();
              }
            },
            icon: const Icon(Icons.save),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Form(
          key: _form,
          child: Column(
            children: [
              TextFormField(
                initialValue: _formData['name'],
                decoration: const InputDecoration(labelText: 'Nome'),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Nome inválido';
                  }

                  if (value.trim().length < 3) {
                    return 'Nome deve conter no minimo 3 letras';
                  }
                  return null;
                },
                onSaved: (value) => _formData['name'] = value!,
              ),
              TextFormField(
                initialValue: _formData['email'],
                decoration: const InputDecoration(labelText: 'Email'),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Email inválido';
                  }
                  return null;
                },
                onSaved: (value) => _formData['email'] = value!,
              ),
              TextFormField(
                initialValue: _formData['avatarUrl'],
                decoration: const InputDecoration(labelText: 'URL avatar'),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Url inválida';
                  }
                  return null;
                },
                onSaved: (value) => _formData['urlAvatar'] = value!,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
