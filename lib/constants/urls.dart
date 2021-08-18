String base_url = 'https://ccgold.erahn.id';
String apiVersion = '/api/v1/';
String public = '/public/';

class AuthURL {
  String get checkToken => base_url + apiVersion + 'checkToken';
  String get login => base_url + apiVersion + 'login';
  String get reloginWithPin => base_url + apiVersion + 'reloginWithPin';
  String get register => base_url + apiVersion + 'register';
  String get photoUpload => base_url + apiVersion + 'user/upload';
  String get getAllUsers => base_url + apiVersion + 'getAllUsers';
  String get getUserById => base_url + apiVersion + 'getUserById/';
  String get logout => base_url + apiVersion + 'logout';
  String get resetPin => base_url + apiVersion + 'resetPasswordOTP';
}

class UsersData {
  String get userSaldo => base_url + apiVersion + 'saldo/';
  String get bankAccounts => base_url + apiVersion + 'bankAccounts/';
  String get getOrCreateTransaction => base_url + apiVersion + 'transactions/';
  String get verifiedByOTP => base_url + apiVersion + 'verifiedByOTP';
}

class DataUrl {
  String get getPromo => base_url + apiVersion + 'promos';
  String get getBuyPrice => base_url + apiVersion + 'buyPrices';
  String get getSellPrice => base_url + apiVersion + 'sellPrices';
  String get currentSellPrice => base_url + apiVersion + 'currentSellPrice';
  String get currentBuyPrice => base_url + apiVersion + 'currentBuyPrice';
  String get sellPriceById => base_url + apiVersion + 'sellPrice/';
  String get buyPriceById => base_url + apiVersion + 'buyprice/';
  String get paymentMethods => base_url + apiVersion + 'paymentMethods';
}
