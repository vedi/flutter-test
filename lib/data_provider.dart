import 'models/user.dart';

abstract class DataProvider {
  Future<User> loadUser();
}

class ApiDataProvider implements DataProvider {
  @override
  Future<User> loadUser() {
    // TODO: implement loadUser
    throw UnimplementedError();
  }
}
