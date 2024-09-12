import 'dart:convert';
import 'dart:developer';

import 'package:bookia_app/core/constants/constants.dart';
import 'package:bookia_app/feature/auth/data/models/request/register_params.dart';
import 'package:bookia_app/feature/auth/data/models/response/register_response_model/register_response_model.dart';
import 'package:http/http.dart' as http;

class AuthRepo {
  // Dio , Http
  static Future<RegisterResponseModel?> register(RegisterParams params) async {
    // 1) parse baseUrl+endpoint from string to Uri  (Not in Dio)
    // 2) call Api with specified Method (get or post or put or delete)
    // 3) check status code (200 Ok) or other Failures.
    // 4) convert response body from string to json (jsonDecode) (Not in Dio)
    // 5) if 200 => parse json response to model and return it.
    // 6) handle Failures

    try {
      Uri url =
          Uri.parse(AppConstants.baseUrl + AppConstants.registerEndpoints);
      var response = await http.post(url, body: params.toJson());
      log("200 $response");

      if (response.statusCode == 201) {
        var jsonResponse = jsonDecode(response.body);
        var model = RegisterResponseModel.fromJson(jsonResponse);
        return model;
      } else {
        return null;
      }
    } on Exception catch (e) {
      log(e.toString());
      return null;
    }
  }
}
