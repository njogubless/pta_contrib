// lib/shared/models/user.dart
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';
part 'user.g.dart';

@freezed
class User with _$User {
  const factory User({
    required String id,
    required String email,
    required String name,
    String? phoneNumber,
    String? profileImageUrl,
    @Default(UserRole.contributor) UserRole role,
    @Default([]) List<String> favoriteProjects,
    @Default(0.0) double totalContributed,
    @Default(0) int contributionCount,
    @Default([]) List<String> badges,
    String? selectedPrayerDay,
    DateTime? createdAt,
    DateTime? lastActive,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}

enum UserRole {
  @JsonValue('admin')
  admin,
  @JsonValue('contributor')
  contributor,
}