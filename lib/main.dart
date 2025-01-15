import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'config/theme/app_theme.dart';
import 'data/datasource/users_datasource.dart';
import 'data/repositories/user_repository.dart';
import 'presentation/providers/user_provider.dart';
import 'presentation/router/router.dart';

void main() {
  // Dependency Injection
  final userRepository = UserRepository(
    usersDatasource: UsersDatasource(),
  );

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => UserProvider(repository: userRepository),
        ),
      ],
      child: const MainApp(),
    ),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fase 1 del reto Flutter',
      theme: AppTheme.getTheme(),
      initialRoute: '/',
      routes: routes,
    );
  }
}
