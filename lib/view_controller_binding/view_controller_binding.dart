import 'package:friends_app/controller/friend_controller.dart';
import 'package:get/get.dart';

class ViewModelBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FriendController>(
      () => FriendController(),
    );
  }
}
