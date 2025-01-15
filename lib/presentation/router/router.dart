import 'package:flutter/material.dart';

import '../screens/details_screen.dart';
import '../screens/form_screen.dart';
import '../screens/home_screen.dart';

Map<String, Widget Function(BuildContext context)> routes = {
  '/': (context) => const HomeScreen(),
  '/details': (context) => const DetailsScreen(),
  '/form': (context) => const FormScreen(),
};
