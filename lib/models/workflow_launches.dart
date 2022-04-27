class WorkflowLaunches {
  List<WorkflowList>? list;

  WorkflowLaunches({this.list});

  WorkflowLaunches.fromJson(Map<String, dynamic> json) {
    if (json['list'] != null) {
      list = <WorkflowList>[];
      json['list'].forEach((v) {
        list!.add(new WorkflowList.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.list != null) {
      data['list'] = this.list!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class WorkflowList {
  String? id;
  String? type;
  String? status;
  String? accountEmail;
  String? startedAt;
  String? completedAt;
  bool? logsEnabled;
  String? runnerId;

  WorkflowList(
      {this.id,
      this.type,
      this.status,
      this.accountEmail,
      this.startedAt,
      this.completedAt,
      this.logsEnabled,
      this.runnerId});

  WorkflowList.fromJson(Map<String, dynamic> json) {
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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['type'] = this.type;
    data['status'] = this.status;
    data['account_email'] = this.accountEmail;
    data['started_at'] = this.startedAt;
    data['completed_at'] = this.completedAt;
    data['logs_enabled'] = this.logsEnabled;
    data['runner_id'] = this.runnerId;
    return data;
  }
}
