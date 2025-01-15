import 'package:flutter/material.dart';

import '../widgets/list_users_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 15),
              Text(
                'Bienvenido al reto Flutter \nFase 1 🥇',
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                      fontSize: 27,
                    ),
              ),
              const SizedBox(height: 15),
              Text(
                'Para esta fase he decidido crear una app que me permite administrar usuarios',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              const SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Listado de usuarios',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  OutlinedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/form');
                    },
                    child: const Text('Agregar usuario'),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              const Expanded(child: ListUsersWidget()),
            ],
          ),
        ),
      ),
    );
  }
}
