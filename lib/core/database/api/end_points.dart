class EndPoints {
  // base url
  static String baseUrl = "https://afiyatuk.runasp.net/";

  // endpoints

  //auth
  static String auth = "api/Auth/";
  static String signIn = "${auth}get-otp";
  static String otp = "${auth}login";

  static String getAllSystemMedicines = 'api/secure/Product';
  static String deleteMedicine = "api/secure/Product/";
  static String addMedicine = "api/secure/Product";
  static String updateMedicine = "api/secure/Product";
  static String getMedicine = "api/secure/Product";
  static String getOutOfStock = "api/secure/Product/out-of-stock";

  static String getProfile = "api/profile";
  static String getClinic = "api/clinic/";
  static String addPrescription = 'api/Appointments/add-prescription';

  static String addAppointment =
      "api/appointments/add-dates";
  static String getPatientAppointments = "api/Appointments";

  static String updateClinic = "api/clinic";

  static String acceptAppointment(String id) => 'api/Appointments/accept/$id';
  static String declineAppointment(String id) => 'api/Appointments/decline/$id';
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
