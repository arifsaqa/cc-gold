import 'package:json_annotation/json_annotation.dart';
part 'phone_numbers.g.dart';

@JsonSerializable()
class PhoneNumberResponse {
  @JsonKey(name: "status")
  int status;
  @JsonKey(name: "data")
  List<String> phoneNumbers;

  PhoneNumberResponse({
    required this.status,
    required this.phoneNumbers,
  });
  factory PhoneNumberResponse.fromJson(Map<String, dynamic> json) =>
      _$PhoneNumberResponseFromJson(json);
  Map<String, dynamic> toJson() => _$PhoneNumberResponseToJson(this);
}
