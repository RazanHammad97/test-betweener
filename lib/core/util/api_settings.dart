class ApiSettings {
  static const _baseUrl = "https://osamapro.online/api";
  static const register = '$_baseUrl/register';
  static const login = '$_baseUrl/login';
  static const updateUserLocation = '$_baseUrl/update/';
  static const usersLink = '$_baseUrl/links'; //addLink with usersLink req
  static const newUpdateFCM  = '$_baseUrl/fcm/';
  static const activeShare = '/activeShare/'; //delete with active share req
  static const nearestSender = '$_baseUrl/activeShare/nearest/';
  static const linkReq = '$_baseUrl/links/'; // delete and update link req
  static const followers = '$_baseUrl/follow'; // followers and addFollow link req
  static const search = '$_baseUrl/search';
}
