import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_icons/line_icons.dart';
import 'package:rpa_monitor/controllers/electroneek_controller.dart';
import 'package:rpa_monitor/controllers/navigation_controller.dart';
import 'package:rpa_monitor/ui/bot_runners_ui.dart';
import 'package:rpa_monitor/ui/dashboard_ui.dart';
import 'package:rpa_monitor/ui/profile_ui.dart';
import 'package:rpa_monitor/ui/settings_ui.dart';
import 'package:rpa_monitor/ui/workflows_ui.dart';

class HomeUI extends StatelessWidget {
  final ElectroNeekController _electroneekController = ElectroNeekController.to;
  final NavigationController _navigationController = NavigationController.to;

  final List _pages = [
    DashboardUI(),
    WorkflowsUI(),
    BotRunnersUI(),
    SettingsUI(),
    ProfileUI()
  ];

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: const Text('Монитор RPA'),
            centerTitle: true,
            elevation: 0,
          ),
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: _navigationController.currentPage.value,
            elevation: 0,
            selectedItemColor: Colors.blue,
            unselectedItemColor: Colors.grey,
            type: BottomNavigationBarType.fixed,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(LineIcons.thLarge),
                label: 'Обзор',
              ),
              BottomNavigationBarItem(
                icon: Icon(LineIcons.projectDiagram),
                label: 'Процессы',
              ),
              BottomNavigationBarItem(
                icon: Icon(LineIcons.robot),
                label: 'Бот-раннеры',
              ),
              BottomNavigationBarItem(
                icon: Icon(LineIcons.cog),
                label: 'Настройки',
              ),
              BottomNavigationBarItem(
                icon: Icon(LineIcons.user),
                label: 'Профиль',
              ),
            ],
            onTap: (int index) => _navigationController.changePage(index),
          ),
          body: Obx(
              () => _pages.elementAt(_navigationController.currentPage.value)),
        ),
      ),
    );
  }
}
