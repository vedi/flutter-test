import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'data_provider.dart';
import 'models/user.dart';

class KeyValueStorage implements DataProvider {
  final String key;
  final JsonCodec codec;

  const KeyValueStorage(this.key, [this.codec = json]);

  @override
  Future<User> loadUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String stateStr = prefs.getString(key);
    await codec
      .decode(stateStr)['user']
      .cast<User>();
  }
}
