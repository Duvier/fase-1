import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/user_provider.dart';
import 'item_user_widget.dart';

class ListUsersWidget extends StatefulWidget {
  const ListUsersWidget({super.key});

  @override
  State<ListUsersWidget> createState() => _ListUsersWidgetState();
}

class _ListUsersWidgetState extends State<ListUsersWidget> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<UserProvider>(context, listen: false).loadUsers();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<UserProvider>(
      builder: (context, userProvider, _) {
        if (userProvider.isLoading) return const CircularProgressIndicator();
        return ListView.separated(
          itemCount: userProvider.users.length,
          itemBuilder: (_, index) {
            final user = userProvider.users[index];
            return ItemUserWidget(user: user);
          },
          separatorBuilder: (_, __) => const SizedBox(height: 10),
        );
      },
    );
  }
}
