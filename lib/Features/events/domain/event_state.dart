// lib/features/events/domain/state/events_state.dart
import 'package:freezed_annotation/freezed_annotation.dart';

part 'events_state.freezed.dart';

@freezed
class EventsState with _$EventsState {
  const factory EventsState.initial() = EventsStateInitial;
  const factory EventsState.loading() = EventsStateLoading;
  const factory EventsState.success(String message) = EventsStateSuccess;
  const factory EventsState.error(String message) = EventsStateError;
}

@freezed
class PrayerState with _$PrayerState {
  const factory PrayerState.initial() = PrayerStateInitial;
  const factory PrayerState.loading() = PrayerStateLoading;
  const factory PrayerState.success(String message) = PrayerStateSuccess;
  const factory PrayerState.error(String message) = PrayerStateError;
}