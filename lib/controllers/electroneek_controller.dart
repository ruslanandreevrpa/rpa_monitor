import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:rpa_monitor/models/bot_runner.dart';
import 'package:rpa_monitor/models/bot_runner_launches.dart';
import 'package:rpa_monitor/models/bot_runners.dart';
import 'package:rpa_monitor/models/workflow.dart';
import 'package:rpa_monitor/models/workflow_launches.dart';
import 'package:rpa_monitor/models/workflows.dart';

class ElectroNeekController extends GetxController {
  static ElectroNeekController to = Get.find();

  final String _baseURL = 'https://api.cis.electroneek.com/v1/orchestrator/';
  final String _authorization = 'Api-Key 7Y7BPPH9zbH79aduSgNUN8ykJDFNCSxY';

  Rxn<BotRunners> botRunners = Rxn<BotRunners>();
  Rxn<BotRunner> botRunner = Rxn<BotRunner>();

  @override
  void onReady() {
    super.onReady();
  }

  void getBotRunners() async {
    fetchBotRunners().then((value) => botRunners.value = value).catchError((e) {
      print(e);
    });
  }

  Future<BotRunners> fetchBotRunners() async {
    final response = await http.get(Uri.parse('$_baseURL/bot-runners'),
        headers: {'Authorization': _authorization});

    if (response.statusCode == 200) {
      return BotRunners.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Ошибка получения данных');
    }
  }

  Future<BotRunner> fetchBotRunner(String? id) async {
    final response = await http.get(Uri.parse('$_baseURL/bot-runner/$id'),
        headers: {'Authorization': _authorization});

    if (response.statusCode == 200) {
      botRunner.value = BotRunner.fromJson(jsonDecode(response.body));
      return BotRunner.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Ошибка получения данных');
    }
  }

  Future<BotRunnerLaunches> fetchBotRunnerLaunches(String? id) async {
    final response = await http.get(
        Uri.parse('$_baseURL/bot-runner/$id/launches'),
        headers: {'Authorization': _authorization});

    if (response.statusCode == 200) {
      return BotRunnerLaunches.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Ошибка получения данных');
    }
  }

  Future<Workflows> fetchWorkflowsList() async {
    final response = await http.get(Uri.parse('$_baseURL/workflows'),
        headers: {'Authorization': _authorization});

    if (response.statusCode == 200) {
      return Workflows.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Ошибка получения данных');
    }
  }

  Future<Workflow> fetchWorkflow(String? id) async {
    final response = await http.get(Uri.parse('$_baseURL/workflow/$id'),
        headers: {'Authorization': _authorization});

    if (response.statusCode == 200) {
      return Workflow.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Ошибка получения данных');
    }
  }

  Future<WorkflowLaunches> fetchWorkflowLaunches(String? id) async {
    final response = await http.get(
        Uri.parse('$_baseURL/workflow/$id/launches'),
        headers: {'Authorization': _authorization});

    if (response.statusCode == 200) {
      return WorkflowLaunches.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Ошибка получения данных');
    }
  }
}
