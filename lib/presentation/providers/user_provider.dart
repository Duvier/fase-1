import 'package:flutter/material.dart';

import '../../data/models/user_model.dart';
import '../../data/repositories/user_repository.dart';

class UserProvider extends ChangeNotifier {
  final UserRepository _repository;

  UserProvider({required UserRepository repository}) : _repository = repository;
// State
  List<UserModel> _users = [];
  bool _isLoading = false;
  String? _error;
  UserModel? _user;

// Getters
  UserModel? get user => _user;
  List<UserModel> get users => _users;
  bool get isLoading => _isLoading;
  String? get error => _error;

// Setters
  void setUser(UserModel user) {
    _user = user;
    notifyListeners();
  }

  // Methods
  Future<void> loadUsers() async {
    _isLoading = true;
    notifyListeners();
    try {
      _users = await _repository.getUsers();
    } catch (e) {
      _error = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> editUser(UserModel user) async {
    try {
      _error = null;
      await _repository.editUser(user);
      await loadUsers();
      _user = user;
    } catch (e) {
      _error = e.toString();
    } finally {
      notifyListeners();
    }
  }

  Future<void> deleteUser(UserModel user) async {
    try {
      _error = null;
      await _repository.deleteUser(user);
      loadUsers();
    } catch (e) {
      _error = e.toString();
    } finally {
      notifyListeners();
    }
  }

  Future<void> createUser(UserModel user) async {
    try {
      _error = null;
      await _repository.createUser(user);
      await loadUsers();
    } catch (e) {
      _error = e.toString();
    } finally {
      notifyListeners();
    }
  }
}
