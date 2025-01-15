import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../data/models/user_model.dart';
import '../providers/user_provider.dart';

class ItemUserWidget extends StatelessWidget {
  const ItemUserWidget({super.key, required this.user});
  final UserModel user;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      tileColor: Colors.blue.withOpacity(0.1),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      leading: CircleAvatar(
        child: Text(user.name[0]),
      ),
      trailing: const Icon(Icons.remove_red_eye_outlined),
      title: Text(user.name),
      subtitle: Text(user.email),
      onTap: () {
        Provider.of<UserProvider>(context, listen: false).setUser(user);
        Navigator.pushNamed(context, '/details');
      },
    );
  }
}
