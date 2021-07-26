import 'dart:convert';

IsTokenValid isTokenValidFromJson(String str) =>
    IsTokenValid.fromJson(json.decode(str) as Map<String, dynamic>);

String isTokenValidToJson(IsTokenValid data) => json.encode(data.toJson());

class IsTokenValid {
  IsTokenValid({
    this.message,
    this.status,
  });

  dynamic message;
  dynamic status;

  factory IsTokenValid.fromJson(Map<String, dynamic> json) => IsTokenValid(
        message: json["message"] as String,
        status: json["status"] as int,
      );

  Map<String, dynamic> toJson() => <String, dynamic>{
        "message": message,
        "status": status,
      };
}
