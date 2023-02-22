enum NetworkMethod { Get, Post, Put, Delete }

class NetworkRequest {
  String path;
  NetworkMethod method;
  Map<String, dynamic>? body;
  Map<String, dynamic> headers;

  NetworkRequest({
    required this.path,
    required this.method,
    this.body,
    this.headers = const {'Content-Type': 'application/json'},
  });
}
