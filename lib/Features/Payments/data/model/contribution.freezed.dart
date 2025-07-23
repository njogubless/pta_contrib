// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'contribution.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Contribution {

 String get id; String get projectId; String get userId; double get amount; ContributionStatus get status; PaymentMethod get paymentMethod; String? get transactionId; String? get message; String? get receiptUrl; DateTime get createdAt; DateTime? get completedAt; String? get failureReason; bool get isAnonymous;
/// Create a copy of Contribution
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ContributionCopyWith<Contribution> get copyWith => _$ContributionCopyWithImpl<Contribution>(this as Contribution, _$identity);

  /// Serializes this Contribution to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Contribution&&(identical(other.id, id) || other.id == id)&&(identical(other.projectId, projectId) || other.projectId == projectId)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.status, status) || other.status == status)&&(identical(other.paymentMethod, paymentMethod) || other.paymentMethod == paymentMethod)&&(identical(other.transactionId, transactionId) || other.transactionId == transactionId)&&(identical(other.message, message) || other.message == message)&&(identical(other.receiptUrl, receiptUrl) || other.receiptUrl == receiptUrl)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.completedAt, completedAt) || other.completedAt == completedAt)&&(identical(other.failureReason, failureReason) || other.failureReason == failureReason)&&(identical(other.isAnonymous, isAnonymous) || other.isAnonymous == isAnonymous));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,projectId,userId,amount,status,paymentMethod,transactionId,message,receiptUrl,createdAt,completedAt,failureReason,isAnonymous);

@override
String toString() {
  return 'Contribution(id: $id, projectId: $projectId, userId: $userId, amount: $amount, status: $status, paymentMethod: $paymentMethod, transactionId: $transactionId, message: $message, receiptUrl: $receiptUrl, createdAt: $createdAt, completedAt: $completedAt, failureReason: $failureReason, isAnonymous: $isAnonymous)';
}


}

/// @nodoc
abstract mixin class $ContributionCopyWith<$Res>  {
  factory $ContributionCopyWith(Contribution value, $Res Function(Contribution) _then) = _$ContributionCopyWithImpl;
@useResult
$Res call({
 String id, String projectId, String userId, double amount, ContributionStatus status, PaymentMethod paymentMethod, String? transactionId, String? message, String? receiptUrl, DateTime createdAt, DateTime? completedAt, String? failureReason, bool isAnonymous
});




}
/// @nodoc
class _$ContributionCopyWithImpl<$Res>
    implements $ContributionCopyWith<$Res> {
  _$ContributionCopyWithImpl(this._self, this._then);

  final Contribution _self;
  final $Res Function(Contribution) _then;

/// Create a copy of Contribution
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? projectId = null,Object? userId = null,Object? amount = null,Object? status = null,Object? paymentMethod = null,Object? transactionId = freezed,Object? message = freezed,Object? receiptUrl = freezed,Object? createdAt = null,Object? completedAt = freezed,Object? failureReason = freezed,Object? isAnonymous = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,projectId: null == projectId ? _self.projectId : projectId // ignore: cast_nullable_to_non_nullable
as String,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as double,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as ContributionStatus,paymentMethod: null == paymentMethod ? _self.paymentMethod : paymentMethod // ignore: cast_nullable_to_non_nullable
as PaymentMethod,transactionId: freezed == transactionId ? _self.transactionId : transactionId // ignore: cast_nullable_to_non_nullable
as String?,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,receiptUrl: freezed == receiptUrl ? _self.receiptUrl : receiptUrl // ignore: cast_nullable_to_non_nullable
as String?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,completedAt: freezed == completedAt ? _self.completedAt : completedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,failureReason: freezed == failureReason ? _self.failureReason : failureReason // ignore: cast_nullable_to_non_nullable
as String?,isAnonymous: null == isAnonymous ? _self.isAnonymous : isAnonymous // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [Contribution].
extension ContributionPatterns on Contribution {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Contribution value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Contribution() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Contribution value)  $default,){
final _that = this;
switch (_that) {
case _Contribution():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Contribution value)?  $default,){
final _that = this;
switch (_that) {
case _Contribution() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String projectId,  String userId,  double amount,  ContributionStatus status,  PaymentMethod paymentMethod,  String? transactionId,  String? message,  String? receiptUrl,  DateTime createdAt,  DateTime? completedAt,  String? failureReason,  bool isAnonymous)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Contribution() when $default != null:
return $default(_that.id,_that.projectId,_that.userId,_that.amount,_that.status,_that.paymentMethod,_that.transactionId,_that.message,_that.receiptUrl,_that.createdAt,_that.completedAt,_that.failureReason,_that.isAnonymous);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String projectId,  String userId,  double amount,  ContributionStatus status,  PaymentMethod paymentMethod,  String? transactionId,  String? message,  String? receiptUrl,  DateTime createdAt,  DateTime? completedAt,  String? failureReason,  bool isAnonymous)  $default,) {final _that = this;
switch (_that) {
case _Contribution():
return $default(_that.id,_that.projectId,_that.userId,_that.amount,_that.status,_that.paymentMethod,_that.transactionId,_that.message,_that.receiptUrl,_that.createdAt,_that.completedAt,_that.failureReason,_that.isAnonymous);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String projectId,  String userId,  double amount,  ContributionStatus status,  PaymentMethod paymentMethod,  String? transactionId,  String? message,  String? receiptUrl,  DateTime createdAt,  DateTime? completedAt,  String? failureReason,  bool isAnonymous)?  $default,) {final _that = this;
switch (_that) {
case _Contribution() when $default != null:
return $default(_that.id,_that.projectId,_that.userId,_that.amount,_that.status,_that.paymentMethod,_that.transactionId,_that.message,_that.receiptUrl,_that.createdAt,_that.completedAt,_that.failureReason,_that.isAnonymous);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Contribution implements Contribution {
  const _Contribution({required this.id, required this.projectId, required this.userId, required this.amount, required this.status, required this.paymentMethod, this.transactionId, this.message, this.receiptUrl, required this.createdAt, this.completedAt, this.failureReason, this.isAnonymous = false});
  factory _Contribution.fromJson(Map<String, dynamic> json) => _$ContributionFromJson(json);

@override final  String id;
@override final  String projectId;
@override final  String userId;
@override final  double amount;
@override final  ContributionStatus status;
@override final  PaymentMethod paymentMethod;
@override final  String? transactionId;
@override final  String? message;
@override final  String? receiptUrl;
@override final  DateTime createdAt;
@override final  DateTime? completedAt;
@override final  String? failureReason;
@override@JsonKey() final  bool isAnonymous;

/// Create a copy of Contribution
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ContributionCopyWith<_Contribution> get copyWith => __$ContributionCopyWithImpl<_Contribution>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ContributionToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Contribution&&(identical(other.id, id) || other.id == id)&&(identical(other.projectId, projectId) || other.projectId == projectId)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.status, status) || other.status == status)&&(identical(other.paymentMethod, paymentMethod) || other.paymentMethod == paymentMethod)&&(identical(other.transactionId, transactionId) || other.transactionId == transactionId)&&(identical(other.message, message) || other.message == message)&&(identical(other.receiptUrl, receiptUrl) || other.receiptUrl == receiptUrl)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.completedAt, completedAt) || other.completedAt == completedAt)&&(identical(other.failureReason, failureReason) || other.failureReason == failureReason)&&(identical(other.isAnonymous, isAnonymous) || other.isAnonymous == isAnonymous));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,projectId,userId,amount,status,paymentMethod,transactionId,message,receiptUrl,createdAt,completedAt,failureReason,isAnonymous);

@override
String toString() {
  return 'Contribution(id: $id, projectId: $projectId, userId: $userId, amount: $amount, status: $status, paymentMethod: $paymentMethod, transactionId: $transactionId, message: $message, receiptUrl: $receiptUrl, createdAt: $createdAt, completedAt: $completedAt, failureReason: $failureReason, isAnonymous: $isAnonymous)';
}


}

/// @nodoc
abstract mixin class _$ContributionCopyWith<$Res> implements $ContributionCopyWith<$Res> {
  factory _$ContributionCopyWith(_Contribution value, $Res Function(_Contribution) _then) = __$ContributionCopyWithImpl;
@override @useResult
$Res call({
 String id, String projectId, String userId, double amount, ContributionStatus status, PaymentMethod paymentMethod, String? transactionId, String? message, String? receiptUrl, DateTime createdAt, DateTime? completedAt, String? failureReason, bool isAnonymous
});




}
/// @nodoc
class __$ContributionCopyWithImpl<$Res>
    implements _$ContributionCopyWith<$Res> {
  __$ContributionCopyWithImpl(this._self, this._then);

  final _Contribution _self;
  final $Res Function(_Contribution) _then;

/// Create a copy of Contribution
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? projectId = null,Object? userId = null,Object? amount = null,Object? status = null,Object? paymentMethod = null,Object? transactionId = freezed,Object? message = freezed,Object? receiptUrl = freezed,Object? createdAt = null,Object? completedAt = freezed,Object? failureReason = freezed,Object? isAnonymous = null,}) {
  return _then(_Contribution(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,projectId: null == projectId ? _self.projectId : projectId // ignore: cast_nullable_to_non_nullable
as String,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as double,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as ContributionStatus,paymentMethod: null == paymentMethod ? _self.paymentMethod : paymentMethod // ignore: cast_nullable_to_non_nullable
as PaymentMethod,transactionId: freezed == transactionId ? _self.transactionId : transactionId // ignore: cast_nullable_to_non_nullable
as String?,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,receiptUrl: freezed == receiptUrl ? _self.receiptUrl : receiptUrl // ignore: cast_nullable_to_non_nullable
as String?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,completedAt: freezed == completedAt ? _self.completedAt : completedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,failureReason: freezed == failureReason ? _self.failureReason : failureReason // ignore: cast_nullable_to_non_nullable
as String?,isAnonymous: null == isAnonymous ? _self.isAnonymous : isAnonymous // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
