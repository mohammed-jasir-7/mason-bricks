import 'package:http/http.dart' as http;

class ApiClient {
  final http.Client _client;

  ApiClient._internal(this._client); // Private constructor for singleton

  static final ApiClient _instance = ApiClient._internal(http.Client());

  factory ApiClient() {
    return _instance;
  }

  http.Client get client => _client;

  Future<http.Response> get(Uri url, {Map<String, String>? headers}) {
    return _client.get(url, headers: headers);
  }

  Future<http.Response> post(Uri url, {Map<String, String>? headers, dynamic body}) {
    return _client.post(url, headers: headers, body: body);
  }

  Future<http.Response> put(Uri url, {Map<String, String>? headers, dynamic body}) {
    return _client.put(url, headers: headers, body: body);
  }

  Future<http.Response> delete(Uri url, {Map<String, String>? headers,dynamic body}) {
    return _client.delete(url, headers: headers);
  }

  void dispose() {
    _client.close();
  }
}
