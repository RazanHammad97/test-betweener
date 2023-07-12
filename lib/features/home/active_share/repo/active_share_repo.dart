import 'package:bootcamp_starter/core/util/api_settings.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../core/util/api_base_helper.dart';
import '../../../../pref/shared_pref.dart';
import '../models/ActiveShare.dart';

class ActiveShareRepository{
  final ApiBaseHelper _helper = ApiBaseHelper();



  int id =SharedPrefController().getValueFor("id");
  String userToken = SharedPrefController().getValueFor("token");

  Future<dynamic> setActiveShare() async {
    print(ApiSettings.activeShare+"$id");
    print(userToken);
    final response = await _helper.post(ApiSettings.activeShare+"$id", {
      "type":"sender"
    }, {
      'Authorization':'$userToken'
    });
    print( "razan response ${ActiveShareResponse.fromJson(response).activeSharing}");
    return ActiveShareResponse.fromJson(response).activeSharing;
  }
}