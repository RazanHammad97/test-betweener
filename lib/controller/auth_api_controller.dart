import 'dart:convert';

import 'package:bootcamp_starter/core/util/api_settings.dart';

import '../models/api_ressponse.dart';
import 'package:http/http.dart' as http;

import '../models/logged_user.dart';
import '../models/user_model.dart';
import '../pref/shared_pref.dart';

class AuthApiController {
  Future<bool> login({required LogedUser user}) async {
    Uri uri = Uri.parse(ApiSettings.login);
    http.Response response = await http
        .post(uri, body: {'email': user.email, 'password': user.password});

    if (response.statusCode == 200) {
      var json = jsonDecode(response.body);
      UserModel userModel = UserModel.fromJson(json);
      SharedPrefController().saveData(userModel);

      var decodedJson = json['user'];
      print('log$decodedJson');

      return true;
    } else {
      return false;
    }
  }

  Future<bool> register({required LogedUser user}) async {
    Uri uri = Uri.parse(ApiSettings.register);
    http.Response response = await http.post(uri, body: {
      'name': user.name,
      'email': user.email,
      'password': user.password,
      'password_confirmation': user.confirm
    });

    if (response.statusCode == 201) {
      var json = jsonDecode(response.body);

      var decodedJson = json['user'];
      print('re$decodedJson');
      return true;
    } else {
      return false;
    }
  }
}
