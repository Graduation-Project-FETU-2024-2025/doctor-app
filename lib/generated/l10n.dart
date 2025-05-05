// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `All Services for your health`
  String get onboarding {
    return Intl.message(
      'All Services for your health',
      name: 'onboarding',
      desc: '',
      args: [],
    );
  }

  /// `Welcome back!`
  String get welcomeBack {
    return Intl.message(
      'Welcome back!',
      name: 'welcomeBack',
      desc: '',
      args: [],
    );
  }

  /// `Login to your account`
  String get loginToYourAccount {
    return Intl.message(
      'Login to your account',
      name: 'loginToYourAccount',
      desc: '',
      args: [],
    );
  }

  /// `Email address`
  String get emailAddress {
    return Intl.message(
      'Email address',
      name: 'emailAddress',
      desc: '',
      args: [],
    );
  }

  /// `Login`
  String get login {
    return Intl.message(
      'Login',
      name: 'login',
      desc: '',
      args: [],
    );
  }

  /// `Enter OTP`
  String get enterOtp {
    return Intl.message(
      'Enter OTP',
      name: 'enterOtp',
      desc: '',
      args: [],
    );
  }

  /// `Enter the code we sent at`
  String get enterOtpWeSent {
    return Intl.message(
      'Enter the code we sent at',
      name: 'enterOtpWeSent',
      desc: '',
      args: [],
    );
  }

  /// `Continue`
  String get continueOtp {
    return Intl.message(
      'Continue',
      name: 'continueOtp',
      desc: '',
      args: [],
    );
  }

  /// `Haven't received the OTP?`
  String get haventReceivedOtp {
    return Intl.message(
      'Haven\'t received the OTP?',
      name: 'haventReceivedOtp',
      desc: '',
      args: [],
    );
  }

  /// `Resend`
  String get resend {
    return Intl.message(
      'Resend',
      name: 'resend',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get password {
    return Intl.message(
      'Password',
      name: 'password',
      desc: '',
      args: [],
    );
  }

  /// `Name`
  String get name {
    return Intl.message(
      'Name',
      name: 'name',
      desc: '',
      args: [],
    );
  }

  /// `Phone`
  String get phone {
    return Intl.message(
      'Phone',
      name: 'phone',
      desc: '',
      args: [],
    );
  }

  /// `search`
  String get searchButtonTitle {
    return Intl.message(
      'search',
      name: 'searchButtonTitle',
      desc: '',
      args: [],
    );
  }

  /// `Search for medicine`
  String get searchHint {
    return Intl.message(
      'Search for medicine',
      name: 'searchHint',
      desc: '',
      args: [],
    );
  }

  /// `Medicines`
  String get medicines {
    return Intl.message(
      'Medicines',
      name: 'medicines',
      desc: '',
      args: [],
    );
  }

  /// `Select Medicines`
  String get selectMedicines {
    return Intl.message(
      'Select Medicines',
      name: 'selectMedicines',
      desc: '',
      args: [],
    );
  }

  /// `Save`
  String get save {
    return Intl.message(
      'Save',
      name: 'save',
      desc: '',
      args: [],
    );
  }

  /// `Delete`
  String get delete {
    return Intl.message(
      'Delete',
      name: 'delete',
      desc: '',
      args: [],
    );
  }

  /// `You Want To Delete This Clinic?`
  String get wantToDeleteClinic {
    return Intl.message(
      'You Want To Delete This Clinic?',
      name: 'wantToDeleteClinic',
      desc: '',
      args: [],
    );
  }

  /// `Yes`
  String get yes {
    return Intl.message(
      'Yes',
      name: 'yes',
      desc: '',
      args: [],
    );
  }

  /// `No`
  String get no {
    return Intl.message(
      'No',
      name: 'no',
      desc: '',
      args: [],
    );
  }

  /// `English`
  String get english {
    return Intl.message(
      'English',
      name: 'english',
      desc: '',
      args: [],
    );
  }

  /// `Arabic`
  String get arabic {
    return Intl.message(
      'Arabic',
      name: 'arabic',
      desc: '',
      args: [],
    );
  }

  /// `Language`
  String get language {
    return Intl.message(
      'Language',
      name: 'language',
      desc: '',
      args: [],
    );
  }

  /// `Dark Mode`
  String get darkMode {
    return Intl.message(
      'Dark Mode',
      name: 'darkMode',
      desc: '',
      args: [],
    );
  }

  /// `Logout`
  String get logout {
    return Intl.message(
      'Logout',
      name: 'logout',
      desc: '',
      args: [],
    );
  }

  /// `Good Morning\nDr.`
  String get goodMorning {
    return Intl.message(
      'Good Morning\nDr.',
      name: 'goodMorning',
      desc: '',
      args: [],
    );
  }

  /// `Let's see What's going on`
  String get letsSee {
    return Intl.message(
      'Let\'s see What\'s going on',
      name: 'letsSee',
      desc: '',
      args: [],
    );
  }

  /// `Clinic`
  String get clinic {
    return Intl.message(
      'Clinic',
      name: 'clinic',
      desc: '',
      args: [],
    );
  }

  /// `Checkups`
  String get checkups {
    return Intl.message(
      'Checkups',
      name: 'checkups',
      desc: '',
      args: [],
    );
  }

  /// `New Visits`
  String get newVisits {
    return Intl.message(
      'New Visits',
      name: 'newVisits',
      desc: '',
      args: [],
    );
  }

  /// `Re-Visits`
  String get reVisits {
    return Intl.message(
      'Re-Visits',
      name: 'reVisits',
      desc: '',
      args: [],
    );
  }

  /// `Booking`
  String get booking {
    return Intl.message(
      'Booking',
      name: 'booking',
      desc: '',
      args: [],
    );
  }

  /// `Total Income`
  String get totalIncome {
    return Intl.message(
      'Total Income',
      name: 'totalIncome',
      desc: '',
      args: [],
    );
  }

  /// `Missed`
  String get missed {
    return Intl.message(
      'Missed',
      name: 'missed',
      desc: '',
      args: [],
    );
  }

  /// `Completed`
  String get completed {
    return Intl.message(
      'Completed',
      name: 'completed',
      desc: '',
      args: [],
    );
  }

  /// `Pending`
  String get pending {
    return Intl.message(
      'Pending',
      name: 'pending',
      desc: '',
      args: [],
    );
  }

  /// `Clinic Timings`
  String get clinicTiming {
    return Intl.message(
      'Clinic Timings',
      name: 'clinicTiming',
      desc: '',
      args: [],
    );
  }

  /// `This Week`
  String get thisWeek {
    return Intl.message(
      'This Week',
      name: 'thisWeek',
      desc: '',
      args: [],
    );
  }

  /// `Next Week`
  String get nextWeek {
    return Intl.message(
      'Next Week',
      name: 'nextWeek',
      desc: '',
      args: [],
    );
  }

  /// `Start time`
  String get startTime {
    return Intl.message(
      'Start time',
      name: 'startTime',
      desc: '',
      args: [],
    );
  }

  /// `End Time`
  String get endTime {
    return Intl.message(
      'End Time',
      name: 'endTime',
      desc: '',
      args: [],
    );
  }

  /// `Booking Price`
  String get bookingPrice {
    return Intl.message(
      'Booking Price',
      name: 'bookingPrice',
      desc: '',
      args: [],
    );
  }

  /// `Today`
  String get today {
    return Intl.message(
      'Today',
      name: 'today',
      desc: '',
      args: [],
    );
  }

  /// `Upcoming`
  String get upcoming {
    return Intl.message(
      'Upcoming',
      name: 'upcoming',
      desc: '',
      args: [],
    );
  }

  /// `Past`
  String get past {
    return Intl.message(
      'Past',
      name: 'past',
      desc: '',
      args: [],
    );
  }

  /// `Appointment Request`
  String get appointmentRequest {
    return Intl.message(
      'Appointment Request',
      name: 'appointmentRequest',
      desc: '',
      args: [],
    );
  }

  /// `Accept`
  String get accept {
    return Intl.message(
      'Accept',
      name: 'accept',
      desc: '',
      args: [],
    );
  }

  /// `Decline`
  String get decline {
    return Intl.message(
      'Decline',
      name: 'decline',
      desc: '',
      args: [],
    );
  }

  /// `Please enable location service`
  String get enableLocationService {
    return Intl.message(
      'Please enable location service',
      name: 'enableLocationService',
      desc: '',
      args: [],
    );
  }

  /// `Location permission denied`
  String get locationPermissionDenied {
    return Intl.message(
      'Location permission denied',
      name: 'locationPermissionDenied',
      desc: '',
      args: [],
    );
  }

  /// `Location permission permanently denied`
  String get locationPermanentlyDenied {
    return Intl.message(
      'Location permission permanently denied',
      name: 'locationPermanentlyDenied',
      desc: '',
      args: [],
    );
  }

  /// `Latitude`
  String get latitude {
    return Intl.message(
      'Latitude',
      name: 'latitude',
      desc: '',
      args: [],
    );
  }

  /// `Longitude`
  String get longitude {
    return Intl.message(
      'Longitude',
      name: 'longitude',
      desc: '',
      args: [],
    );
  }

  /// `Get Address Info`
  String get getAddressInfo {
    return Intl.message(
      'Get Address Info',
      name: 'getAddressInfo',
      desc: '',
      args: [],
    );
  }

  /// `Clinic Status`
  String get clinicStatus {
    return Intl.message(
      'Clinic Status',
      name: 'clinicStatus',
      desc: '',
      args: [],
    );
  }

  /// `Open`
  String get open {
    return Intl.message(
      'Open',
      name: 'open',
      desc: '',
      args: [],
    );
  }

  /// `Close`
  String get close {
    return Intl.message(
      'Close',
      name: 'close',
      desc: '',
      args: [],
    );
  }

  /// `Clinic Name`
  String get clinicName {
    return Intl.message(
      'Clinic Name',
      name: 'clinicName',
      desc: '',
      args: [],
    );
  }

  /// `Enter Clinic Name`
  String get enterClinicName {
    return Intl.message(
      'Enter Clinic Name',
      name: 'enterClinicName',
      desc: '',
      args: [],
    );
  }

  /// `Enter Clinic Status`
  String get enterClinicStatus {
    return Intl.message(
      'Enter Clinic Status',
      name: 'enterClinicStatus',
      desc: '',
      args: [],
    );
  }

  /// `Enter Specialization Name`
  String get enterSpecializationName {
    return Intl.message(
      'Enter Specialization Name',
      name: 'enterSpecializationName',
      desc: '',
      args: [],
    );
  }

  /// `Enter Price`
  String get enterPrice {
    return Intl.message(
      'Enter Price',
      name: 'enterPrice',
      desc: '',
      args: [],
    );
  }

  /// `Price`
  String get price {
    return Intl.message(
      'Price',
      name: 'price',
      desc: '',
      args: [],
    );
  }

  /// `Specialization Name`
  String get specializationName {
    return Intl.message(
      'Specialization Name',
      name: 'specializationName',
      desc: '',
      args: [],
    );
  }

  /// `Comment`
  String get patientComment {
    return Intl.message(
      'Comment',
      name: 'patientComment',
      desc: '',
      args: [],
    );
  }

  /// `Examination`
  String get Examination {
    return Intl.message(
      'Examination',
      name: 'Examination',
      desc: '',
      args: [],
    );
  }

  /// `field Required`
  String get fieldRequired {
    return Intl.message(
      'field Required',
      name: 'fieldRequired',
      desc: '',
      args: [],
    );
  }

  /// `Patient Name`
  String get patientName {
    return Intl.message(
      'Patient Name',
      name: 'patientName',
      desc: '',
      args: [],
    );
  }

  /// `Next Appointment`
  String get nextAppointment {
    return Intl.message(
      'Next Appointment',
      name: 'nextAppointment',
      desc: '',
      args: [],
    );
  }

  /// `Add Analysis`
  String get addanalysis {
    return Intl.message(
      'Add Analysis',
      name: 'addanalysis',
      desc: '',
      args: [],
    );
  }

  /// `Diagnosis`
  String get diagnosis {
    return Intl.message(
      'Diagnosis',
      name: 'diagnosis',
      desc: '',
      args: [],
    );
  }

  /// `Add Diagnosis`
  String get addDiagnosis {
    return Intl.message(
      'Add Diagnosis',
      name: 'addDiagnosis',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ar'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
