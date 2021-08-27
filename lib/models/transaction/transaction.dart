import 'package:json_annotation/json_annotation.dart';

part 'transaction.g.dart';

//     "status": 1,
//     "data": {
//         "userId": "4",
//         "payment": 1,
//         "type": 1,
//         "gram": 1,
//         "adminFee": 0,
//         "priceId": 1,
//         "nominal": 111,
//         "status": false,
//         "discount": 0,
//         "destinationNumber": null,
//         "message": null,
//         "barcode": "Asklja",
//         "updated_at": "2021-08-25T21:32:11.000000Z",
//         "created_at": "2021-08-25T21:32:11.000000Z",
//         "id": 72
//     }
// }
@JsonSerializable()
class Transaction {
  @JsonKey(name: 'id')
  int id;

  @JsonKey(name: 'userId')
  int userId;

  @JsonKey(name: 'type')
  int type;

  @JsonKey(name: 'gram')
  int gram;

  @JsonKey(name: 'payment')
  int payment;

  @JsonKey(name: 'priceId')
  int priceId;

  @JsonKey(name: 'adminFee')
  int adminFee;

  @JsonKey(name: 'nominal')
  int nominal;

  @JsonKey(name: 'status')
  int status;

  @JsonKey(name: 'discount')
  int discount;

  @JsonKey(name: 'barcode')
  String barcode;

  @JsonKey(name: 'destinationNumber')
  String? destinationNumber;

  @JsonKey(name: 'message')
  String? message;

  @JsonKey(name: 'created_at')
  String createdAt;

  @JsonKey(name: 'updated_at')
  String updatedAt;

  DateTime? get getCreateAt => DateTime.tryParse(createdAt);

  Transaction(
      {required this.id,
      required this.adminFee,
      required this.barcode,
      required this.discount,
      required this.gram,
      required this.payment,
      this.destinationNumber,
      this.message,
      required this.nominal,
      required this.type,
      required this.createdAt,
      required this.priceId,
      required this.status,
      required this.updatedAt,
      required this.userId});

  factory Transaction.fromJson(Map<String, dynamic> json) =>
      _$TransactionFromJson(json);
  Map<String, dynamic> toJson() => _$TransactionToJson(this);
}
