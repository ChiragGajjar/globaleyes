abstract class BaseApiResponseAbstract {
  int code;
  String message;
  dynamic data;

  BaseApiResponseAbstract({
    required this.code, required this.message, this.data
  });


}