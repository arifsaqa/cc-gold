import 'package:json_annotation/json_annotation.dart';
import 'transaction.dart';
part 'transactions.g.dart';

@JsonSerializable()
class Transactions {
  @JsonKey(name: 'status')
  int status;

  @JsonKey(name: 'data')
  List<Transaction> data;

  Transactions({required this.status, required this.data});

  factory Transactions.fromJson(Map<String, dynamic> json) =>
      _$TransactionsFromJson(json);
  Map<String, dynamic> toJson() => _$TransactionsToJson(this);
}
