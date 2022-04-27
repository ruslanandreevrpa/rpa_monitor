import 'assigned_workflow.dart';
import 'login_as.dart';

class BotRunner {
  String? hostName;
  String? id;
  LoginAs? loginAs;
  String? name;
  String? status;
  String? version;
  String? statusSince;
  List<AssignedWorkflow>? assignedWorkflows;
  String? type;

  BotRunner({
    this.hostName,
    this.id,
    this.loginAs,
    this.name,
    this.status,
    this.version,
    this.statusSince,
    this.assignedWorkflows,
    this.type,
  });

  factory BotRunner.fromJson(Map<String, dynamic> json) => BotRunner(
        hostName: json['host_name'] as String?,
        id: json['id'] as String?,
        loginAs: json['login_as'] == null
            ? null
            : LoginAs.fromJson(json['login_as'] as Map<String, dynamic>),
        name: json['name'] as String?,
        status: json['status'] as String?,
        version: json['version'] as String?,
        statusSince: json['status_since'] as String?,
        assignedWorkflows: (json['assigned_workflows'] as List<dynamic>?)
            ?.map((e) => AssignedWorkflow.fromJson(e as Map<String, dynamic>))
            .toList(),
        type: json['type'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'host_name': hostName,
        'id': id,
        'login_as': loginAs?.toJson(),
        'name': name,
        'status': status,
        'version': version,
        'status_since': statusSince,
        'assigned_workflows':
            assignedWorkflows?.map((e) => e.toJson()).toList(),
        'type': type,
      };
}
