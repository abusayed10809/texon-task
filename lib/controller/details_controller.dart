import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:friends_app/model/friends_list_model.dart';
import 'package:friends_app/repository/friends_repository.dart';
import 'package:get/get.dart';

class EnemyController extends GetxController {
  // final FriendsRepository friendsRepository = FriendsRepository();
  // RxBool isFriendsListLoading = false.obs;
  // RxList friendsList = List<FriendModel>.empty(growable: true).obs;
  // RxString errorMessage = ''.obs;
  // late int currentPage = 1;
  // RxBool loadingMore = false.obs;
  //
  // ScrollController scrollController = ScrollController();

  Rx<FriendModel> enemyFriendModel = FriendModel().obs;

  @override
  void onInit() {
    super.onInit();
  }

  setFriendDetailsModel({required FriendModel newFriendModel}){
    enemyFriendModel.value = newFriendModel;
  }
}
