class HttpResponseException implements Exception {
  final String message;
  final String body;
  final String statusCode;
  final Map<String, String> headers;

  /// The URL of the HTTP request or response that failed.
  final Uri uri;

  HttpResponseException(this.message, this.statusCode,
      {required this.uri, required this.body, required this.headers});

  @override
  String toString() => message;
}
