import 'package:friends_app/view/friend_details/friend_details_screen.dart';
import 'package:friends_app/view/friends_list/friends_list_screen.dart';
import 'package:get/get.dart';

import 'app_routes.dart';

class AppPages {
  static var list = [
    GetPage(
      name: AppRoutes.friendsListScreen,
      page: () => const FriendsListScreen(),
    ),
    GetPage(
      name: AppRoutes.friendDetailsScreen,
      page: () => const FriendDetailsScreen(),
    ),
  ];
}