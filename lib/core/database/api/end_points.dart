class EndPoints {
  // base url
  static String baseUrl = "https://afiyatuk.runasp.net/";

  // endpoints

  //auth
  static String auth = "api/Auth/";
  static String signIn = "${auth}login";
  static String otp = "${auth}test-otp";
  static String getBranches = '/api/secure/Branch';
  static String getBranchProducts = 'api/secure/Product/';

  static String getAllSystemMedicines = 'api/secure/Product';

  static String deleteMedicine = "api/secure/Product/";
  static String addMedicine = "api/secure/Product";
  static String updateMedicine = "api/secure/Product";
  static String getMedicine = "api/secure/Product";
  static String getOutOfStock = "api/secure/Product/out-of-stock";
}

class ApiKeys {
  static String status = "status";
  static String eMessage = "ErrorMessage";
  static String email = "email";
  static String password = "password";
  static String token = "token";
  static String id = "id";
  static String message = "message";
  static String name = "name";
  static String phone = "phone";
  static String confirmPassword = "confirmPassword";
  static String location = "location";
  static String profilePic = "profilePic";
  static String type = "type";
  static String coordinates = "coordinates";
  static String favorites = "favorites";
  static String createdAt = "createdAt";
  static String user = "user";
  static String lang = "lang";
}
