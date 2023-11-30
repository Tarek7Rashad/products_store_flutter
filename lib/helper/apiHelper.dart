import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ApiHelper {
  Future<dynamic> getApiHelper(
      {required String url, @required String? token}) async {
    Map<String, String> header = {};
    if (token != null) {
      header.addAll({"Authorization": "Bearer $token"});
    }
    http.Response response = await http.get(Uri.parse(url), headers: header);
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception(
          "there is an error in stateCode : ${response.statusCode}");
    }
  }

  Future<dynamic> postApiHeader(
      {required String url,
      @required dynamic body,
      @required String? token}) async {
    Map<String, String> header = {};
    if (token != null) {
      header.addAll({"Authorization": "Bearer $token"});
    }

    http.Response response =
        await http.post(Uri.parse(url), body: body, headers: header);
    if (response.statusCode == 200) {
      Map<String, dynamic> json = jsonDecode(response.body);
      return json;
    } else {
      throw Exception(
          "there is an error in stateCode : ${response.statusCode} in ${response.body}");
    }
  }

  Future<dynamic> putApiHeader(
      {required String url,
      @required dynamic body,
      @required String? token}) async {
    Map<String, String> header = {};
    header.addAll({"Content-Type": "application/x-www-form-urlencoded"});
    if (token != null) {
      header.addAll({"Authorization": "Bearer $token"});
    }
    log('url : $url body : $body token : $token');
    http.Response response =
        await http.put(Uri.parse(url), body: body, headers: header);
    if (response.statusCode == 200) {
      Map<String, dynamic> json = jsonDecode(response.body);
      log(json.toString());
      return json;
    } else {
      throw Exception(
          "there is an error in stateCode : ${response.statusCode} in ${response.body}");
    }
  }
}
