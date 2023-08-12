// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:friends_app/api_services/api_service.dart';

import 'package:friends_app/main.dart';
import 'package:friends_app/model/friends_list_model.dart';
import 'package:friends_app/repository/friends_repository.dart';

void main() {
  test('service test', () async {
    ApiService apiService = ApiService();

    final response = await apiService.getResponse(url: 'https://randomuser.me/api/?results=10');

    print(response.toString());
  });

  test('repository test', () async {
    FriendsRepository friendsRepository = FriendsRepository();

    final Either<String, List<FriendModel>> either = await friendsRepository.fetchPostList(page: 1);

    either.fold(
      (l) {
        print('repository error : $l');
      },
      (r) {
        print('repository success : $r');
      },
    );
  });
}
