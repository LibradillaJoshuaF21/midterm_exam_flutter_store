// ignore_for_file: avoid_print, invalid_return_type_for_catch_error

import 'package:fake_store/models/product.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ApiService {
  static const String baseUrl = 'https://fakestoreapi.com';

  Future<dynamic> login(String userName, String password) {
    return http.post(Uri.parse("$baseUrl/auth/login"),
        body: {'username': userName, 'password': password}).then((data) {
      if (data.statusCode == 201) {
        final jsonData = json.decode(data.body);
        return Future<dynamic>(jsonData);
      }
    }).catchError((err) => print(err));
  }

  Future<List<Product>> getAllProducts() async {
    return http.get(Uri.parse('$baseUrl/products')).then((data) {
      final productList = <Product>[];
      if (data.statusCode == 200) {
        final jsonData = json.decode(data.body);
        for (var item in jsonData) {
          productList.add(Product.fromJson(item));
        }
      }
      return productList;
    }).catchError((err) => print(err));
  }
}
