import 'package:flutter/material.dart';
import 'package:friends_app/controller/friend_controller.dart';
import 'package:friends_app/model/friends_list_model.dart';
import 'package:friends_app/routes/app_routes.dart';
import 'package:friends_app/view/friend_details/friend_details_screen.dart';
import 'package:get/get.dart';

class FriendsListScreen extends GetView<FriendController> {
  const FriendsListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: OrientationBuilder(builder: (context, orientation) {
          if (orientation == Orientation.portrait) {
            return Container(
              width: Get.width,
              height: Get.height,
              padding: EdgeInsets.symmetric(
                horizontal: Get.width * 0.025,
                vertical: Get.height * 0.02,
              ),
              child: Obx(
                () {
                  if (controller.friendsList.isNotEmpty) {
                    int friendItemCount = controller.friendsList.length;
                    if(controller.loadingMore.value){
                      friendItemCount+= 2;
                    }
                    return GridView.builder(
                      controller: controller.scrollController,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: Get.height * 0.02,
                        crossAxisSpacing: Get.width * 0.025,
                        mainAxisExtent: Get.height * 0.3,
                      ),
                      itemCount: friendItemCount,
                      itemBuilder: (context, index) {
                        if(controller.loadingMore.value && (index == friendItemCount-1 || index == friendItemCount-2)){
                          return const Center(child: CircularProgressIndicator());
                        }

                        FriendModel friendModel = controller.friendsList[index];
                        return GestureDetector(
                          onTap: (){
                            controller.setFriendDetailsModel(newFriendModel: friendModel);
                            Get.toNamed(AppRoutes.friendDetailsScreen);
                          },
                          child: Container(
                            width: Get.width * 0.4,
                            height: Get.height * 0.4,
                            color: Colors.grey[100],
                            child: Column(
                              children: [
                                ///
                                /// portrait
                                Image.network(
                                  friendModel.picture!.large ?? '',
                                  width: Get.width * 0.45,
                                  height: Get.height * 0.2,
                                  fit: BoxFit.cover,
                                ),

                                SizedBox(
                                  height: Get.height * 0.01,
                                ),

                                ///
                                /// full name
                                Text(
                                  ('${friendModel.name?.title} ' ?? '') + ('${friendModel.name?.first} ' ?? '') + ('${friendModel.name?.last}' ?? ''),
                                  style: TextStyle(
                                    fontSize: Get.textScaleFactor * 15,
                                  ),
                                ),

                                SizedBox(
                                  height: Get.height * 0.01,
                                ),

                                ///
                                /// country
                                Text(
                                  friendModel.location?.country ?? '',
                                  style: TextStyle(
                                    fontSize: Get.textScaleFactor * 15,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  } else if (controller.errorMessage.isNotEmpty) {
                    return Center(
                      child: Text(
                        controller.errorMessage.value,
                      ),
                    );
                  } else if (controller.isFriendsListLoading.value) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  return const SizedBox.shrink();
                },
              ),
            );
          } else {
            return Container(
              width: Get.width,
              height: Get.height,
              padding: EdgeInsets.symmetric(
                horizontal: Get.width * 0.025,
                vertical: Get.height * 0.02,
              ),
              child: Obx(
                () {
                  if (controller.friendsList.isNotEmpty) {
                    return GridView.builder(
                      controller: controller.scrollController,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: Get.height * 0.02,
                        crossAxisSpacing: Get.width * 0.025,
                        mainAxisExtent: Get.height * 0.5,
                      ),
                      itemCount: controller.friendsList.length,
                      itemBuilder: (context, index) {
                        FriendModel friendModel = controller.friendsList[index];
                        return GestureDetector(
                          onTap: (){
                            controller.setFriendDetailsModel(newFriendModel: friendModel);
                            Get.to(() => const FriendDetailsScreen());
                          },
                          child: Container(
                            width: Get.width * 0.4,
                            height: Get.height * 0.4,
                            color: Colors.grey[100],
                            child: Column(
                              children: [
                                ///
                                /// portrait
                                Image.network(
                                  friendModel.picture!.large ?? '',
                                  width: Get.width * 0.45,
                                  height: Get.height * 0.35,
                                  fit: BoxFit.cover,
                                ),

                                SizedBox(
                                  height: Get.height * 0.01,
                                ),

                                ///
                                /// full name
                                Text(
                                  ('${friendModel.name?.title} ' ?? '') + ('${friendModel.name?.first} ' ?? '') + ('${friendModel.name?.last}' ?? ''),
                                  style: TextStyle(
                                    fontSize: Get.textScaleFactor * 15,
                                  ),
                                ),

                                SizedBox(
                                  height: Get.height * 0.01,
                                ),

                                ///
                                /// country
                                Text(
                                  friendModel.location?.country ?? '',
                                  style: TextStyle(
                                    fontSize: Get.textScaleFactor * 15,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  } else if (controller.errorMessage.isNotEmpty) {
                    return Center(
                      child: Text(
                        controller.errorMessage.value,
                      ),
                    );
                  } else if (controller.isFriendsListLoading.value) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  return const SizedBox.shrink();
                },
              ),
            );
          }
        }),
      ),
    );
  }
}
