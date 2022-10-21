part of 'services.dart';

class UserService {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  Future<BaseResponse> checkLogin() async {
    final storage = await _prefs;
    if (storage.getBool(login) == true) {
      return BaseResponse(true, "Success");
    } else {
      return BaseResponse(null, "Failed");
    }
  }

  Future<BaseResponse> checkLogOut() async {
    final storage = await _prefs;
    if (storage.getBool(login) == true) {
      storage.clear();
      return BaseResponse(true, "Success");
    } else {
      return BaseResponse(null, "Failed");
    }
  }
}
