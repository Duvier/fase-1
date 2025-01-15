import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/user_provider.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Fase 1 del reto Flutter'),
      ),
      body: Consumer<UserProvider>(
        builder: (context, userProvider, _) {
          final user = userProvider.user;
          if (user == null) return const SizedBox.shrink();
          return Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.all(15),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.shade200,
                        blurRadius: 10,
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 30,
                        child: Text(user.name[0]),
                      ),
                      const SizedBox(width: 15),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            user.name,
                            style: Theme.of(context).textTheme.titleLarge,
                          ),
                          Text(
                            user.email,
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                          Text(
                            user.phone,
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                Flex(
                  direction: Axis.horizontal,
                  children: [
                    Flexible(
                      child: OutlinedButton(
                        style: OutlinedButton.styleFrom(
                          backgroundColor: Colors.blue.shade100,
                          side: BorderSide(
                            color: Colors.blue.shade200,
                          ),
                        ),
                        child: const Row(
                          children: [
                            Icon(Icons.edit, size: 15),
                            SizedBox(width: 10),
                            Text('Editar usuario'),
                          ],
                        ),
                        onPressed: () {
                          Navigator.pushNamed(
                            context,
                            '/form',
                            arguments: user,
                          );
                        },
                      ),
                    ),
                    const SizedBox(width: 10),
                    Flexible(
                      child: OutlinedButton(
                        style: OutlinedButton.styleFrom(
                          backgroundColor: Colors.red.shade100,
                          side: BorderSide(
                            color: Colors.red.shade200,
                          ),
                        ),
                        child: const Row(
                          children: [
                            Icon(Icons.delete_sharp, size: 15),
                            SizedBox(width: 10),
                            Text('Eliminar usuario'),
                          ],
                        ),
                        onPressed: () {
                          Provider.of<UserProvider>(context, listen: false)
                              .deleteUser(user);
                          Navigator.pop(context);
                        },
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Container(
                  padding: const EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.shade200,
                        blurRadius: 10,
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      Text(
                        user.description,
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      const SizedBox(height: 10),
                      ListView.separated(
                        shrinkWrap: true,
                        itemBuilder: (context, index) => ListTile(
                          contentPadding: EdgeInsets.zero,
                          title: Text(
                            'Lorem ipsum dolor sit amet consectetur adipisicing elit. Quisquam, quos.',
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                        ),
                        separatorBuilder: (context, index) =>
                            const Divider(height: 1),
                        itemCount: 5,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
