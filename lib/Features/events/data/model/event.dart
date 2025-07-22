// lib/shared/models/event.dart
import 'package:freezed_annotation/freezed_annotation.dart';

part 'event.freezed.dart';
part 'event.g.dart';

@freezed
class Event with _$Event {
  const factory Event({
    required String id,
    required String title,
    required String description,
    required DateTime startDate,
    required DateTime endDate,
    String? location,
    required String organizerId,
    @Default([]) List<String> attendeeIds,
    String? projectId,
    @Default(EventType.general) EventType type,
    @Default(EventStatus.upcoming) EventStatus status,
    @Default([]) List<String> imageUrls,
    String? meetingLink,
    required DateTime createdAt,
    DateTime? updatedAt,
  }) = _Event;

  factory Event.fromJson(Map<String, dynamic> json) => _$EventFromJson(json);
}

@freezed
class PrayerSchedule with _$PrayerSchedule {
  const factory PrayerSchedule({
    required String id,
    required String userId,
    required PrayerDay day,
    required DateTime assignedDate,
    @Default(PrayerStatus.assigned) PrayerStatus status,
    String? notes,
    DateTime? completedAt,
    required DateTime createdAt,
  }) = _PrayerSchedule;

  factory PrayerSchedule.fromJson(Map<String, dynamic> json) => _$PrayerScheduleFromJson(json);
}

enum EventType {
  @JsonValue('general')
  general,
  @JsonValue('project_related')
  projectRelated,
  @JsonValue('fundraising')
  fundraising,
  @JsonValue('meeting')
  meeting,
}

enum EventStatus {
  @JsonValue('upcoming')
  upcoming,
  @JsonValue('ongoing')
  ongoing,
  @JsonValue('completed')
  completed,
  @JsonValue('cancelled')
  cancelled,
}

enum PrayerDay {
  @JsonValue('monday')
  monday,
  @JsonValue('tuesday')
  tuesday,
  @JsonValue('wednesday')
  wednesday,
  @JsonValue('thursday')
  thursday,
  @JsonValue('friday')
  friday,
  @JsonValue('saturday')
  saturday,
  @JsonValue('sunday')
  sunday,
}

enum PrayerStatus {
  @JsonValue('assigned')
  assigned,
  @JsonValue('completed')
  completed,
  @JsonValue('missed')
  missed,
}