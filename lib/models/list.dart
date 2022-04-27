import 'login_as.dart';

class List {
  String? hostName;
  String? id;
  LoginAs? loginAs;
  String? name;
  String? status;
  String? version;

  List({
    this.hostName,
    this.id,
    this.loginAs,
    this.name,
    this.status,
    this.version,
  });

  factory List.fromJson(Map<String, dynamic> json) => List(
        hostName: json['host_name'] as String?,
        id: json['id'] as String?,
        loginAs: json['login_as'] == null
            ? null
            : LoginAs.fromJson(json['login_as'] as Map<String, dynamic>),
        name: json['name'] as String?,
        status: json['status'] as String?,
        version: json['version'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'host_name': hostName,
        'id': id,
        'login_as': loginAs?.toJson(),
        'name': name,
        'status': status,
        'version': version,
      };
}
