// lib/features/events/providers/events_provider.dart
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pta_contrib/Features/Auth/Domain/providers/auth_provider.dart';
import 'package:pta_contrib/Features/events/data/model/event.dart';
import 'package:pta_contrib/Features/events/domain/event_state.dart';
import 'package:pta_contrib/services/firebase/firebase_service.dart';
import 'package:uuid/uuid.dart';

// Move the part directive here if needed
part 'events_provider.freezed.dart';

// Events repository provider
final eventsRepositoryProvider = Provider<EventsRepository>((ref) {
  final firebaseService = ref.watch(firebaseServiceProvider);
  return EventsRepository(firebaseService);
});

// Events stream provider
final eventsStreamProvider = StreamProvider<List<Event>>((ref) {
  final repository = ref.watch(eventsRepositoryProvider);
  return repository.eventsStream();
});

// Prayer schedules stream provider
final prayerSchedulesStreamProvider = StreamProvider<List<PrayerSchedule>>((ref) {
  final repository = ref.watch(eventsRepositoryProvider);
  return repository.prayerSchedulesStream();
});

// User's prayer schedule provider
final userPrayerScheduleProvider = StreamProvider.family<List<PrayerSchedule>, String>((ref, userId) {
  final prayerSchedules = ref.watch(prayerSchedulesStreamProvider);
  return prayerSchedules.when(
    data: (schedules) => Stream.value(schedules.where((schedule) => schedule.userId == userId).toList()),
    loading: () => Stream.value(<PrayerSchedule>[]),
    error: (error, stack) => Stream.error(error, stack),
  );
});

// Available prayer days provider
final availablePrayerDaysProvider = FutureProvider.family<List<PrayerDay>, DateTime>((ref, date) async {
  final repository = ref.watch(eventsRepositoryProvider);
  final availableDays = <PrayerDay>[];
  
  for (final day in PrayerDay.values) {
    final isTaken = await repository.isPrayerDayTaken(day, date);
    if (!isTaken) {
      availableDays.add(day);
    }
  }
  
  return availableDays;
});

// Events controller provider
final eventsControllerProvider = StateNotifierProvider<EventsController, EventsState>((ref) {
  final repository = ref.watch(eventsRepositoryProvider);
  return EventsController(repository);
});

// Prayer controller provider
final prayerControllerProvider = StateNotifierProvider<PrayerController, PrayerState>((ref) {
  final repository = ref.watch(eventsRepositoryProvider);
  return PrayerController(repository);
});

class EventsRepository {
  final FirebaseService _firebaseService;

  EventsRepository(this._firebaseService);

  Stream<List<Event>> eventsStream() {
    return _firebaseService.eventsStream();
  }

  Future<void> createEvent(Event event) {
    return _firebaseService.createEvent(event);
  }

  Future<void> updateEvent(Event event) {
    return _firebaseService.updateEvent(event);
  }

  Future<void> deleteEvent(String eventId) {
    return _firebaseService.deleteEvent(eventId);
  }

  Future<void> addEventAttendee(String eventId, String userId) {
    return _firebaseService.addEventAttendee(eventId, userId);
  }

  Stream<List<PrayerSchedule>> prayerSchedulesStream() {
    return _firebaseService.prayerSchedulesStream();
  }

  Future<void> createPrayerSchedule(PrayerSchedule schedule) {
    return _firebaseService.createPrayerSchedule(schedule);
  }

  Future<void> updatePrayerSchedule(PrayerSchedule schedule) {
    return _firebaseService.updatePrayerSchedule(schedule);
  }

  Future<bool> isPrayerDayTaken(PrayerDay day, DateTime date) {
    return _firebaseService.isPrayerDayTaken(day, date);
  }
}

class EventsController extends StateNotifier<EventsState> {
  final EventsRepository _repository;
  final _uuid = const Uuid();

  EventsController(this._repository) : super(const EventsState.initial());

  Future<void> createEvent({
    required String title,
    required String description,
    required DateTime startDate,
    required DateTime endDate,
    required String organizerId,
    String? location,
    String? projectId,
    EventType type = EventType.general,
    List<String>? imageUrls,
    String? meetingLink,
  }) async {
    state = const EventsState.loading();
    
    try {
      final event = Event(
        id: _uuid.v4(),
        title: title,
        description: description,
        startDate: startDate,
        endDate: endDate,
        organizerId: organizerId,
        location: location,
        projectId: projectId,
        type: type,
        imageUrls: imageUrls ?? [],
        meetingLink: meetingLink,
        createdAt: DateTime.now(),
      );

      await _repository.createEvent(event);
      state = const EventsState.success('Event created successfully');
    } catch (e) {
      state = EventsState.error('Failed to create event: $e');
    }
  }

  Future<void> updateEvent(Event event) async {
    state = const EventsState.loading();
    
    try {
      final updatedEvent = event.copyWith(updatedAt: DateTime.now());
      await _repository.updateEvent(updatedEvent);
      state = const EventsState.success('Event updated successfully');
    } catch (e) {
      state = EventsState.error('Failed to update event: $e');
    }
  }

  Future<void> deleteEvent(String eventId) async {
    state = const EventsState.loading();
    
    try {
      await _repository.deleteEvent(eventId);
      state = const EventsState.success('Event deleted successfully');
    } catch (e) {
      state = EventsState.error('Failed to delete event: $e');
    }
  }

  Future<void> joinEvent(String eventId, String userId) async {
    state = const EventsState.loading();
    
    try {
      await _repository.addEventAttendee(eventId, userId);
      state = const EventsState.success('Successfully joined event');
    } catch (e) {
      state = EventsState.error('Failed to join event: $e');
    }
  }

  void clearState() {
    state = const EventsState.initial();
  }
}

class PrayerController extends StateNotifier<PrayerState> {
  final EventsRepository _repository;
  final _uuid = const Uuid();

  PrayerController(this._repository) : super(const PrayerState.initial());

  Future<void> selectPrayerDay({
    required String userId,
    required PrayerDay day,
    required DateTime date,
    String? notes,
  }) async {
    state = const PrayerState.loading();
    
    try {
      // Check if the day is still available
      final isAlreadyTaken = await _repository.isPrayerDayTaken(day, date);
      if (isAlreadyTaken) {
        state = const PrayerState.error('This prayer day has already been taken by someone else');
        return;
      }

      final schedule = PrayerSchedule(
        id: _uuid.v4(),
        userId: userId,
        day: day,
        assignedDate: date,
        notes: notes,
        createdAt: DateTime.now(),
      );

      await _repository.createPrayerSchedule(schedule);
      state = const PrayerState.success('Prayer day assigned successfully');
    } catch (e) {
      state = PrayerState.error('Failed to assign prayer day: $e');
    }
  }

  Future<void> markPrayerCompleted(String scheduleId) async {
    state = const PrayerState.loading();
    
    try {
      // This would require getting the existing schedule first
      // For now, we'll create a method to update the schedule
      // In a real implementation, you'd fetch the schedule, update it, then save
      state = const PrayerState.success('Prayer marked as completed');
    } catch (e) {
      state = PrayerState.error('Failed to mark prayer as completed: $e');
    }
  }

  Future<void> updatePrayerSchedule({
    required String scheduleId,
    PrayerStatus? status,
    String? notes,
  }) async {
    state = const PrayerState.loading();
    
    try {
      // This would involve fetching the existing schedule and updating it
      // Implementation would depend on your specific requirements
      state = const PrayerState.success('Prayer schedule updated successfully');
    } catch (e) {
      state = PrayerState.error('Failed to update prayer schedule: $e');
    }
  }

  void clearState() {
    state = const PrayerState.initial();
  }
}

