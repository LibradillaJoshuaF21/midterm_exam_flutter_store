import 'package:http/http.dart' as http;
import 'dart:convert';

class ApiService {
  static const String baseUrl = 'https://fakestoreapi.com';

  Future<dynamic> login(String userName, String password) {
    return http.post(Uri.parse("${baseUrl}auth/login"),
        body: {'username': userName, 'password': password}).then((data) {
      if (data.statusCode == 201) {
        final jsonData = json.decode(data.body);
        return Future<dynamic>(jsonData);
      }
    });
  }
}
