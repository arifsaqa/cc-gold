// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) {
  return User(
    name: json['name'] as String,
    isVerified: json['isVerified'] as int,
    phone: json['phone'] as String,
    email: json['email'] as String,
    id: json['id'] as int,
    image: json['image'] as String,
    role: json['role'] as int,
    deviceId: json['deviceId'] as String,
    createdAt: json['created_at'] as String,
    updatedAt: json['updated_at'] as String,
  );
}

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'email': instance.email,
      'phone': instance.phone,
      'image': instance.image,
      'role': instance.role,
      'isVerified': instance.isVerified,
      'deviceId': instance.deviceId,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
    };
