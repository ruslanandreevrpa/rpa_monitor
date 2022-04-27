class BotRunners {
  List<BotList>? list;

  BotRunners({this.list});

  BotRunners.fromJson(Map<String, dynamic> json) {
    if (json['list'] != null) {
      list = <BotList>[];
      json['list'].forEach((v) {
        list!.add(BotList.fromJson(v));
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

class BotList {
  String? hostName;
  String? id;
  LoginAs? loginAs;
  String? name;
  String? status;
  String? version;

  BotList(
      {this.hostName,
      this.id,
      this.loginAs,
      this.name,
      this.status,
      this.version});

  BotList.fromJson(Map<String, dynamic> json) {
    hostName = json['host_name'];
    id = json['id'];
    loginAs =
        json['login_as'] != null ? LoginAs.fromJson(json['login_as']) : null;
    name = json['name'];
    status = json['status'];
    version = json['version'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['host_name'] = hostName;
    data['id'] = id;
    if (loginAs != null) {
      data['login_as'] = loginAs!.toJson();
    }
    data['name'] = name;
    data['status'] = status;
    data['version'] = version;
    return data;
  }
}

class LoginAs {
  String? type;
  String? value;

  LoginAs({this.type, this.value});

  LoginAs.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    value = json['value'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['type'] = type;
    data['value'] = value;
    return data;
  }
}
