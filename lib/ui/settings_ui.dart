import 'package:flutter/material.dart';
import 'package:rpa_monitor/controllers/electroneek_controller.dart';

class SettingsUI extends StatelessWidget {
  final ElectroNeekController _electronController = ElectroNeekController.to;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Страница Настройки'),
    );
  }
}
