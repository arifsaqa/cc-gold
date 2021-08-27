import 'package:json_annotation/json_annotation.dart';
import 'transaction.dart';
part 'transactionResponse.g.dart';

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
class TransactionResponse {
  @JsonKey(name: 'status')
  int status;

  @JsonKey(name: 'data')
  Transaction data;

  TransactionResponse({required this.status, required this.data});

  factory TransactionResponse.fromJson(Map<String, dynamic> json) =>
      _$TransactionResponseFromJson(json);
  Map<String, dynamic> toJson() => _$TransactionResponseToJson(this);
}
