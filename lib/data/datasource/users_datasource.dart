import '../models/user_model.dart';
import 'datasource_abstract.dart';

class UsersDatasource extends DatasourceAbstract<UserModel> {
  static final UsersDatasource _instance = UsersDatasource._internal();

  factory UsersDatasource() {
    return _instance;
  }

  UsersDatasource._internal();

  List<UserModel> users = [
    UserModel(
      id: '1',
      name: 'Tony',
      email: 'tony@pragma.com',
      phone: '3123123123',
      description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
    ),
    UserModel(
      id: '2',
      name: 'Loky',
      email: 'loky@pragma.com',
      phone: '3213213213',
      description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
    ),
    UserModel(
      id: '3',
      name: 'Taizon',
      email: 'taizon@pragma.com',
      phone: '3213213213',
      description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
    ),
    UserModel(
      id: '4',
      name: 'Yankee',
      email: 'yankee@pragma.com',
      phone: '3213213213',
      description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
    ),
  ];

  @override
  Future<List<UserModel>> getAll() async {
    return users;
  }
  
  @override
  Future<void> create(UserModel element) async  {
    users.add(element);
  }
  
  @override
  Future<void> delete(UserModel element) async {
    users.remove(element);
  }
  
  @override
  Future<void> edit(UserModel element) async {
    users.removeWhere((user) => user.id == element.id);
    users.add(element);
  }
}
