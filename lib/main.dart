import 'package:flutter/material.dart';
import 'package:friends_app/routes/app_pages.dart';
import 'package:friends_app/routes/app_routes.dart';
import 'package:friends_app/view_controller_binding/view_controller_binding.dart';
import 'package:get/get.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "MVVM with GetX",
      initialBinding: ViewModelBinding(),
      initialRoute: AppRoutes.friendsListScreen,
      getPages: AppPages.list,
    );
  }
}
