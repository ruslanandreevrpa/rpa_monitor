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
  Rxn<WorkflowLaunches> workflowLaunches = Rxn<WorkflowLaunches>();

  @override
  void onReady() {
    super.onReady();
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

  Future<Object> fetchWorkflowLaunches(String? id) async {
    var _workflowLaunches = await fetchWorkflowLaunchesLastTenMinutes(id);
    if (_workflowLaunches.length > 0) {
      return _workflowLaunches[0];
    }
    _workflowLaunches = await fetchWorkflowLaunchesLastHalfHour(id);
    if (_workflowLaunches.length > 0) {
      return _workflowLaunches[0];
    }
    _workflowLaunches = await fetchWorkflowLaunchesLastHour(id);
    if (_workflowLaunches.length > 0) {
      return _workflowLaunches[0];
    }
    _workflowLaunches = await fetchWorkflowLaunchesLastHalfDay(id);
    if (_workflowLaunches.length > 0) {
      return _workflowLaunches[0];
    }
    _workflowLaunches = await fetchWorkflowLaunchesLastDay(id);
    if (_workflowLaunches.length > 0) {
      return _workflowLaunches[0];
    }
    _workflowLaunches = await fetchWorkflowLaunchesUnknown(id);
    return _workflowLaunches[0];
  }

  Future<List<Object>> fetchWorkflowLaunchesLastTenMinutes(String? id) async {
    var today = DateTime.now();
    var lastTenMinutes = today.subtract(const Duration(minutes: 10)).toUtc().toString();
    final response = await http.get(
        Uri.parse('$_baseURL/workflow/$id/launches?started_from=$lastTenMinutes'),
        headers: {'Authorization': _authorization});

    if (response.statusCode == 200) {
      return WorkflowLaunches.fromJson(jsonDecode(response.body)).list!;
    } else {
      throw Exception('Ошибка получения данных');
    }
  }

  Future<List<Object>> fetchWorkflowLaunchesLastHalfHour(String? id) async {
    var today = DateTime.now();
    var lastHalfHour = today.subtract(const Duration(minutes: 30)).toUtc().toString();
    final response = await http.get(
        Uri.parse('$_baseURL/workflow/$id/launches?started_from=$lastHalfHour'),
        headers: {'Authorization': _authorization});

    if (response.statusCode == 200) {
      return WorkflowLaunches.fromJson(jsonDecode(response.body)).list!;
    } else {
      throw Exception('Ошибка получения данных');
    }
  }

  Future<List<Object>> fetchWorkflowLaunchesLastHour(String? id) async {
    var today = DateTime.now();
    var lastHour = today.subtract(const Duration(hours: 1)).toUtc().toString();
    final response = await http.get(
        Uri.parse('$_baseURL/workflow/$id/launches?started_from=$lastHour'),
        headers: {'Authorization': _authorization});

    if (response.statusCode == 200) {
      return WorkflowLaunches.fromJson(jsonDecode(response.body)).list!;
    } else {
      throw Exception('Ошибка получения данных');
    }
  }

  Future<List<Object>> fetchWorkflowLaunchesLastHalfDay(String? id) async {
    var today = DateTime.now();
    var lastHalfDay = today.subtract(const Duration(hours: 12)).toUtc().toString();
    final response = await http.get(
        Uri.parse('$_baseURL/workflow/$id/launches?started_from=$lastHalfDay'),
        headers: {'Authorization': _authorization});

    if (response.statusCode == 200) {
      return WorkflowLaunches.fromJson(jsonDecode(response.body)).list!;
    } else {
      throw Exception('Ошибка получения данных');
    }
  }

  Future<List<Object>> fetchWorkflowLaunchesLastDay(String? id) async {
    var today = DateTime.now();
    var lastDay = today.subtract(const Duration(hours: 24)).toUtc().toString();
    final response = await http.get(
        Uri.parse('$_baseURL/workflow/$id/launches?started_from=$lastDay'),
        headers: {'Authorization': _authorization});

    if (response.statusCode == 200) {
      return WorkflowLaunches.fromJson(jsonDecode(response.body)).list!;
    } else {
      throw Exception('Ошибка получения данных');
    }
  }

  Future<List<Object>> fetchWorkflowLaunchesAll(String? id) async {
    final response = await http.get(
        Uri.parse('$_baseURL/workflow/$id/launches'),
        headers: {'Authorization': _authorization});

    if (response.statusCode == 200) {
      return WorkflowLaunches.fromJson(jsonDecode(response.body)).list!;
    } else {
      throw Exception('Ошибка получения данных');
    }
  }

  Future<List<Object>> fetchWorkflowLaunchesUnknown(String? id) async {
    return WorkflowLaunches.fromJson({
      "list": [
        {
          "status": "unknown",
        }
      ]
    }).list!;
  }

}
