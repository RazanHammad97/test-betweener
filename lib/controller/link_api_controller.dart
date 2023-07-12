import 'dart:convert';

import 'package:bootcamp_starter/core/util/api_settings.dart';

import 'package:http/http.dart' as http;

import '../models/api_ressponse.dart';
import '../models/user_link_model.dart';
import '../pref/shared_pref.dart';

class LinkApiController {
  Future<ApiResponse> addLinks(
      {required String title,
      required String link,
      required String username}) async {
    String token = SharedPrefController().getValueFor('token');
    Uri uri = Uri.parse(ApiSettings.usersLink);
    http.Response response = await http.post(uri, body: {
      "title": "$title",
      "link": "$link",
      "username": "$username",
      "isActive": "0"
    }, headers: {
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    });

    if (response.statusCode == 200) {
      var json = jsonDecode(response.body);
      var decodedJson = json['link'];
      // print('data is$decodedJson');
      return ApiResponse(
          msg: 'The link has been added successfully ', sucess: true);
    } else {
      return ApiResponse(msg: 'Something went wrong', sucess: false);
    }
  }

  Future<List<UserLinkModel>> getMyLink() async {
    String token = SharedPrefController().getValueFor('token');
    Uri uri = Uri.parse(ApiSettings.usersLink);
    http.Response response = await http.get(uri, headers: {
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    });
    // print(response.body);
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      var DecodedData = data['links'] as List;
      print('DecodedData$DecodedData');
      List<UserLinkModel> links =
          DecodedData.map((obj) => UserLinkModel.fromJson(obj)).toList();
      return links;
    }
    return [];
  }

  Future<ApiResponse> deleteLink({required int id}) async {
    String token = SharedPrefController().getValueFor('token');
    Uri uri = Uri.parse('${ApiSettings.usersLink}/$id');
    http.Response response = await http.delete(uri, headers: {
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    });
    var data = jsonDecode(response.body);

    if (response.statusCode == 200) {
      return ApiResponse(msg: data['message'], sucess: true);
    } else {
      return ApiResponse(msg: 'Something went wrong ', sucess: false);
    }
  }

  Future<ApiResponse> editLinks(
      {required String title,
      required int id,
      required String link,
      required String username}) async {
    String token = SharedPrefController().getValueFor('token');

    Uri uri = Uri.parse('${ApiSettings.usersLink}/$id');
    http.Response response = await http.put(uri, body: {
      "title": "$title",
      "link": "$link",
      "username": "$username",
      "isActive": "0"
    }, headers: {
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    });

    if (response.statusCode == 200) {
      var json = jsonDecode(response.body);
      var decodedJson = json['link'];
      // print('data is$decodedJson');
      return ApiResponse(
          msg: 'The link has been added successfully ', sucess: true);
    } else {
      return ApiResponse(msg: 'Something went wrong', sucess: false);
    }
  }
}
