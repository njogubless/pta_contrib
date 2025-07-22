// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$User {

 String get id; String get email; String get name; String? get phoneNumber; String? get profileImageUrl; UserRole get role; List<String> get favoriteProjects; double get totalContributed; int get contributionCount; List<String> get badges; String? get selectedPrayerDay; DateTime? get createdAt; DateTime? get lastActive;
/// Create a copy of User
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserCopyWith<User> get copyWith => _$UserCopyWithImpl<User>(this as User, _$identity);

  /// Serializes this User to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is User&&(identical(other.id, id) || other.id == id)&&(identical(other.email, email) || other.email == email)&&(identical(other.name, name) || other.name == name)&&(identical(other.phoneNumber, phoneNumber) || other.phoneNumber == phoneNumber)&&(identical(other.profileImageUrl, profileImageUrl) || other.profileImageUrl == profileImageUrl)&&(identical(other.role, role) || other.role == role)&&const DeepCollectionEquality().equals(other.favoriteProjects, favoriteProjects)&&(identical(other.totalContributed, totalContributed) || other.totalContributed == totalContributed)&&(identical(other.contributionCount, contributionCount) || other.contributionCount == contributionCount)&&const DeepCollectionEquality().equals(other.badges, badges)&&(identical(other.selectedPrayerDay, selectedPrayerDay) || other.selectedPrayerDay == selectedPrayerDay)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.lastActive, lastActive) || other.lastActive == lastActive));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,email,name,phoneNumber,profileImageUrl,role,const DeepCollectionEquality().hash(favoriteProjects),totalContributed,contributionCount,const DeepCollectionEquality().hash(badges),selectedPrayerDay,createdAt,lastActive);

@override
String toString() {
  return 'User(id: $id, email: $email, name: $name, phoneNumber: $phoneNumber, profileImageUrl: $profileImageUrl, role: $role, favoriteProjects: $favoriteProjects, totalContributed: $totalContributed, contributionCount: $contributionCount, badges: $badges, selectedPrayerDay: $selectedPrayerDay, createdAt: $createdAt, lastActive: $lastActive)';
}


}

/// @nodoc
abstract mixin class $UserCopyWith<$Res>  {
  factory $UserCopyWith(User value, $Res Function(User) _then) = _$UserCopyWithImpl;
@useResult
$Res call({
 String id, String email, String name, String? phoneNumber, String? profileImageUrl, UserRole role, List<String> favoriteProjects, double totalContributed, int contributionCount, List<String> badges, String? selectedPrayerDay, DateTime? createdAt, DateTime? lastActive
});




}
/// @nodoc
class _$UserCopyWithImpl<$Res>
    implements $UserCopyWith<$Res> {
  _$UserCopyWithImpl(this._self, this._then);

  final User _self;
  final $Res Function(User) _then;

/// Create a copy of User
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? email = null,Object? name = null,Object? phoneNumber = freezed,Object? profileImageUrl = freezed,Object? role = null,Object? favoriteProjects = null,Object? totalContributed = null,Object? contributionCount = null,Object? badges = null,Object? selectedPrayerDay = freezed,Object? createdAt = freezed,Object? lastActive = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,phoneNumber: freezed == phoneNumber ? _self.phoneNumber : phoneNumber // ignore: cast_nullable_to_non_nullable
as String?,profileImageUrl: freezed == profileImageUrl ? _self.profileImageUrl : profileImageUrl // ignore: cast_nullable_to_non_nullable
as String?,role: null == role ? _self.role : role // ignore: cast_nullable_to_non_nullable
as UserRole,favoriteProjects: null == favoriteProjects ? _self.favoriteProjects : favoriteProjects // ignore: cast_nullable_to_non_nullable
as List<String>,totalContributed: null == totalContributed ? _self.totalContributed : totalContributed // ignore: cast_nullable_to_non_nullable
as double,contributionCount: null == contributionCount ? _self.contributionCount : contributionCount // ignore: cast_nullable_to_non_nullable
as int,badges: null == badges ? _self.badges : badges // ignore: cast_nullable_to_non_nullable
as List<String>,selectedPrayerDay: freezed == selectedPrayerDay ? _self.selectedPrayerDay : selectedPrayerDay // ignore: cast_nullable_to_non_nullable
as String?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,lastActive: freezed == lastActive ? _self.lastActive : lastActive // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [User].
extension UserPatterns on User {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _User value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _User() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _User value)  $default,){
final _that = this;
switch (_that) {
case _User():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _User value)?  $default,){
final _that = this;
switch (_that) {
case _User() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String email,  String name,  String? phoneNumber,  String? profileImageUrl,  UserRole role,  List<String> favoriteProjects,  double totalContributed,  int contributionCount,  List<String> badges,  String? selectedPrayerDay,  DateTime? createdAt,  DateTime? lastActive)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _User() when $default != null:
return $default(_that.id,_that.email,_that.name,_that.phoneNumber,_that.profileImageUrl,_that.role,_that.favoriteProjects,_that.totalContributed,_that.contributionCount,_that.badges,_that.selectedPrayerDay,_that.createdAt,_that.lastActive);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String email,  String name,  String? phoneNumber,  String? profileImageUrl,  UserRole role,  List<String> favoriteProjects,  double totalContributed,  int contributionCount,  List<String> badges,  String? selectedPrayerDay,  DateTime? createdAt,  DateTime? lastActive)  $default,) {final _that = this;
switch (_that) {
case _User():
return $default(_that.id,_that.email,_that.name,_that.phoneNumber,_that.profileImageUrl,_that.role,_that.favoriteProjects,_that.totalContributed,_that.contributionCount,_that.badges,_that.selectedPrayerDay,_that.createdAt,_that.lastActive);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String email,  String name,  String? phoneNumber,  String? profileImageUrl,  UserRole role,  List<String> favoriteProjects,  double totalContributed,  int contributionCount,  List<String> badges,  String? selectedPrayerDay,  DateTime? createdAt,  DateTime? lastActive)?  $default,) {final _that = this;
switch (_that) {
case _User() when $default != null:
return $default(_that.id,_that.email,_that.name,_that.phoneNumber,_that.profileImageUrl,_that.role,_that.favoriteProjects,_that.totalContributed,_that.contributionCount,_that.badges,_that.selectedPrayerDay,_that.createdAt,_that.lastActive);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _User implements User {
  const _User({required this.id, required this.email, required this.name, this.phoneNumber, this.profileImageUrl, this.role = UserRole.contributor, final  List<String> favoriteProjects = const [], this.totalContributed = 0.0, this.contributionCount = 0, final  List<String> badges = const [], this.selectedPrayerDay, this.createdAt, this.lastActive}): _favoriteProjects = favoriteProjects,_badges = badges;
  factory _User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

@override final  String id;
@override final  String email;
@override final  String name;
@override final  String? phoneNumber;
@override final  String? profileImageUrl;
@override@JsonKey() final  UserRole role;
 final  List<String> _favoriteProjects;
@override@JsonKey() List<String> get favoriteProjects {
  if (_favoriteProjects is EqualUnmodifiableListView) return _favoriteProjects;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_favoriteProjects);
}

@override@JsonKey() final  double totalContributed;
@override@JsonKey() final  int contributionCount;
 final  List<String> _badges;
@override@JsonKey() List<String> get badges {
  if (_badges is EqualUnmodifiableListView) return _badges;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_badges);
}

@override final  String? selectedPrayerDay;
@override final  DateTime? createdAt;
@override final  DateTime? lastActive;

/// Create a copy of User
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UserCopyWith<_User> get copyWith => __$UserCopyWithImpl<_User>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UserToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _User&&(identical(other.id, id) || other.id == id)&&(identical(other.email, email) || other.email == email)&&(identical(other.name, name) || other.name == name)&&(identical(other.phoneNumber, phoneNumber) || other.phoneNumber == phoneNumber)&&(identical(other.profileImageUrl, profileImageUrl) || other.profileImageUrl == profileImageUrl)&&(identical(other.role, role) || other.role == role)&&const DeepCollectionEquality().equals(other._favoriteProjects, _favoriteProjects)&&(identical(other.totalContributed, totalContributed) || other.totalContributed == totalContributed)&&(identical(other.contributionCount, contributionCount) || other.contributionCount == contributionCount)&&const DeepCollectionEquality().equals(other._badges, _badges)&&(identical(other.selectedPrayerDay, selectedPrayerDay) || other.selectedPrayerDay == selectedPrayerDay)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.lastActive, lastActive) || other.lastActive == lastActive));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,email,name,phoneNumber,profileImageUrl,role,const DeepCollectionEquality().hash(_favoriteProjects),totalContributed,contributionCount,const DeepCollectionEquality().hash(_badges),selectedPrayerDay,createdAt,lastActive);

@override
String toString() {
  return 'User(id: $id, email: $email, name: $name, phoneNumber: $phoneNumber, profileImageUrl: $profileImageUrl, role: $role, favoriteProjects: $favoriteProjects, totalContributed: $totalContributed, contributionCount: $contributionCount, badges: $badges, selectedPrayerDay: $selectedPrayerDay, createdAt: $createdAt, lastActive: $lastActive)';
}


}

/// @nodoc
abstract mixin class _$UserCopyWith<$Res> implements $UserCopyWith<$Res> {
  factory _$UserCopyWith(_User value, $Res Function(_User) _then) = __$UserCopyWithImpl;
@override @useResult
$Res call({
 String id, String email, String name, String? phoneNumber, String? profileImageUrl, UserRole role, List<String> favoriteProjects, double totalContributed, int contributionCount, List<String> badges, String? selectedPrayerDay, DateTime? createdAt, DateTime? lastActive
});




}
/// @nodoc
class __$UserCopyWithImpl<$Res>
    implements _$UserCopyWith<$Res> {
  __$UserCopyWithImpl(this._self, this._then);

  final _User _self;
  final $Res Function(_User) _then;

/// Create a copy of User
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? email = null,Object? name = null,Object? phoneNumber = freezed,Object? profileImageUrl = freezed,Object? role = null,Object? favoriteProjects = null,Object? totalContributed = null,Object? contributionCount = null,Object? badges = null,Object? selectedPrayerDay = freezed,Object? createdAt = freezed,Object? lastActive = freezed,}) {
  return _then(_User(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,phoneNumber: freezed == phoneNumber ? _self.phoneNumber : phoneNumber // ignore: cast_nullable_to_non_nullable
as String?,profileImageUrl: freezed == profileImageUrl ? _self.profileImageUrl : profileImageUrl // ignore: cast_nullable_to_non_nullable
as String?,role: null == role ? _self.role : role // ignore: cast_nullable_to_non_nullable
as UserRole,favoriteProjects: null == favoriteProjects ? _self._favoriteProjects : favoriteProjects // ignore: cast_nullable_to_non_nullable
as List<String>,totalContributed: null == totalContributed ? _self.totalContributed : totalContributed // ignore: cast_nullable_to_non_nullable
as double,contributionCount: null == contributionCount ? _self.contributionCount : contributionCount // ignore: cast_nullable_to_non_nullable
as int,badges: null == badges ? _self._badges : badges // ignore: cast_nullable_to_non_nullable
as List<String>,selectedPrayerDay: freezed == selectedPrayerDay ? _self.selectedPrayerDay : selectedPrayerDay // ignore: cast_nullable_to_non_nullable
as String?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,lastActive: freezed == lastActive ? _self.lastActive : lastActive // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

// dart format on
