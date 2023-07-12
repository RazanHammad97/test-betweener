import 'package:shared_preferences/shared_preferences.dart';

import '../models/user_model.dart';

enum PrefKeys { id, name, email, password, token, loggedIn, code }

class SharedPrefController {
  //singleton
  SharedPrefController._();

  late SharedPreferences _sharedPreferences;

  static SharedPrefController? _instance;

  factory SharedPrefController() {
    return _instance ??= SharedPrefController._();
  }

  Future<void> initPreferences() async {
    _sharedPreferences = await SharedPreferences.getInstance();
  }

  //for example if the logged in is user
  void saveData(UserModel user) async {
    await _sharedPreferences.setBool('logged_in', true);
    await _sharedPreferences.setBool(PrefKeys.loggedIn.name, true);
    await _sharedPreferences.setString('token', 'Bearer ${user.token}');
    await _sharedPreferences.setString('name', user.user.name ?? '');
    await _sharedPreferences.setString('email', user.user.email);
    await _sharedPreferences.setInt('id', user.user.id);
    await _sharedPreferences.setString('country', user.user.country ?? '');
    //complete the rest of variable methode in the same way
    // all variable in the enum above are same variable in the model user
  }

  bool get LoggedIn => _sharedPreferences.getBool('logged_in') ?? false;

  T? getValueFor<T>(String key) {
    if (_sharedPreferences.containsKey(key)) {
      return _sharedPreferences.get(key) as T;
    }
    return null;
  }

  Future<bool> clear() {
    return _sharedPreferences.clear();
  }
}
