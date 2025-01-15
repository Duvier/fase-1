import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../data/models/user_model.dart';
import '../providers/user_provider.dart';

class FormUserWidget extends StatefulWidget {
  const FormUserWidget({super.key});

  @override
  State<FormUserWidget> createState() => _FormUserWidgetState();
}

class _FormUserWidgetState extends State<FormUserWidget> {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final descriptionController = TextEditingController();
  UserModel? _user;
  bool _isEdditing = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _initControllers();
    });
  }

  void _initControllers() {
    final user = ModalRoute.of(context)!.settings.arguments as UserModel?;
    if (user != null) {
      _user = user;
      _isEdditing = true;
      nameController.text = user.name;
      emailController.text = user.email;
      phoneController.text = user.phone;
      descriptionController.text = user.description;
      setState(() {});
    }
  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          TextFormField(
            controller: nameController,
            decoration: const InputDecoration(
              labelText: 'Nombre',
            ),
          ),
          const SizedBox(height: 10),
          TextFormField(
            controller: emailController,
            decoration: const InputDecoration(
              labelText: 'Email',
            ),
          ),
          const SizedBox(height: 10),
          TextFormField(
            controller: phoneController,
            decoration: const InputDecoration(
              labelText: 'Teléfono',
            ),
          ),
          const SizedBox(height: 10),
          TextFormField(
            controller: descriptionController,
            decoration: const InputDecoration(
              labelText: 'Descripción',
            ),
          ),
          const Spacer(),
          ElevatedButton(
            onPressed: _actionForm,
            child: Text(_isEdditing ? 'Actualizar' : 'Guardar'),
          ),
        ],
      ),
    );
  }

  void _actionForm() {
    try {
      final user = UserModel(
        id: _isEdditing
            ? _user!.id
            : DateTime.now().millisecondsSinceEpoch.toString(),
        name: nameController.text,
        email: emailController.text,
        phone: phoneController.text,
        description: descriptionController.text,
      );
      if (_isEdditing) {
        Provider.of<UserProvider>(context, listen: false).editUser(user);
      } else {
        Provider.of<UserProvider>(context, listen: false).createUser(user);
      }
      Navigator.pop(context);
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(e.toString())),
      );
    }
  }
}
