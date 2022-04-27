class Workflow {
  String? id;
  String? name;
  String? description;
  AssignedRunners? assignedRunners;

  Workflow({this.id, this.name, this.description, this.assignedRunners});

  Workflow.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    assignedRunners = json['assigned_runners'] != null
        ? AssignedRunners.fromJson(json['assigned_runners'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['description'] = description;
    if (assignedRunners != null) {
      data['assigned_runners'] = assignedRunners!.toJson();
    }
    return data;
  }
}

class AssignedRunners {
  String? id;
  String? name;
  String? hostName;

  AssignedRunners({this.id, this.name, this.hostName});

  AssignedRunners.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    hostName = json['host_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['host_name'] = hostName;
    return data;
  }
}
