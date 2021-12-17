import 'package:globaleyes/core/data/preference/preference.dart';

class SharedPreferencesHelper {

  static void clearPref(){

  }

  static const String _dollarPrice = "DollarPrice";
  static const String _password = "Password";

  static const String isLaunch = "isLaunch";

  static void setScreenLaunchOnce(bool value) {
    Preference.setBool(isLaunch, value);
  }
  static bool getScreenLaunchOnce() {
    return Preference.getBool(isLaunch);
  }

  static void setDollarPrice(int value) {
    Preference.setInt(_dollarPrice, value);
  }

  static void setPassword(String value) {
    Preference.setString(_password, value);
  }

  static int getDollarPrice() {
    return Preference.getInt(_dollarPrice);
  }

  static String getPassword() {
    return Preference.getString(_password);
  }

  static const String _rewardPoints = "RewardPoints";

  static void setRewardPoints(int value) {
    Preference.setInt(_rewardPoints, value);
  }

  static int getRewardPoints() {
    return Preference.getInt(_rewardPoints);
  }

  static const String _masterStore = "MasterStore";

  static void setMasterStore(int value) {
    Preference.setInt(_masterStore, value);
  }

  static bool getMasterStore() {
    return Preference.getInt(_masterStore) == 1;
  }

  static const String _reservationOpen = "ReservationOpen";

  static void setReservationOpen(int value) {
    Preference.setInt(_reservationOpen, value);
  }

  static bool getReservationOpen() {
    return Preference.getInt(_reservationOpen) == 1;
  }

  static const String _reservationMessage = "ReservationMessage";

  static void setReservationMessage(String value) {
    Preference.setString(_reservationMessage, value);
  }

  static String getReservationMessage() {
    return Preference.getString(_reservationMessage);
  }

  static const String _isCart = "IsCart";

  static void setIsCart(int value) {
    Preference.setInt(_isCart, value);
  }

  static int getIsCart() {
    return Preference.getInt(_isCart);
  }

  static const String _fbLogin = "FbLogin";

  static void setFbLogin(bool str) {
    Preference.setBool(_fbLogin, str);
  }

  static bool isFbLogin() {
    return Preference.getBool(_fbLogin);
  }

  static const String _gmailLogin = "GMailLogin";

  static void setGMailLogin(bool str) {
    Preference.setBool(_gmailLogin, str);
  }

  static bool isGMailLogin() {
    return Preference.getBool(_gmailLogin);
  }

  static const String _latitude = "latitude";

  static void setLatitude(String str) {
    Preference.setString(_latitude, str);
  }

  static String getLatitude() {
    return Preference.getString(_latitude);
  }

  static const String _longitude = "longitude";

  static void setLongitude(String str) {
    Preference.setString(_longitude, str);
  }

  static String getLongitude() {
    return Preference.getString(_longitude);
  }

  static const String _pointPayment = "PointPayment";

  static void setPointPayment(int str) {
    Preference.setInt(_pointPayment, str);
  }

  static bool getPointPayment() {
    return Preference.getInt(_pointPayment) == 0;
  }

  static const String _userPoints = "UserPoints";

  static void setUserPoints(int str) {
    Preference.setInt(_userPoints, str);
  }

  static int getUserPoints() {
    return Preference.getInt(_userPoints);
  }

  static const String _profileUrl = "ProfilePictureUrl";

  static void setProfileUrl(String str) {
    Preference.setString(_profileUrl, str);
  }

  static const String _gcmKey = "GCMKEY";

  static void setGcmKey(String str) {
    Preference.setString(_gcmKey, str);
  }

  static String getGcmKey() {
    return Preference.getString(_gcmKey);
  }


  static const String _pointsRedeemByUser = "PointsRedeemByUser";

  static void setPointsRedeemByUser(double str) {
    Preference.setDouble(_pointsRedeemByUser, str);
  }

  static double getPointsRedeemByUser() {
    return Preference.getDouble(_pointsRedeemByUser);
  }

  static const String _deliveryEnabled = "DeliveryEnabled";

  static void setDeliveryEnabled(bool str) {
    Preference.setBool(_deliveryEnabled, str);
  }

  static bool getDeliveryEnabled() {
    return Preference.getBool(_deliveryEnabled);
  }

  static const String _deliveryEnableMain = "DeliveryEnableMain";

  static void setDeliveryEnableMain(int str) {
    Preference.setInt(_deliveryEnableMain, str);
  }

  static bool getDeliveryEnableMain() {
    return Preference.getInt(_deliveryEnableMain) == 1;
  }

  //Customer register response

  static const String _token = "token";
  static void setUserToken(String value) {
    Preference.setString(_token, value);
  }
  static String getToken() {
    return Preference.getString(_token);
  }

  static const String _customURL = "customURL";
  static void SetCustomURL(String value) {
    Preference.setString(_customURL, value);
  }
  static String getCustomURL() {
    print(Preference.getString(_customURL));
    return Preference.getString(_customURL) != null ? Preference.getString(_customURL) : 'https://md-api.cynergic.com.au';
  }

}
