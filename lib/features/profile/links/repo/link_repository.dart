import '../../../../core/util/api_base_helper.dart';
import '../models/link_model.dart';

class LinkRepository {
  final ApiBaseHelper _helper = ApiBaseHelper();

  String userToken = '200|KdHhbLjL3X8XEYEkDJNpGTJItQ1eXRNV6Z4whGuH';

  Future<List<Link>> fetchLinkList() async {
    final response = await _helper.get("/links", {
      'Authorization': 'Bearer $userToken',
    });
    return LinkResponse.fromJson(response).results;
  }

  Future<dynamic> addLink() async {
    final response = await _helper.post("", {}, {});
    return LinkResponse.fromJson(response).results;
  }
}