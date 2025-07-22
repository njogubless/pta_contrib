// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'event.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Event _$EventFromJson(Map<String, dynamic> json) => _Event(
  id: json['id'] as String,
  title: json['title'] as String,
  description: json['description'] as String,
  startDate: DateTime.parse(json['startDate'] as String),
  endDate: DateTime.parse(json['endDate'] as String),
  location: json['location'] as String?,
  organizerId: json['organizerId'] as String,
  attendeeIds:
      (json['attendeeIds'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList() ??
      const [],
  projectId: json['projectId'] as String?,
  type:
      $enumDecodeNullable(_$EventTypeEnumMap, json['type']) ??
      EventType.general,
  status:
      $enumDecodeNullable(_$EventStatusEnumMap, json['status']) ??
      EventStatus.upcoming,
  imageUrls:
      (json['imageUrls'] as List<dynamic>?)?.map((e) => e as String).toList() ??
      const [],
  meetingLink: json['meetingLink'] as String?,
  createdAt: DateTime.parse(json['createdAt'] as String),
  updatedAt: json['updatedAt'] == null
      ? null
      : DateTime.parse(json['updatedAt'] as String),
);

Map<String, dynamic> _$EventToJson(_Event instance) => <String, dynamic>{
  'id': instance.id,
  'title': instance.title,
  'description': instance.description,
  'startDate': instance.startDate.toIso8601String(),
  'endDate': instance.endDate.toIso8601String(),
  'location': instance.location,
  'organizerId': instance.organizerId,
  'attendeeIds': instance.attendeeIds,
  'projectId': instance.projectId,
  'type': _$EventTypeEnumMap[instance.type]!,
  'status': _$EventStatusEnumMap[instance.status]!,
  'imageUrls': instance.imageUrls,
  'meetingLink': instance.meetingLink,
  'createdAt': instance.createdAt.toIso8601String(),
  'updatedAt': instance.updatedAt?.toIso8601String(),
};

const _$EventTypeEnumMap = {
  EventType.general: 'general',
  EventType.projectRelated: 'project_related',
  EventType.fundraising: 'fundraising',
  EventType.meeting: 'meeting',
};

const _$EventStatusEnumMap = {
  EventStatus.upcoming: 'upcoming',
  EventStatus.ongoing: 'ongoing',
  EventStatus.completed: 'completed',
  EventStatus.cancelled: 'cancelled',
};

_PrayerSchedule _$PrayerScheduleFromJson(Map<String, dynamic> json) =>
    _PrayerSchedule(
      id: json['id'] as String,
      userId: json['userId'] as String,
      day: $enumDecode(_$PrayerDayEnumMap, json['day']),
      assignedDate: DateTime.parse(json['assignedDate'] as String),
      status:
          $enumDecodeNullable(_$PrayerStatusEnumMap, json['status']) ??
          PrayerStatus.assigned,
      notes: json['notes'] as String?,
      completedAt: json['completedAt'] == null
          ? null
          : DateTime.parse(json['completedAt'] as String),
      createdAt: DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$PrayerScheduleToJson(_PrayerSchedule instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'day': _$PrayerDayEnumMap[instance.day]!,
      'assignedDate': instance.assignedDate.toIso8601String(),
      'status': _$PrayerStatusEnumMap[instance.status]!,
      'notes': instance.notes,
      'completedAt': instance.completedAt?.toIso8601String(),
      'createdAt': instance.createdAt.toIso8601String(),
    };

const _$PrayerDayEnumMap = {
  PrayerDay.monday: 'monday',
  PrayerDay.tuesday: 'tuesday',
  PrayerDay.wednesday: 'wednesday',
  PrayerDay.thursday: 'thursday',
  PrayerDay.friday: 'friday',
  PrayerDay.saturday: 'saturday',
  PrayerDay.sunday: 'sunday',
};

const _$PrayerStatusEnumMap = {
  PrayerStatus.assigned: 'assigned',
  PrayerStatus.completed: 'completed',
  PrayerStatus.missed: 'missed',
};
