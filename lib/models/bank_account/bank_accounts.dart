// {
//     "status": 1,
//     "data": [
//         {
//             "id": 1,
//             "userId": 1,
//             "numberAccount": "01298187218219",
//             "created_at": "2021-08-02 11:33:31",
//             "updated_at": "2021-08-02 11:33:31"
//         }
//     ]
// }
import 'package:json_annotation/json_annotation.dart';
import 'package:learnUI/models/bank_account/bank_account.dart';

part 'bank_accounts.g.dart';

@JsonSerializable()
class BankAccounts {
  @JsonKey(name: "status")
  int status;

  @JsonKey(name: "data")
  List<BankAccount>? bankAccounts;

  BankAccounts({required this.status, required this.bankAccounts});
  factory BankAccounts.fromJson(Map<String, dynamic> json) =>
      _$BankAccountsFromJson(json);
  Map<String, dynamic> toJson() => _$BankAccountsToJson(this);
}
