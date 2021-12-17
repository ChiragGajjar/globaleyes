import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:globaleyes/core/data/models/base_response.dart';
import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:http/io_client.dart';
import 'package:globaleyes/common_imports.dart';
import 'package:globaleyes/core/networks/intercepter/logger_intercepter.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:http_interceptor/http_interceptor.dart';
import 'package:globaleyes/shared/dialogs/app_common_dialog.dart';

class ApiCallInit {
  final Map<String, String> _headersApiKey = {
    APIParam.apiKey: AppString.apiKey,
    APIParam.appName: AppString.appName
  };

  Map<String, String> _headersWithAccept = {
    'Accept': "application/json",
  };

  Future<Map<String, String>> headerWithToken() async {
    var token = SharedPreferencesHelper.getToken();
    print('token api helper :  $token');
    if (token.isEmpty) {
      Map<String, String> strHeadersApiKey = {
        APIParam.authorization: 'Bearer ' + token,
        'Accept': "application/json",
      };
      return strHeadersApiKey;
    } else {
      return _headersApiKey;
    }
  }

  Future<Map<String, String>> _getHeaderApiKeyWithToken() async {
    var token = SharedPreferencesHelper.getToken();
    // String token = 'Bearer Bearer token;
    print('token api helper :  $token');
    if (token.isEmpty) {
      Map<String, String> strHeadersApiKey = {
        APIParam.authorization: 'Bearer ' + token
      };
      return strHeadersApiKey;
    } else {
      return _headersApiKey;
    }
  }

  Future<Map<String, String>> _getHeaderAcceptAndToken() async {
    var token = SharedPreferencesHelper.getToken();
    print('token api helper :  $token');
    if (token.isEmpty) {
      Map<String, String> strHeadersApiKey = {
        APIParam.authorization: 'Bearer ' + token,
        'Accept': "application/json",
        'Content-Type': "application/json",
      };
      return strHeadersApiKey;
    } else {
      return _headersApiKey;
    }
  }

  final Client _client = InterceptedClient.build(
    interceptors: [
      LoggerInterceptor(),
    ],
    client: IOClient(
      HttpClient()
        ..badCertificateCallback =
            (X509Certificate cert, String host, int port) => true,
    ),
  );

  @required
  BaseStatefulWidgetState state;
  @required
  Function onSuccess;
  Function? onFail;
  @required
  String url;
  @required
  bool passHeaderWithToken;
  bool passHeaderWithAccept;
  bool isAPIForLogin;
  bool isTokenAndJson;
  @required
  ApiType type;
  bool isErrorCodeRequired = false;
  bool isShowProgress = true;
  bool isGetFullResponse = true;
  bool isGetFullResponseWithErrorCode = true;
  bool showErrorMsg = true;
  bool isOnlyArrayData = false;
  bool isBlankResponseData = false;
  Map<String, String> body;
  Map<String, dynamic> multipartBody;
  Map<String, String> queryParameters;

  StreamSubscription<DataConnectionStatus>? listener;
  var InternetStatus = "Unknown";
  var contentmessage = "Unknown";
  bool isConnected = false;

  ApiCallInit({
    required this.state,
    required this.url,
    required this.type,
    required this.passHeaderWithToken,
    required this.passHeaderWithAccept,
    this.isShowProgress: true,
    this.isErrorCodeRequired: false,
    this.isGetFullResponse: false,
    this.isGetFullResponseWithErrorCode: false,
    this.isAPIForLogin = false,
    this.isTokenAndJson = false,
    this.isBlankResponseData = false,
    required this.queryParameters,
    required this.body,
    required this.multipartBody,
    this.onFail,
    required this.onSuccess,
    this.showErrorMsg: true,
    this.isOnlyArrayData: false,
  });

  // ignore: missing_return
  Future<void> call() async {
    try {
      // state.context.hideKeyboard();
      // checkConnection(state.context);

      if (isShowProgress) {
        state.showProgress();
      }
      final Response response = await _callAPi();

      // printWrapped("mainResponse $response");

      if (response.statusCode == 200) {
        print('success with token 200');
        print(response.body);

        BaseApiResponse baseResponse = BaseApiResponse.fromJson(json.decode(response.body));
        if (isOnlyArrayData == false){
          baseResponse = BaseApiResponse.fromJson(json.decode(response.body));
        }

        if (isBlankResponseData){
          state.hideProgress();
          return onSuccess('success');
        }else if (isOnlyArrayData){
          var tagsJson = jsonDecode(response.body);
          state.hideProgress();
          return onSuccess(tagsJson);
        }else if (isAPIForLogin) {
          if (baseResponse.token != null){
            print('success with token');
            state.hideProgress();
            return onSuccess(baseResponse.token);
          }else{
            state.hideProgress();
            print('success with error');

            if (showErrorMsg) {
              state.showError(baseResponse.message);
            } else {
              state.hideProgress();
            }
          }
          return onSuccess(baseResponse.data);
        }else if (response.statusCode == 200) {
          print('success with 200 body');
          state.hideProgress();
          return onSuccess(json.decode(response.body));
        } else if (baseResponse.code == 101) {
          /// For return the base response while need in API calling class.
          if (isErrorCodeRequired) {
            state.hideProgress();
            return onFail!(baseResponse);
          } else {
            if (showErrorMsg) {
              state.showError(baseResponse.message);
            } else {
              state.hideProgress();
            }
          }
        } else if (baseResponse.code == 400) {
          if (showErrorMsg) {
            state.showError(baseResponse.message);
          } else {
            state.hideProgress();
          }
        } else if (baseResponse.code == 422) {
          if (showErrorMsg) {
            state.showError(baseResponse.message);
          } else {
            state.hideProgress();
          }
        } else {
          state.hideProgress();
          if (isGetFullResponseWithErrorCode) {
            return onSuccess(
                BaseApiResponse.fromJson(json.decode(response.body)));
          } else {
            if (showErrorMsg) {
              state.showError(baseResponse.message);
            } else {
              state.hideProgress();
            }
          }
        }
      } else if (response.statusCode == 201) {
        print('success with 201');
        state.hideProgress();
        return onSuccess(json.decode(response.body));
      } else if (response.statusCode == 422) {
        print('error running');
        if (showErrorMsg) {
          state.showError(BaseApiResponse.fromJson(json.decode(response.body)).message);
        } else {
          state.hideProgress();
        }
      } else {
        state.hideProgress();
        if (showErrorMsg) {
          state.showError(response.reasonPhrase.toString());
        } else {
          state.hideProgress();
        }
      }
    } on HttpResponseException catch (exception) {
      state.hideProgress();
      if (showErrorMsg) {
        state.showError(exception.message);
      } else {
        state.hideProgress();
      }
      printWrapped(exception.toString());
    }
  }

  String setDynamicURL(String strEndPoint){
    String getCustomURL = SharedPreferencesHelper.getCustomURL();
    print(getCustomURL + ('/' + strEndPoint));
    return getCustomURL + '/' + strEndPoint;
  }

  Future<Response> _callAPi() async {
    var strURL = setDynamicURL(url);
    var finalUrl = _getUriUrl(strURL, queryParameters);
    Map<String, String> headers;
    if (passHeaderWithToken && passHeaderWithAccept) {
      headers = await _getHeaderAcceptAndToken();
    }else if (isTokenAndJson){
      headers = await headerWithToken();
    }else if (passHeaderWithToken) {
      headers = await _getHeaderApiKeyWithToken();
    }else if (passHeaderWithAccept){
      headers = _headersWithAccept;
    } else {
      headers = _headersApiKey;
    }

    switch (type) {
      case ApiType.GET:
        printWrapped('GET $finalUrl');
        printWrapped('headers- $headers');
        var response = await _client.get(finalUrl, headers: headers);
        printWrapped('Got GET response: ' + response.body);
        return _handleResponse(response);
        break;
      case ApiType.POST:
        printWrapped('POST $finalUrl');
        if (headers != null) {
          printWrapped('Request headers: ' + headers.toString());
        }
        if (body != null) {
          printWrapped('Request body: ' + body.toString());
        } else if (multipartBody != null) {
          print('Request multipartBody body: ');

          String bodya = json.encode(multipartBody);
          print('DATa:-' + bodya);
          print('headers:-' + headers.toString());
          var response = await _client.post(finalUrl, body: bodya, headers: headers);
          printWrapped('Got POST response: ${response.body}');
          return _handleResponse(response);
        }

        var response =
        await _client.post(finalUrl, body: body, headers: headers);
        printWrapped('Got POST response: ${response.body}');
        return _handleResponse(response);
        break;
      case ApiType.PUT:
        printWrapped('PUT $finalUrl');
        if (headers != null) {
          printWrapped('Request headers: ' + headers.toString());
        }
        if (body != null) {
          printWrapped('Request body: ' + body.toString());
        }
        var response =
            await _client.put(finalUrl, body: body, headers: headers);
        // printWrapped('Got PUT response: ' + response.body);
        printWrapped('Got PUT response: ${response.body}');
        return _handleResponse(response);
        break;
      case ApiType.PATCH:
        printWrapped('PATCH $finalUrl');
        if (headers != null) {
          printWrapped('Request headers: ' + headers.toString());
        }
        if (body != null) {
          printWrapped('Request body: ' + body.toString());
        } else if (multipartBody != null) {
          print('Request multipartBody body: ');

          String bodya = json.encode(multipartBody);
          print('DATa:-' + bodya);
          print('headers:-' + headers.toString());
          var response =
          await _client.patch(finalUrl, body: bodya, headers: headers);
          printWrapped('Got PATCH response: ${response.body}');
          return _handleResponse(response);
        }
        var response =
            await _client.patch(finalUrl, body: body, headers: headers);
        // printWrapped('Got PATCH response: ' + response.body);
        printWrapped('Got PATCH response: ${response.body}');
        return _handleResponse(response);
        break;
      case ApiType.DELETE:
        printWrapped('DELETE $finalUrl');
        printWrapped('Request headers: ' + headers.toString());
        printWrapped('Request body: ' + body.toString());
        var response = await _client.delete(finalUrl, headers: headers);
        // printWrapped('Got DELETE response: ' + response.body);
        printWrapped('Got DELETE response: ${response.body}');
        return _handleResponse(response);
        break;
    }
  }

  static Uri _getUriUrl(String url, Map<String, dynamic> queryParameters) {
    if (queryParameters == null || queryParameters.isEmpty) {
      return Uri.parse(url);
    }
    return Uri.parse(url).replace(queryParameters: queryParameters);
  }

  static dynamic _handleResponse(Response response) {
    if (response.statusCode >= 200 && response.statusCode <= 299) {
      return response;
    } else {
      return response;
    }
  }

  void printWrapped(String text) {
    final pattern = RegExp('.{1,800}'); // 800 is the size of each chunk
    pattern.allMatches(text).forEach((match) => print(match.group(0)));
  }

  void _showDialog(String title, String content, BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) => AppCommonDialog(
        title: AppString.appName,
        descriptions: content,
        buttonText: AppString.accept,
      ),
    );
  }

  checkConnection(BuildContext context) async {
    listener = DataConnectionChecker().onStatusChange.listen((status) {
      switch (status) {
        case DataConnectionStatus.connected:
          InternetStatus = "Connected to the Internet";
          contentmessage = "Connected to the Internet";
          isConnected = true;
          state.showProgress();

          // _showDialog(InternetStatus, contentmessage, context);
          break;
        case DataConnectionStatus.disconnected:
          InternetStatus = "You are disconnected to the Internet. ";
          contentmessage = "Please check your internet connection";
          isConnected = false;
          state.hideProgress();
          _showDialog(InternetStatus, contentmessage, context);
          break;
      }
    });
    return await DataConnectionChecker().connectionStatus;
  }
}
