import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:test_app/models/login_response.dart';
import 'package:test_app/utils/endpoints.dart';

class LoginProvider extends ChangeNotifier {
  Future<dynamic> loginUser(String username, String password) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String uri = '${Endpoints.baseUrl}/${Endpoints.login}';
    Map<String, dynamic> loginBody = {
      'username': username,
      'password': password,
    };

    Response response = await post(Uri.parse(uri), body: loginBody);
    print(response.body);
    if (response.statusCode == 200) {
      var loginResponse = LoginResponse.fromJson(jsonDecode(response.body));
      print(loginResponse.accessToken);
      sharedPreferences.setString('token', loginResponse.accessToken ?? '');
      return loginResponse;
    } else {
      return null;
    }
  }
}
