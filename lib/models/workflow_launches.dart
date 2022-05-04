class WorkflowLaunches {
  List<WorkflowLaunchesList>? list;

  WorkflowLaunches({this.list});

  WorkflowLaunches.fromJson(Map<String, dynamic> json) {
    if (json['list'] != null) {
      list = <WorkflowLaunchesList>[];
      json['list'].forEach((v) {
        list!.add(WorkflowLaunchesList.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (list != null) {
      data['list'] = list!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class WorkflowLaunchesList {
  String? id;
  String? type;
  String? status;
  String? accountEmail;
  String? startedAt;
  String? completedAt;
  bool? logsEnabled;
  String? runnerId;

  WorkflowLaunchesList(
      {this.id,
      this.type,
      this.status,
      this.accountEmail,
      this.startedAt,
      this.completedAt,
      this.logsEnabled,
      this.runnerId});

  WorkflowLaunchesList.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    type = json['type'];
    status = json['status'];
    accountEmail = json['account_email'];
    startedAt = json['started_at'];
    completedAt = json['completed_at'];
    logsEnabled = json['logs_enabled'];
    runnerId = json['runner_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['type'] = type;
    data['status'] = status;
    data['account_email'] = accountEmail;
    data['started_at'] = startedAt;
    data['completed_at'] = completedAt;
    data['logs_enabled'] = logsEnabled;
    data['runner_id'] = runnerId;
    return data;
  }
}
