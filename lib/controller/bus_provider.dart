import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:test_app/utils/endpoints.dart';

import '../models/bus_list_response.dart';
import '../models/driver_create_response.dart';
import '../models/drivers_response.dart';

class BusProvider extends ChangeNotifier {
  Future<dynamic> getBusList() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String uri = '${Endpoints.baseUrl}/${Endpoints.buses}';
    String token = sharedPreferences.getString('token') ?? '';
    if (token != "") {
      Response response = await get(Uri.parse(uri), headers: {
        'Authorization': 'Bearer $token',
      });
      if (response.statusCode == 200) {
        print(response.body);
        return BusListResponse.fromJson(jsonDecode(response.body));
      } else {
        return null;
      }
    }
  }

  Future<dynamic> getDriversList() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String uri = '${Endpoints.baseUrl}/${Endpoints.drivers}';
    String token = sharedPreferences.getString('token') ?? '';
    if (token != "") {
      Response response = await get(Uri.parse(uri), headers: {
        'Authorization': 'Bearer $token',
      });
      if (response.statusCode == 200) {
        print(response.body);
        return DriversListResponse.fromJson(jsonDecode(response.body));
      } else {
        return null;
      }
    }
  }

  Future<dynamic> addDriver(String name, String mobile, String license) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String uri = '${Endpoints.baseUrl}/${Endpoints.drivers}';
    Map<String, dynamic> driverBody = {
      'name': name,
      'mobile': mobile,
      'license_no': license,
    };
    String token = sharedPreferences.getString('token') ?? '';
    if (token != "") {
      Response response = await post(Uri.parse(uri),
          headers: {
            'Authorization': 'Bearer $token',
          },
          body: driverBody);
      print(response.body);
      if (response.statusCode == 200) {
        return DriverCreateResponse.fromJson(jsonDecode(response.body));
      } else {
        return null;
      }
    }
  }

  Future<dynamic> deleteDriver(String driverId) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String uri = '${Endpoints.baseUrl}/${Endpoints.drivers}';
    Map<String, dynamic> driverBody = {
      'driver_id': driverId,
    };
    String token = sharedPreferences.getString('token') ?? '';
    if (token != "") {
      Response response = await delete(Uri.parse(uri),
          headers: {
            'Authorization': 'Bearer $token',
          },
          body: driverBody);
      if (response.statusCode == 200) {
        print(response.body);
        var deleteResponse =
            DriverCreateResponse.fromJson(jsonDecode(response.body));
        notifyListeners();
        return deleteResponse;
      } else {
        return null;
      }
    }
  }
}
