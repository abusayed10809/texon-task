// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:friends_app/api_services/api_service.dart';

import 'package:friends_app/main.dart';

void main() {
  test('api test', () async {
    ApiService apiService = ApiService();

    final response = await apiService.getResponse(url: 'https://randomuser.me/api/?results=10');

    print(response.toString());
  });
}
