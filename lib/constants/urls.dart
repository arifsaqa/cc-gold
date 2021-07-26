String base_url = 'https://cc-gold.letoop.xyz';
String apiVersion = '/api/v1/';

class AuthURL {
  String get checkToken => base_url + apiVersion + 'checkToken';
  String get login => base_url + apiVersion + 'login';
  String get reloginWithPin => base_url + apiVersion + 'reloginWithPin';
  String get register => base_url + apiVersion + 'register';
  String get photoUpload => base_url + apiVersion + 'user/upload';
  String get getAllUsers => base_url + apiVersion + 'getAllUsers';
  String get getUserById => base_url + apiVersion + 'getUserById/';
  String get logout => base_url + apiVersion + 'logout';
}

class PromoURL {
  String get getCreatePromo => base_url + apiVersion + 'promos';
  String get phptoUpload => base_url + apiVersion + 'promos/upload';
}
