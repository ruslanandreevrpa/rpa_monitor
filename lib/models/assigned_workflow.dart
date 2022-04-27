class AssignedWorkflow {
  String? id;
  String? name;
  String? description;

  AssignedWorkflow({this.id, this.name, this.description});

  factory AssignedWorkflow.fromJson(Map<String, dynamic> json) {
    return AssignedWorkflow(
      id: json['id'] as String?,
      name: json['name'] as String?,
      description: json['description'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'description': description,
      };
}
