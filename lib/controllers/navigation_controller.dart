import 'package:get/get.dart';

class NavigationController extends GetxController {
  static NavigationController to = Get.find();

  RxInt currentPage = 0.obs;

  void changePage(int page) {
    currentPage.value = page;
  }
}
