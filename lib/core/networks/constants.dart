import 'package:globaleyes/core/data/preference/shared_preferences_helper.dart';

mixin URLs {

  String getCustomURL = SharedPreferencesHelper.getCustomURL();
  // static const String host = const getCustomURL; // staging

  static const String host = 'https://md-api.dev.cynergic.com.au/'; // staging
  // static const String host = 'https://md-api.cynergic.com.au/'; // Live

  static const String getUserDetails = 'me';
  static const String updateProfile = 'settings/profile';
  static const String changePassword = 'settings/password';
  static const String forgotPassword = 'password/email';

  static const String loginApi = 'login/mobile';
  static const String getCompanyListApi = 'contacts?';
  static const String getCompanySitesListApi = 'sites?';
  static const String getServiceInternetListApi = 'services?';
  static const String getFinanceReceiptsListApi = 'payments?';
  static const String getFinanceInvoiceListApi = 'invoices?';
  static const String getKnowledgeBaseListApi = 'kb';
  static const String getPrivateKBListApi = 'private-kb?';
  static const String getCompanyAssetsListAPI = 'companies/assets/groups?';
  static const String getCompanyAssetsDetailsListAPI = 'customer-assets?';
  static const String getCardsListAPI = 'cards?';
  static const String AddCreditCardsAPI = 'cards';
  static const String UseForAutoPay = 'credit-cards';
  static const String paymentCreate = 'payments/create?';
  static const String NBNSearchAddress = 'nbn/search/address';
  static const String OutstandingInvoiceList = 'invoices/outstanding?';

  static const String contactsCreate = 'contacts/create';
  static const String SitesCreate = 'sites/';

  static const String AddContacts = 'contacts';
  static const String AllTicketsList = 'ticket-departments?';
  static const String TicketsList = 'tickets?';
  static const String TicketsDetails = 'tickets';

  static const String companiesAssetsDetails = 'companies/assets/';
  static const String companiesAssetsCreateDetails = 'companies/assets/create?';

  static const String deleteSecret = 'secrets';


  static const String logout = 'logout';

}

// constant for page limit & timeout
mixin AppLimit {
  static const int REQUEST_TIME_OUT = 30000;
  static const int ALBUM_PAGE_SIZE = 18;
  static const int POST_PAGE_SIZE = 30;
}

mixin APIParam {
  static const String apiKey = 'Apikey';
  static const String authorization = 'Authorization';
  static const String appName = 'app-name';
  static const String email = 'email';
  static const String password = 'password';
  static const String confirm_password = 'confirm_password';
  static const String old_password = 'old_password';
  static const String new_password = 'new_password';
  static const String device_name = 'device_name';
  static const String remember = 'remember';

  static const String current = 'current';
  static const String newPass = 'new';
  static const String new_confirmation = 'new_confirmation';

  static const String page  = 'page';
  static const String per_page  = 'per_page';

  static const String groups0  = 'groups[0]';
  static const String groups1  = 'groups[1]';
  static const String groups2  = 'groups[2]';
  static const String broadband2  = 'broadband[2]';



  static const String osType = 'os_type';
  static const String deviceToken = 'device_token';
  static const String gcmKey = 'gcm_key';
  static const String businessName = 'business_name';

  static const String firstName = 'first_name';
  static const String lastName = 'last_name';
  static const String dob = 'dob';
  static const String favoriteLocation = 'favorite_location';
  static const String gender = 'gender';
  static const String latitude = 'latitude';
  static const String longitude = 'longitude';
  static const String maritalStatus = 'marital_status';
  static const String contact = 'contact';
  static const String facebookId = 'facebook_id';
  static const String googleId = 'google_id';

  static const String timezone = 'timezone';

  static const String userName = 'username';
  static const String contactNumber = 'contactno';
  static const String isSocial  = 'is_social';

  //customer deal
  static const String dealId = 'deal_id';
  static const String status = 'status';

  static const String businessId = 'business_id';
  static const String address = 'address';
  static const String accountType  = 'account_type';
  static const String appId  = 'app_id';

  static const String minDistance  = 'min_distance';
  static const String maxDistance  = 'max_distance';
  static const String categoryId  = 'categoryId';
  static const String sortBy  = 'sortBy';

  static const String limit  = 'limit';

  //Update Profile



  //Add contact
  static const String id  = 'id';
  static const String name  = 'name';
  static const String customer_sites  = 'customer_sites';
  static const String roles  = 'roles';
  static const String mobile_phone  = 'mobile_phone';
  static const String home_phone  = 'home_phone';
  static const String work_phone  = 'work_phone';
  static const String work_phone_extension  = 'work_phone_extension';
  static const String fax  = 'fax';


  //Add Edit sites
  static const String title  = 'title';
  static const String types  = 'types';
  static const String description  = 'description';
  static const String country_id  = 'country_id';
  static const String street_one  = 'street_one';
  static const String street_two  = 'street_two';
  static const String suburb  = 'suburb';
  static const String region_id  = 'region_id';
  static const String postcode  = 'postcode';
  static const String lat  = 'lat';
  static const String lon  = 'lon';


  static const String secrets  = 'secrets';
  static const String max_versions  = 'max_versions';



}

mixin MapKeys {
  static const String isSocialLogin = 'isSocialLogin';
  static const String email = 'email';
  static const String googleId = 'googleId';
  static const String facebookId = 'facebookId';
  static const String displayName = 'displayName';
  static const String phoneNumber = 'phoneNumber';

  //Create reservation
  static const String storeId = 'storeId';
  static const String storeName = 'storeName';
  static const String peopleNumber = 'peopleNumber';
  static const String date = 'date';
  static const String time = 'time';
  static const String name = 'name';
  static const String contact = 'contact';
  static const String extraRequest = 'extraRequest';
  static const String reservationOfferId = 'reservationOfferId';

  //My Order
  static const String deliveryStoreChargesModel = 'deliveryStoreChargesModel';
  static const String cartItemList = 'cartItemList';
  static const String deliveryChargeModel = 'deliveryChargeModel';
  static const String validateOfferModel = 'validateOfferModel';
  static const String reedemDiscountPrice = 'reedemDiscountPrice';
  static const String selectedDeliveryMode = 'add';
  static const String createReservationModel = 'createReservationModel';
  static const String storeListData = 'storeListData';
  static const String additionalComments = 'additionalComments';
  static const String cardListData = 'cardListData';
  static const String addOrder = 'addOrder';
  static const String pickUpDate = "pickUpDate";
  static const String pickUpTime = "pickUpTime";
  static const String isStoreCloseFromPickUp = "isStoreCloseFromPickUp";
  static const String termsAcceptedFromPickUp = "termsAcceptedFromPickUp";
  static const String wonPoints = "wonPoints";
  static const String addressId = "addressId";


  // add deal, update deal, delete deal, get deal
  static const page = "page";
  static const status = "status";

}

const String sentryDSN = '';
const String appVersion = '0.0.1';
const String environment = 'Production';
const int maxCount = 10;
const int minCount = 1;
const int ReservationOfferDayOffset = 30;
