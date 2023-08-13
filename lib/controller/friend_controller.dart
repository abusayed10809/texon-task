import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:friends_app/model/friends_list_model.dart';
import 'package:friends_app/repository/friends_repository.dart';
import 'package:get/get.dart';

class FriendController extends GetxController {
  final FriendsRepository friendsRepository = FriendsRepository();
  RxBool isFriendsListLoading = false.obs;
  RxList friendsList = List<FriendModel>.empty(growable: true).obs;
  RxString errorMessage = ''.obs;
  Rx<FriendModel> friendModel = FriendModel().obs;
  late int currentPage = 1;
  RxBool loadingMore = false.obs;

  ScrollController scrollController = ScrollController();

  @override
  void onInit() {
    print('init method called');
    getFriendsList();

    setupScrollController();

    super.onInit();
  }

  void setupScrollController() {
    scrollController.addListener(() {
      if(scrollController.position.pixels == scrollController.position.maxScrollExtent){
        loadingMore.value = true;
        currentPage++;
        getFriendsList();
      }
    });
  }

  getFriendsList() async {
    isFriendsListLoading.value = true;

    Either<String, List<FriendModel>> either = await friendsRepository.fetchFriendsList(page: currentPage);

    either.fold(
      (errorMessage) {
        errorMessage = errorMessage;
      },
      (friendsListData) {
        friendsList.addAll(friendsListData);
      },
    );

    isFriendsListLoading.value = false;
    loadingMore.value = false;
  }

  setFriendDetailsModel({required FriendModel newFriendModel}){
    friendModel.value = newFriendModel;
  }
}
