// lib/shared/models/project.dart
import 'package:freezed_annotation/freezed_annotation.dart';

part 'project.freezed.dart';
part 'project.g.dart';

@freezed
class Project with _$Project {
  const factory Project({
    required String id,
    required String title,
    required String description,
    required double targetAmount,
    @Default(0.0) double currentAmount,
    required String adminId,
    @Default([]) List<String> imageUrls,
    String? category,
    @Default([]) List<String> tags,
    @Default(ProjectStatus.active) ProjectStatus status,
    DateTime? startDate,
    DateTime? endDate,
    DateTime? createdAt,
    DateTime? updatedAt,
    @Default([]) List<ProjectUpdate> updates,
    @Default(0) int contributorCount,
    String? location,
    @Default(false) bool isFeatured,
  }) = _Project;

  factory Project.fromJson(Map<String, dynamic> json) => _$ProjectFromJson(json);
}

@freezed
class ProjectUpdate with _$ProjectUpdate {
  const factory ProjectUpdate({
    required String id,
    required String title,
    required String content,
    @Default([]) List<String> imageUrls,
    required DateTime createdAt,
    required String adminId,
  }) = _ProjectUpdate;

  factory ProjectUpdate.fromJson(Map<String, dynamic> json) => _$ProjectUpdateFromJson(json);
}

enum ProjectStatus {
  @JsonValue('active')
  active,
  @JsonValue('completed')
  completed,
  @JsonValue('paused')
  paused,
  @JsonValue('cancelled')
  cancelled,
}