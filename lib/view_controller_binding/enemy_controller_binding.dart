import 'package:friends_app/controller/details_controller.dart';
import 'package:friends_app/controller/friend_controller.dart';
import 'package:get/get.dart';

class EnemyModelBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EnemyController>(
          () => EnemyController(),
    );
  }
}