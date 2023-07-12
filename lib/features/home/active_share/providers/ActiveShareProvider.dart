

import 'package:bootcamp_starter/features/home/active_share/models/ActiveShare.dart';
import 'package:flutter/cupertino.dart';

import '../../../../core/util/api_response.dart';
import '../repo/active_share_repo.dart';

class ActiveShareProvider extends ChangeNotifier {
  late ActiveShareRepository _activeShareRepository;

  late ApiResponse<ActiveSharing> _activeShare;

  ApiResponse<ActiveSharing> get activeShare => _activeShare;

  ActiveShareProvider() {
    _activeShareRepository = ActiveShareRepository();
     setActiveShare();
  }

  setActiveShare() async {
    _activeShare=ApiResponse.loading("Fetching set active sharing response");
    notifyListeners();
    try {
      print("before ");
      ActiveSharing as  =await _activeShareRepository.setActiveShare();
      print("after");
      _activeShare=ApiResponse.completed(as);
      print(_activeShare);
      notifyListeners();
    }
    catch (e){
      _activeShare = ApiResponse.error(e.toString());
      print(_activeShare);
      notifyListeners();
    }
  }

}