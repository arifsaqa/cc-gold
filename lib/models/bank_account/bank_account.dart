// {
//           "id": 1,
//           "userId": 1,
//           "numberAccount": "01298187218219",
//           "created_at": "2021-08-02 11:33:31",
//           "updated_at": "2021-08-02 11:33:31"
//       }
import 'package:json_annotation/json_annotation.dart';

part 'bank_account.g.dart';

@JsonSerializable()
class BankAccount {
  @JsonKey(name: "id")
  int id;

  @JsonKey(name: "userId")
  int userId;

  @JsonKey(name: "numberAccount")
  String numberAccount;

  @JsonKey(name: "created_at")
  String createdAt;

  @JsonKey(name: "updated_at")
  String updatedAt;

  BankAccount(
      {required this.id,
      required this.userId,
      required this.numberAccount,
      required this.createdAt,
      required this.updatedAt});
  DateTime? get getCreateAt => DateTime.tryParse(createdAt);
  DateTime? get getUpdateAt => DateTime.tryParse(updatedAt);
  factory BankAccount.fromJson(Map<String, dynamic> json) =>
      _$BankAccountFromJson(json);
  Map<String, dynamic> toJson() => _$BankAccountToJson(this);
}
