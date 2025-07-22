// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Event {

 String get id; String get title; String get description; DateTime get startDate; DateTime get endDate; String? get location; String get organizerId; List<String> get attendeeIds; String? get projectId; EventType get type; EventStatus get status; List<String> get imageUrls; String? get meetingLink; DateTime get createdAt; DateTime? get updatedAt;
/// Create a copy of Event
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$EventCopyWith<Event> get copyWith => _$EventCopyWithImpl<Event>(this as Event, _$identity);

  /// Serializes this Event to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Event&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.startDate, startDate) || other.startDate == startDate)&&(identical(other.endDate, endDate) || other.endDate == endDate)&&(identical(other.location, location) || other.location == location)&&(identical(other.organizerId, organizerId) || other.organizerId == organizerId)&&const DeepCollectionEquality().equals(other.attendeeIds, attendeeIds)&&(identical(other.projectId, projectId) || other.projectId == projectId)&&(identical(other.type, type) || other.type == type)&&(identical(other.status, status) || other.status == status)&&const DeepCollectionEquality().equals(other.imageUrls, imageUrls)&&(identical(other.meetingLink, meetingLink) || other.meetingLink == meetingLink)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,description,startDate,endDate,location,organizerId,const DeepCollectionEquality().hash(attendeeIds),projectId,type,status,const DeepCollectionEquality().hash(imageUrls),meetingLink,createdAt,updatedAt);

@override
String toString() {
  return 'Event(id: $id, title: $title, description: $description, startDate: $startDate, endDate: $endDate, location: $location, organizerId: $organizerId, attendeeIds: $attendeeIds, projectId: $projectId, type: $type, status: $status, imageUrls: $imageUrls, meetingLink: $meetingLink, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class $EventCopyWith<$Res>  {
  factory $EventCopyWith(Event value, $Res Function(Event) _then) = _$EventCopyWithImpl;
@useResult
$Res call({
 String id, String title, String description, DateTime startDate, DateTime endDate, String? location, String organizerId, List<String> attendeeIds, String? projectId, EventType type, EventStatus status, List<String> imageUrls, String? meetingLink, DateTime createdAt, DateTime? updatedAt
});




}
/// @nodoc
class _$EventCopyWithImpl<$Res>
    implements $EventCopyWith<$Res> {
  _$EventCopyWithImpl(this._self, this._then);

  final Event _self;
  final $Res Function(Event) _then;

/// Create a copy of Event
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? title = null,Object? description = null,Object? startDate = null,Object? endDate = null,Object? location = freezed,Object? organizerId = null,Object? attendeeIds = null,Object? projectId = freezed,Object? type = null,Object? status = null,Object? imageUrls = null,Object? meetingLink = freezed,Object? createdAt = null,Object? updatedAt = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,startDate: null == startDate ? _self.startDate : startDate // ignore: cast_nullable_to_non_nullable
as DateTime,endDate: null == endDate ? _self.endDate : endDate // ignore: cast_nullable_to_non_nullable
as DateTime,location: freezed == location ? _self.location : location // ignore: cast_nullable_to_non_nullable
as String?,organizerId: null == organizerId ? _self.organizerId : organizerId // ignore: cast_nullable_to_non_nullable
as String,attendeeIds: null == attendeeIds ? _self.attendeeIds : attendeeIds // ignore: cast_nullable_to_non_nullable
as List<String>,projectId: freezed == projectId ? _self.projectId : projectId // ignore: cast_nullable_to_non_nullable
as String?,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as EventType,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as EventStatus,imageUrls: null == imageUrls ? _self.imageUrls : imageUrls // ignore: cast_nullable_to_non_nullable
as List<String>,meetingLink: freezed == meetingLink ? _self.meetingLink : meetingLink // ignore: cast_nullable_to_non_nullable
as String?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [Event].
extension EventPatterns on Event {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Event value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Event() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Event value)  $default,){
final _that = this;
switch (_that) {
case _Event():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Event value)?  $default,){
final _that = this;
switch (_that) {
case _Event() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String title,  String description,  DateTime startDate,  DateTime endDate,  String? location,  String organizerId,  List<String> attendeeIds,  String? projectId,  EventType type,  EventStatus status,  List<String> imageUrls,  String? meetingLink,  DateTime createdAt,  DateTime? updatedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Event() when $default != null:
return $default(_that.id,_that.title,_that.description,_that.startDate,_that.endDate,_that.location,_that.organizerId,_that.attendeeIds,_that.projectId,_that.type,_that.status,_that.imageUrls,_that.meetingLink,_that.createdAt,_that.updatedAt);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String title,  String description,  DateTime startDate,  DateTime endDate,  String? location,  String organizerId,  List<String> attendeeIds,  String? projectId,  EventType type,  EventStatus status,  List<String> imageUrls,  String? meetingLink,  DateTime createdAt,  DateTime? updatedAt)  $default,) {final _that = this;
switch (_that) {
case _Event():
return $default(_that.id,_that.title,_that.description,_that.startDate,_that.endDate,_that.location,_that.organizerId,_that.attendeeIds,_that.projectId,_that.type,_that.status,_that.imageUrls,_that.meetingLink,_that.createdAt,_that.updatedAt);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String title,  String description,  DateTime startDate,  DateTime endDate,  String? location,  String organizerId,  List<String> attendeeIds,  String? projectId,  EventType type,  EventStatus status,  List<String> imageUrls,  String? meetingLink,  DateTime createdAt,  DateTime? updatedAt)?  $default,) {final _that = this;
switch (_that) {
case _Event() when $default != null:
return $default(_that.id,_that.title,_that.description,_that.startDate,_that.endDate,_that.location,_that.organizerId,_that.attendeeIds,_that.projectId,_that.type,_that.status,_that.imageUrls,_that.meetingLink,_that.createdAt,_that.updatedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Event implements Event {
  const _Event({required this.id, required this.title, required this.description, required this.startDate, required this.endDate, this.location, required this.organizerId, final  List<String> attendeeIds = const [], this.projectId, this.type = EventType.general, this.status = EventStatus.upcoming, final  List<String> imageUrls = const [], this.meetingLink, required this.createdAt, this.updatedAt}): _attendeeIds = attendeeIds,_imageUrls = imageUrls;
  factory _Event.fromJson(Map<String, dynamic> json) => _$EventFromJson(json);

@override final  String id;
@override final  String title;
@override final  String description;
@override final  DateTime startDate;
@override final  DateTime endDate;
@override final  String? location;
@override final  String organizerId;
 final  List<String> _attendeeIds;
@override@JsonKey() List<String> get attendeeIds {
  if (_attendeeIds is EqualUnmodifiableListView) return _attendeeIds;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_attendeeIds);
}

@override final  String? projectId;
@override@JsonKey() final  EventType type;
@override@JsonKey() final  EventStatus status;
 final  List<String> _imageUrls;
@override@JsonKey() List<String> get imageUrls {
  if (_imageUrls is EqualUnmodifiableListView) return _imageUrls;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_imageUrls);
}

@override final  String? meetingLink;
@override final  DateTime createdAt;
@override final  DateTime? updatedAt;

/// Create a copy of Event
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$EventCopyWith<_Event> get copyWith => __$EventCopyWithImpl<_Event>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$EventToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Event&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.startDate, startDate) || other.startDate == startDate)&&(identical(other.endDate, endDate) || other.endDate == endDate)&&(identical(other.location, location) || other.location == location)&&(identical(other.organizerId, organizerId) || other.organizerId == organizerId)&&const DeepCollectionEquality().equals(other._attendeeIds, _attendeeIds)&&(identical(other.projectId, projectId) || other.projectId == projectId)&&(identical(other.type, type) || other.type == type)&&(identical(other.status, status) || other.status == status)&&const DeepCollectionEquality().equals(other._imageUrls, _imageUrls)&&(identical(other.meetingLink, meetingLink) || other.meetingLink == meetingLink)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,description,startDate,endDate,location,organizerId,const DeepCollectionEquality().hash(_attendeeIds),projectId,type,status,const DeepCollectionEquality().hash(_imageUrls),meetingLink,createdAt,updatedAt);

@override
String toString() {
  return 'Event(id: $id, title: $title, description: $description, startDate: $startDate, endDate: $endDate, location: $location, organizerId: $organizerId, attendeeIds: $attendeeIds, projectId: $projectId, type: $type, status: $status, imageUrls: $imageUrls, meetingLink: $meetingLink, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$EventCopyWith<$Res> implements $EventCopyWith<$Res> {
  factory _$EventCopyWith(_Event value, $Res Function(_Event) _then) = __$EventCopyWithImpl;
@override @useResult
$Res call({
 String id, String title, String description, DateTime startDate, DateTime endDate, String? location, String organizerId, List<String> attendeeIds, String? projectId, EventType type, EventStatus status, List<String> imageUrls, String? meetingLink, DateTime createdAt, DateTime? updatedAt
});




}
/// @nodoc
class __$EventCopyWithImpl<$Res>
    implements _$EventCopyWith<$Res> {
  __$EventCopyWithImpl(this._self, this._then);

  final _Event _self;
  final $Res Function(_Event) _then;

/// Create a copy of Event
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? title = null,Object? description = null,Object? startDate = null,Object? endDate = null,Object? location = freezed,Object? organizerId = null,Object? attendeeIds = null,Object? projectId = freezed,Object? type = null,Object? status = null,Object? imageUrls = null,Object? meetingLink = freezed,Object? createdAt = null,Object? updatedAt = freezed,}) {
  return _then(_Event(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,startDate: null == startDate ? _self.startDate : startDate // ignore: cast_nullable_to_non_nullable
as DateTime,endDate: null == endDate ? _self.endDate : endDate // ignore: cast_nullable_to_non_nullable
as DateTime,location: freezed == location ? _self.location : location // ignore: cast_nullable_to_non_nullable
as String?,organizerId: null == organizerId ? _self.organizerId : organizerId // ignore: cast_nullable_to_non_nullable
as String,attendeeIds: null == attendeeIds ? _self._attendeeIds : attendeeIds // ignore: cast_nullable_to_non_nullable
as List<String>,projectId: freezed == projectId ? _self.projectId : projectId // ignore: cast_nullable_to_non_nullable
as String?,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as EventType,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as EventStatus,imageUrls: null == imageUrls ? _self._imageUrls : imageUrls // ignore: cast_nullable_to_non_nullable
as List<String>,meetingLink: freezed == meetingLink ? _self.meetingLink : meetingLink // ignore: cast_nullable_to_non_nullable
as String?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}


/// @nodoc
mixin _$PrayerSchedule {

 String get id; String get userId; PrayerDay get day; DateTime get assignedDate; PrayerStatus get status; String? get notes; DateTime? get completedAt; DateTime get createdAt;
/// Create a copy of PrayerSchedule
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PrayerScheduleCopyWith<PrayerSchedule> get copyWith => _$PrayerScheduleCopyWithImpl<PrayerSchedule>(this as PrayerSchedule, _$identity);

  /// Serializes this PrayerSchedule to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PrayerSchedule&&(identical(other.id, id) || other.id == id)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.day, day) || other.day == day)&&(identical(other.assignedDate, assignedDate) || other.assignedDate == assignedDate)&&(identical(other.status, status) || other.status == status)&&(identical(other.notes, notes) || other.notes == notes)&&(identical(other.completedAt, completedAt) || other.completedAt == completedAt)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,userId,day,assignedDate,status,notes,completedAt,createdAt);

@override
String toString() {
  return 'PrayerSchedule(id: $id, userId: $userId, day: $day, assignedDate: $assignedDate, status: $status, notes: $notes, completedAt: $completedAt, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class $PrayerScheduleCopyWith<$Res>  {
  factory $PrayerScheduleCopyWith(PrayerSchedule value, $Res Function(PrayerSchedule) _then) = _$PrayerScheduleCopyWithImpl;
@useResult
$Res call({
 String id, String userId, PrayerDay day, DateTime assignedDate, PrayerStatus status, String? notes, DateTime? completedAt, DateTime createdAt
});




}
/// @nodoc
class _$PrayerScheduleCopyWithImpl<$Res>
    implements $PrayerScheduleCopyWith<$Res> {
  _$PrayerScheduleCopyWithImpl(this._self, this._then);

  final PrayerSchedule _self;
  final $Res Function(PrayerSchedule) _then;

/// Create a copy of PrayerSchedule
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? userId = null,Object? day = null,Object? assignedDate = null,Object? status = null,Object? notes = freezed,Object? completedAt = freezed,Object? createdAt = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,day: null == day ? _self.day : day // ignore: cast_nullable_to_non_nullable
as PrayerDay,assignedDate: null == assignedDate ? _self.assignedDate : assignedDate // ignore: cast_nullable_to_non_nullable
as DateTime,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as PrayerStatus,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,completedAt: freezed == completedAt ? _self.completedAt : completedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [PrayerSchedule].
extension PrayerSchedulePatterns on PrayerSchedule {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PrayerSchedule value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PrayerSchedule() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PrayerSchedule value)  $default,){
final _that = this;
switch (_that) {
case _PrayerSchedule():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PrayerSchedule value)?  $default,){
final _that = this;
switch (_that) {
case _PrayerSchedule() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String userId,  PrayerDay day,  DateTime assignedDate,  PrayerStatus status,  String? notes,  DateTime? completedAt,  DateTime createdAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PrayerSchedule() when $default != null:
return $default(_that.id,_that.userId,_that.day,_that.assignedDate,_that.status,_that.notes,_that.completedAt,_that.createdAt);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String userId,  PrayerDay day,  DateTime assignedDate,  PrayerStatus status,  String? notes,  DateTime? completedAt,  DateTime createdAt)  $default,) {final _that = this;
switch (_that) {
case _PrayerSchedule():
return $default(_that.id,_that.userId,_that.day,_that.assignedDate,_that.status,_that.notes,_that.completedAt,_that.createdAt);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String userId,  PrayerDay day,  DateTime assignedDate,  PrayerStatus status,  String? notes,  DateTime? completedAt,  DateTime createdAt)?  $default,) {final _that = this;
switch (_that) {
case _PrayerSchedule() when $default != null:
return $default(_that.id,_that.userId,_that.day,_that.assignedDate,_that.status,_that.notes,_that.completedAt,_that.createdAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PrayerSchedule implements PrayerSchedule {
  const _PrayerSchedule({required this.id, required this.userId, required this.day, required this.assignedDate, this.status = PrayerStatus.assigned, this.notes, this.completedAt, required this.createdAt});
  factory _PrayerSchedule.fromJson(Map<String, dynamic> json) => _$PrayerScheduleFromJson(json);

@override final  String id;
@override final  String userId;
@override final  PrayerDay day;
@override final  DateTime assignedDate;
@override@JsonKey() final  PrayerStatus status;
@override final  String? notes;
@override final  DateTime? completedAt;
@override final  DateTime createdAt;

/// Create a copy of PrayerSchedule
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PrayerScheduleCopyWith<_PrayerSchedule> get copyWith => __$PrayerScheduleCopyWithImpl<_PrayerSchedule>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PrayerScheduleToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PrayerSchedule&&(identical(other.id, id) || other.id == id)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.day, day) || other.day == day)&&(identical(other.assignedDate, assignedDate) || other.assignedDate == assignedDate)&&(identical(other.status, status) || other.status == status)&&(identical(other.notes, notes) || other.notes == notes)&&(identical(other.completedAt, completedAt) || other.completedAt == completedAt)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,userId,day,assignedDate,status,notes,completedAt,createdAt);

@override
String toString() {
  return 'PrayerSchedule(id: $id, userId: $userId, day: $day, assignedDate: $assignedDate, status: $status, notes: $notes, completedAt: $completedAt, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class _$PrayerScheduleCopyWith<$Res> implements $PrayerScheduleCopyWith<$Res> {
  factory _$PrayerScheduleCopyWith(_PrayerSchedule value, $Res Function(_PrayerSchedule) _then) = __$PrayerScheduleCopyWithImpl;
@override @useResult
$Res call({
 String id, String userId, PrayerDay day, DateTime assignedDate, PrayerStatus status, String? notes, DateTime? completedAt, DateTime createdAt
});




}
/// @nodoc
class __$PrayerScheduleCopyWithImpl<$Res>
    implements _$PrayerScheduleCopyWith<$Res> {
  __$PrayerScheduleCopyWithImpl(this._self, this._then);

  final _PrayerSchedule _self;
  final $Res Function(_PrayerSchedule) _then;

/// Create a copy of PrayerSchedule
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? userId = null,Object? day = null,Object? assignedDate = null,Object? status = null,Object? notes = freezed,Object? completedAt = freezed,Object? createdAt = null,}) {
  return _then(_PrayerSchedule(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,day: null == day ? _self.day : day // ignore: cast_nullable_to_non_nullable
as PrayerDay,assignedDate: null == assignedDate ? _self.assignedDate : assignedDate // ignore: cast_nullable_to_non_nullable
as DateTime,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as PrayerStatus,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,completedAt: freezed == completedAt ? _self.completedAt : completedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

// dart format on
