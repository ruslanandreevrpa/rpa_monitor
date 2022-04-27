class LoginAs {
  String? type;
  String? value;

  LoginAs({this.type, this.value});

  factory LoginAs.fromJson(Map<String, dynamic> json) => LoginAs(
        type: json['type'] as String?,
        value: json['value'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'type': type,
        'value': value,
      };
}
