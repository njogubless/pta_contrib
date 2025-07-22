// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_User _$UserFromJson(Map<String, dynamic> json) => _User(
  id: json['id'] as String,
  email: json['email'] as String,
  name: json['name'] as String,
  phoneNumber: json['phoneNumber'] as String?,
  profileImageUrl: json['profileImageUrl'] as String?,
  role:
      $enumDecodeNullable(_$UserRoleEnumMap, json['role']) ??
      UserRole.contributor,
  favoriteProjects:
      (json['favoriteProjects'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList() ??
      const [],
  totalContributed: (json['totalContributed'] as num?)?.toDouble() ?? 0.0,
  contributionCount: (json['contributionCount'] as num?)?.toInt() ?? 0,
  badges:
      (json['badges'] as List<dynamic>?)?.map((e) => e as String).toList() ??
      const [],
  selectedPrayerDay: json['selectedPrayerDay'] as String?,
  createdAt: json['createdAt'] == null
      ? null
      : DateTime.parse(json['createdAt'] as String),
  lastActive: json['lastActive'] == null
      ? null
      : DateTime.parse(json['lastActive'] as String),
);

Map<String, dynamic> _$UserToJson(_User instance) => <String, dynamic>{
  'id': instance.id,
  'email': instance.email,
  'name': instance.name,
  'phoneNumber': instance.phoneNumber,
  'profileImageUrl': instance.profileImageUrl,
  'role': _$UserRoleEnumMap[instance.role]!,
  'favoriteProjects': instance.favoriteProjects,
  'totalContributed': instance.totalContributed,
  'contributionCount': instance.contributionCount,
  'badges': instance.badges,
  'selectedPrayerDay': instance.selectedPrayerDay,
  'createdAt': instance.createdAt?.toIso8601String(),
  'lastActive': instance.lastActive?.toIso8601String(),
};

const _$UserRoleEnumMap = {
  UserRole.admin: 'admin',
  UserRole.contributor: 'contributor',
};
