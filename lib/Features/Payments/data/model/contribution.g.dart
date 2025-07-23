// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'contribution.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Contribution _$ContributionFromJson(Map<String, dynamic> json) =>
    _Contribution(
      id: json['id'] as String,
      projectId: json['projectId'] as String,
      userId: json['userId'] as String,
      amount: (json['amount'] as num).toDouble(),
      status: $enumDecode(_$ContributionStatusEnumMap, json['status']),
      paymentMethod: $enumDecode(_$PaymentMethodEnumMap, json['paymentMethod']),
      transactionId: json['transactionId'] as String?,
      message: json['message'] as String?,
      receiptUrl: json['receiptUrl'] as String?,
      createdAt: DateTime.parse(json['createdAt'] as String),
      completedAt: json['completedAt'] == null
          ? null
          : DateTime.parse(json['completedAt'] as String),
      failureReason: json['failureReason'] as String?,
      isAnonymous: json['isAnonymous'] as bool? ?? false,
    );

Map<String, dynamic> _$ContributionToJson(_Contribution instance) =>
    <String, dynamic>{
      'id': instance.id,
      'projectId': instance.projectId,
      'userId': instance.userId,
      'amount': instance.amount,
      'status': _$ContributionStatusEnumMap[instance.status]!,
      'paymentMethod': _$PaymentMethodEnumMap[instance.paymentMethod]!,
      'transactionId': instance.transactionId,
      'message': instance.message,
      'receiptUrl': instance.receiptUrl,
      'createdAt': instance.createdAt.toIso8601String(),
      'completedAt': instance.completedAt?.toIso8601String(),
      'failureReason': instance.failureReason,
      'isAnonymous': instance.isAnonymous,
    };

const _$ContributionStatusEnumMap = {
  ContributionStatus.pending: 'pending',
  ContributionStatus.completed: 'completed',
  ContributionStatus.failed: 'failed',
  ContributionStatus.cancelled: 'cancelled',
};

const _$PaymentMethodEnumMap = {
  PaymentMethod.mpesa: 'mpesa',
  PaymentMethod.card: 'card',
  PaymentMethod.bank: 'bank',
};
