
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
import 'package:firebase_storage/firebase_storage.dart';
import 'package:pta_contrib/Features/Payments/data/model/contribution.dart';
import 'package:pta_contrib/Features/Projects/Data/model/model.dart';
import 'package:pta_contrib/Features/events/data/model/event.dart';
import 'package:pta_contrib/Features/user/data/model/user.dart';


abstract class FirebaseService {
  // Auth methods
  Future<User?> signInWithEmailAndPassword(String email, String password);
  Future<User?> createUserWithEmailAndPassword(String email, String password, String name);
  Future<void> signOut();
  Stream<User?> authStateChanges();
  
  // User methods
  Future<void> createUser(User user);
  Future<User?> getUser(String userId);
  Future<void> updateUser(User user);
  Stream<User?> userStream(String userId);
  
  // Project methods
  Future<void> createProject(Project project);
  Future<Project?> getProject(String projectId);
  Future<void> updateProject(Project project);
  Future<void> deleteProject(String projectId);
  Stream<List<Project>> projectsStream();
  Stream<List<Project>> userProjectsStream(String userId);
  Future<List<Project>> getFeaturedProjects();
  
  // Contribution methods
  Future<void> createContribution(Contribution contribution);
  Future<void> updateContribution(Contribution contribution);
  Stream<List<Contribution>> projectContributionsStream(String projectId);
  Stream<List<Contribution>> userContributionsStream(String userId);
  Future<Map<String, double>> getProjectContributionSummary(String projectId);
  
  // Event methods
  Future<void> createEvent(Event event);
  Future<void> updateEvent(Event event);
  Future<void> deleteEvent(String eventId);
  Stream<List<Event>> eventsStream();
  Future<void> addEventAttendee(String eventId, String userId);
  
  // Prayer schedule methods
  Future<void> createPrayerSchedule(PrayerSchedule schedule);
  Future<void> updatePrayerSchedule(PrayerSchedule schedule);
  Stream<List<PrayerSchedule>> prayerSchedulesStream();
  Future<bool> isPrayerDayTaken(PrayerDay day, DateTime date);
}

class FirebaseServiceImpl implements FirebaseService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final firebase_auth.FirebaseAuth _auth = firebase_auth.FirebaseAuth.instance;
  final FirebaseStorage _storage = FirebaseStorage.instance;

  // Collection references
  CollectionReference get _users => _firestore.collection('users');
  CollectionReference get _projects => _firestore.collection('projects');
  CollectionReference get _contributions => _firestore.collection('contributions');
  CollectionReference get _events => _firestore.collection('events');
  CollectionReference get _prayerSchedules => _firestore.collection('prayer_schedules');

  @override
  Future<User?> signInWithEmailAndPassword(String email, String password) async {
    try {
      final credential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      if (credential.user != null) {
        return await getUser(credential.user!.uid);
      }
      return null;
    } catch (e) {
      throw Exception('Sign in failed: $e');
    }
  }

  @override
  Future<User?> createUserWithEmailAndPassword(String email, String password, String name) async {
    try {
      final credential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      
      if (credential.user != null) {
        final user = User(
          id: credential.user!.uid,
          email: email,
          name: name,
          createdAt: DateTime.now(),
        );
        await createUser(user);
        return user;
      }
      return null;
    } catch (e) {
      throw Exception('Account creation failed: $e');
    }
  }

  @override
  Future<void> signOut() async {
    await _auth.signOut();
  }

  @override
  Stream<User?> authStateChanges() {
    return _auth.authStateChanges().asyncMap((firebaseUser) async {
      if (firebaseUser != null) {
        return await getUser(firebaseUser.uid);
      }
      return null;
    });
  }

  @override
  Future<void> createUser(User user) async {
    await _users.doc(user.id).set(user.toJson());
  }

  @override
  Future<User?> getUser(String userId) async {
    final doc = await _users.doc(userId).get();
    if (doc.exists) {
      return User.fromJson(doc.data() as Map<String, dynamic>);
    }
    return null;
  }

  @override
  Future<void> updateUser(User user) async {
    await _users.doc(user.id).update(user.toJson());
  }

  @override
  Stream<User?> userStream(String userId) {
    return _users.doc(userId).snapshots().map((doc) {
      if (doc.exists) {
        return User.fromJson(doc.data() as Map<String, dynamic>);
      }
      return null;
    });
  }

  @override
  Future<void> createProject(Project project) async {
    await _projects.doc(project.id).set(project.toJson());
  }

  @override
  Future<Project?> getProject(String projectId) async {
    final doc = await _projects.doc(projectId).get();
    if (doc.exists) {
      return Project.fromJson(doc.data() as Map<String, dynamic>);
    }
    return null;
  }

  @override
  Future<void> updateProject(Project project) async {
    await _projects.doc(project.id).update(project.toJson());
  }

  @override
  Future<void> deleteProject(String projectId) async {
    await _projects.doc(projectId).delete();
  }

  @override
  Stream<List<Project>> projectsStream() {
    return _projects
        .where('status', isEqualTo: 'active')
        .orderBy('createdAt', descending: true)
        .snapshots()
        .map((snapshot) => snapshot.docs
            .map((doc) => Project.fromJson(doc.data() as Map<String, dynamic>))
            .toList());
  }

  @override
  Stream<List<Project>> userProjectsStream(String userId) {
    return _projects
        .where('adminId', isEqualTo: userId)
        .orderBy('createdAt', descending: true)
        .snapshots()
        .map((snapshot) => snapshot.docs
            .map((doc) => Project.fromJson(doc.data() as Map<String, dynamic>))
            .toList());
  }

  @override
  Future<List<Project>> getFeaturedProjects() async {
    final snapshot = await _projects
        .where('isFeatured', isEqualTo: true)
        .where('status', isEqualTo: 'active')
        .limit(5)
        .get();
    
    return snapshot.docs
        .map((doc) => Project.fromJson(doc.data() as Map<String, dynamic>))
        .toList();
  }

  @override
  Future<void> createContribution(Contribution contribution) async {
    await _contributions.doc(contribution.id).set(contribution.toJson());
  }

  @override
  Future<void> updateContribution(Contribution contribution) async {
    await _contributions.doc(contribution.id).update(contribution.toJson());
  }

  @override
  Stream<List<Contribution>> projectContributionsStream(String projectId) {
    return _contributions
        .where('projectId', isEqualTo: projectId)
        .orderBy('createdAt', descending: true)
        .snapshots()
        .map((snapshot) => snapshot.docs
            .map((doc) => Contribution.fromJson(doc.data() as Map<String, dynamic>))
            .toList());
  }

  @override
  Stream<List<Contribution>> userContributionsStream(String userId) {
    return _contributions
        .where('userId', isEqualTo: userId)
        .orderBy('createdAt', descending: true)
        .snapshots()
        .map((snapshot) => snapshot.docs
            .map((doc) => Contribution.fromJson(doc.data() as Map<String, dynamic>))
            .toList());
  }

  @override
  Future<Map<String, double>> getProjectContributionSummary(String projectId) async {
    final snapshot = await _contributions
        .where('projectId', isEqualTo: projectId)
        .where('status', isEqualTo: 'completed')
        .get();

    double totalAmount = 0.0;
    int totalContributors = 0;
    final contributorSet = <String>{};

    for (final doc in snapshot.docs) {
      final contribution = Contribution.fromJson(doc.data() as Map<String, dynamic>);
      totalAmount += contribution.amount;
      contributorSet.add(contribution.userId);
    }

    totalContributors = contributorSet.length;

    return {
      'totalAmount': totalAmount,
      'totalContributors': totalContributors.toDouble(),
    };
  }

  @override
  Future<void> createEvent(Event event) async {
    await _events.doc(event.id).set(event.toJson());
  }

  @override
  Future<void> updateEvent(Event event) async {
    await _events.doc(event.id).update(event.toJson());
  }

  @override
  Future<void> deleteEvent(String eventId) async {
    await _events.doc(eventId).delete();
  }

  @override
  Stream<List<Event>> eventsStream() {
    return _events
        .orderBy('startDate')
        .snapshots()
        .map((snapshot) => snapshot.docs
            .map((doc) => Event.fromJson(doc.data() as Map<String, dynamic>))
            .toList());
  }

  @override
  Future<void> addEventAttendee(String eventId, String userId) async {
    await _events.doc(eventId).update({
      'attendeeIds': FieldValue.arrayUnion([userId]),
    });
  }

  @override
  Future<void> createPrayerSchedule(PrayerSchedule schedule) async {
    await _prayerSchedules.doc(schedule.id).set(schedule.toJson());
  }

  @override
  Future<void> updatePrayerSchedule(PrayerSchedule schedule) async {
    await _prayerSchedules.doc(schedule.id).update(schedule.toJson());
  }

  @override
  Stream<List<PrayerSchedule>> prayerSchedulesStream() {
    return _prayerSchedules
        .orderBy('assignedDate')
        .snapshots()
        .map((snapshot) => snapshot.docs
            .map((doc) => PrayerSchedule.fromJson(doc.data() as Map<String, dynamic>))
            .toList());
  }

  @override
  Future<bool> isPrayerDayTaken(PrayerDay day, DateTime date) async {
    final startOfDay = DateTime(date.year, date.month, date.day);
    final endOfDay = DateTime(date.year, date.month, date.day, 23, 59, 59);

    final snapshot = await _prayerSchedules
        .where('day', isEqualTo: day.name)
        .where('assignedDate', isGreaterThanOrEqualTo: startOfDay)
        .where('assignedDate', isLessThanOrEqualTo: endOfDay)
        .limit(1)
        .get();

    return snapshot.docs.isNotEmpty;
  }
}