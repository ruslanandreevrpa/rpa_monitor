class Workflows {
  List<WorkflowList>? list;

  Workflows({this.list});

  Workflows.fromJson(Map<String, dynamic> json) {
    if (json['list'] != null) {
      list = <WorkflowList>[];
      json['list'].forEach((v) {
        list!.add(WorkflowList.fromJson(v));
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

class WorkflowList {
  String? id;
  String? name;
  String? description;

  WorkflowList({this.id, this.name, this.description});

  WorkflowList.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['description'] = description;
    return data;
  }
}
