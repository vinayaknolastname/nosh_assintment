import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:nosh_assintment/services/connectivity/internet_service.dart';

class BaseHttpService {
  static final BaseHttpService _default = BaseHttpService._internal();

  factory BaseHttpService() {
    return _default;
  }

  BaseHttpService._internal();

  Future<http.Response> getRequest(String endpoint) async {
    final response = await http.get(Uri.parse('$endpoint'));
    _handleResponse(response);

    return response;
  }

  Future<http.Response> postRequest(
      String endpoint, Map<String, dynamic> data) async {
    final response = await http.post(
      Uri.parse('$endpoint'),
      headers: _headers(),
      body: jsonEncode(data),
    );
    _handleResponse(response);
    return response;
  }

  Map<String, String> _headers() {
    return {
      'Content-Type': 'application/json',
    };
  }

  void _handleResponse(http.Response response) {
    if (response.statusCode < 200 || response.statusCode >= 300) {
      throw Exception('Error: ${response.reasonPhrase}');
    }
  }
}
