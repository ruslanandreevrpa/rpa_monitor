import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rpa_monitor/controllers/electroneek_controller.dart';
import 'package:rpa_monitor/controllers/navigation_controller.dart';
import 'package:rpa_monitor/routes/pages.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Get.put<ElectroNeekController>(ElectroNeekController());
  Get.put<NavigationController>(NavigationController());
  runApp(const RPAMonitorApp());
}

class RPAMonitorApp extends StatelessWidget {
  const RPAMonitorApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Монитор RPA',
      initialRoute: "/",
      getPages: AppPages.pages,
    );
  }
}
