
import '../models/user_model.dart';
import '../datasource/datasource_abstract.dart';

class UserRepository {
  final DatasourceAbstract<UserModel> usersDatasource;
  UserRepository({required this.usersDatasource});

  Future<List<UserModel>> getUsers() async {
    return usersDatasource.getAll();
  }

  Future<void> createUser(UserModel user) async {
    return usersDatasource.create(user);
  }

  Future<void> deleteUser(UserModel user) async {
    return usersDatasource.delete(user);
  }

  Future<void> editUser(UserModel user) async {
    return usersDatasource.edit(user);
  }
}