import 'package:globaleyes/core/data/models/base_response_absrtact.dart';

class BaseApiResponse implements BaseApiResponseAbstract{
  @override
  int code = 0;

  @override
  dynamic data;

  @override
  dynamic token;

  @override
  String message = '';

  BaseApiResponse({
    required this.code, required this.message, this.data, this.token
  });

  BaseApiResponse.fromJson(Map<String, dynamic> json) {
    code = json['status_code'];
    message = json['message'];
    token = json['token'];
    data = json['data'] != null ? (json['data']) : dynamic;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['status_code'] = code;
    data['message'] = message;
    data['token'] = token;
    if (this.data != null) {
      data['data'] = this.data;
    }
    return data;
  }

  @override
  String toString() {
    return toJson().toString();
  }

}