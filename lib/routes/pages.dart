import 'package:get/get.dart';
import 'package:rpa_monitor/ui/home_ui.dart';

abstract class AppPages {
  static final pages = [GetPage(name: "/", page: () => HomeUI())];
}
