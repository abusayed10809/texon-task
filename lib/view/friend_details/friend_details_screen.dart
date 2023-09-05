import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:friends_app/controller/details_controller.dart';
import 'package:friends_app/controller/friend_controller.dart';
import 'package:friends_app/model/friends_list_model.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class FriendDetailsScreen extends GetView<EnemyController> {
  const FriendDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: OrientationBuilder(
          builder: (context, orientation) {
            if(orientation == Orientation.portrait){
              return Container(
                width: Get.width,
                height: Get.height,
                padding: EdgeInsets.symmetric(
                  horizontal: Get.width * 0.025,
                  vertical: Get.height * 0.02,
                ),
                child: Obx(
                      () {
                    FriendModel friendModel = controller.enemyFriendModel.value;
                    return Column(
                      children: [
                        ///
                        /// image
                        Image.network(
                          friendModel.picture!.large ?? '',
                          width: Get.width,
                          height: Get.height * 0.6,
                          fit: BoxFit.cover,
                        ),

                        SizedBox(
                          height: Get.height * 0.01,
                        ),

                        ///
                        /// address
                        Text(
                          ('${friendModel.location?.city}, ' ?? '') + ('${friendModel.location?.state}, ' ?? '') + ('${friendModel.location?.country}, ' ?? ''),
                          style: TextStyle(
                            fontSize: Get.textScaleFactor * 20,
                          ),
                        ),

                        SizedBox(
                          height: Get.height * 0.02,
                        ),

                        ///
                        /// email
                        GestureDetector(
                          onTap: () async{
                            final Uri emailUri = Uri(
                              scheme: 'mailto',
                              path: friendModel.email,
                            );

                            try{
                              await launchUrl(emailUri);
                            } catch(error){
                              if (kDebugMode) {
                                print('cannot launch uri: $error');
                              }
                            }
                          },
                          child: Container(
                            color: Colors.grey[400],
                            width: Get.width,
                            height: Get.height * 0.07,
                            child: Row(
                              children: [
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: Get.width * 0.03,
                                  ),
                                  child: const Icon(
                                    Icons.email,
                                  ),
                                ),
                                Text(
                                  friendModel.email ?? '',
                                ),
                              ],
                            ),
                          ),
                        ),

                        SizedBox(
                          height: Get.height * 0.02,
                        ),

                        ///
                        /// phone number
                        Container(
                          color: Colors.grey[400],
                          width: Get.width,
                          height: Get.height * 0.07,
                          child: Row(
                            children: [
                              Padding(
                                padding: EdgeInsets.symmetric(
                                  horizontal: Get.width * 0.03,
                                ),
                                child: const Icon(
                                  Icons.phone,
                                ),
                              ),
                              Text(
                                friendModel.phone ?? '',
                              ),
                            ],
                          ),
                        ),
                      ],
                    );
                  },
                ),
              );
            } else{
              return Container(
                width: Get.width,
                height: Get.height,
                padding: EdgeInsets.symmetric(
                  horizontal: Get.width * 0.025,
                  vertical: Get.height * 0.02,
                ),
                child: Obx(
                      () {
                    FriendModel friendModel = controller.enemyFriendModel.value;
                    return Column(
                      children: [
                        ///
                        /// image
                        Image.network(
                          friendModel.picture!.large ?? '',
                          width: Get.width,
                          height: Get.height * 0.6,
                          fit: BoxFit.cover,
                        ),

                        SizedBox(
                          height: Get.height * 0.01,
                        ),

                        ///
                        /// address
                        Text(
                          ('${friendModel.location?.city}, ' ?? '') + ('${friendModel.location?.state}, ' ?? '') + ('${friendModel.location?.country}, ' ?? ''),
                          style: TextStyle(
                            fontSize: Get.textScaleFactor * 20,
                          ),
                        ),

                        SizedBox(
                          height: Get.height * 0.02,
                        ),

                        ///
                        /// email
                        GestureDetector(
                          onTap: () async{
                            final Uri emailUri = Uri(
                              scheme: 'mailto',
                              path: friendModel.email,
                            );

                            try{
                              await launchUrl(emailUri);
                            } catch(error){
                              if (kDebugMode) {
                                print('cannot launch uri: $error');
                              }
                            }
                          },
                          child: Container(
                            color: Colors.grey[400],
                            width: Get.width,
                            height: Get.height * 0.07,
                            child: Row(
                              children: [
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: Get.width * 0.03,
                                  ),
                                  child: const Icon(
                                    Icons.email,
                                  ),
                                ),
                                Text(
                                  friendModel.email ?? '',
                                ),
                              ],
                            ),
                          ),
                        ),

                        SizedBox(
                          height: Get.height * 0.02,
                        ),

                        ///
                        /// phone number
                        Container(
                          color: Colors.grey[400],
                          width: Get.width,
                          height: Get.height * 0.07,
                          child: Row(
                            children: [
                              Padding(
                                padding: EdgeInsets.symmetric(
                                  horizontal: Get.width * 0.03,
                                ),
                                child: const Icon(
                                  Icons.phone,
                                ),
                              ),
                              Text(
                                friendModel.phone ?? '',
                              ),
                            ],
                          ),
                        ),
                      ],
                    );
                  },
                ),
              );
            }
          }
        ),
      ),
    );
  }
}
