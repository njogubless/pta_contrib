import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pta_contrib/Features/Analytics/Data/model/analytics_model.dart';
import 'package:pta_contrib/Features/Payments/data/model/contribution.dart';
import 'package:pta_contrib/Features/Projects/Data/model/model.dart';
import 'package:pta_contrib/Features/user/data/model/user.dart';
import 'package:pta_contrib/services/firebase/firebase_service.dart';

// Analytics data models


// Analytics service
class AnalyticsService {
  final FirebaseService _firebaseService;

  AnalyticsService(this._firebaseService);

  Future<AnalyticsData> getAnalyticsData({
    DateTime? startDate,
    DateTime? endDate,
  }) async {
    try {
      // Set default date range if not provided
      endDate ??= DateTime.now();
      startDate ??= endDate.subtract(const Duration(days: 30));

      // Fetch data concurrently
      final futures = await Future.wait([
        _getTotalContributions(startDate, endDate),
        _getTotalProjects(),
        _getTotalUsers(),
        _getContributionTrends(startDate, endDate),
        _getProjectStats(startDate, endDate),
        _getUserActivities(startDate, endDate),
      ]);

      final totalContributions = futures[0] as int;
      final totalProjects = futures[1] as int;
      final totalUsers = futures[2] as int;
      final contributionTrends = futures[3] as List<ContributionTrend>;
      final projectStats = futures[4] as List<ProjectStats>;
      final userActivities = futures[5] as List<UserActivity>;

      final averageContributionsPerProject = totalProjects > 0
          ? totalContributions / totalProjects
          : 0.0;

      return AnalyticsData(
        totalContributions: totalContributions,
        totalProjects: totalProjects,
        totalUsers: totalUsers,
        averageContributionsPerProject: averageContributionsPerProject,
        contributionTrends: contributionTrends,
        projectStats: projectStats,
        userActivities: userActivities,
      );
    } catch (e) {
      throw Exception('Failed to fetch analytics data: $e');
    }
  }

  Future<int> _getTotalContributions(DateTime startDate, DateTime endDate) async {
    final contributions = await _firebaseService.getContributions();
    return contributions.where((c) {
      return c.createdAt.isAfter(startDate) && c.createdAt.isBefore(endDate);
    }).length;
  }

  Future<int> _getTotalProjects() async {
    final projects = await _firebaseService.getProjects();
    return projects.length;
  }

  Future<int> _getTotalUsers() async {
    final users = await _firebaseService.getUsers();
    return users.length;
  }

  Future<List<ContributionTrend>> _getContributionTrends(
    DateTime startDate,
    DateTime endDate,
  ) async {
    final contributions = await _firebaseService.getContributions();
    final filteredContributions = contributions.where((c) {
      return c.createdAt.isAfter(startDate) && c.createdAt.isBefore(endDate);
    }).toList();

    // Group contributions by date
    final Map<DateTime, int> dailyCounts = {};
    for (final contribution in filteredContributions) {
      final date = DateTime(
        contribution.createdAt.year,
        contribution.createdAt.month,
        contribution.createdAt.day,
      );
      dailyCounts[date] = (dailyCounts[date] ?? 0) + 1;
    }

    // Convert to trend objects and sort by date
    final trends = dailyCounts.entries
        .map((entry) => ContributionTrend(date: entry.key, count: entry.value))
        .toList();
    trends.sort((a, b) => a.date.compareTo(b.date));

    return trends;
  }

  Future<List<ProjectStats>> _getProjectStats(
    DateTime startDate,
    DateTime endDate,
  ) async {
    final projects = await _firebaseService.getProjects();
    final contributions = await _firebaseService.getContributions();

    final filteredContributions = contributions.where((c) {
      return c.createdAt.isAfter(startDate) && c.createdAt.isBefore(endDate);
    }).toList();

    final List<ProjectStats> stats = [];
    for (final project in projects) {
      final projectContributions = filteredContributions
          .where((c) => c.projectId == project.id)
          .toList();

      final activeUsers = projectContributions
          .map((c) => c.userId)
          .toSet()
          .length;

      stats.add(ProjectStats(
        project: project,
        contributionCount: projectContributions.length,
        activeUsers: activeUsers,
      ));
    }

    // Sort by contribution count descending
    stats.sort((a, b) => b.contributionCount.compareTo(a.contributionCount));
    return stats;
  }

  Future<List<UserActivity>> _getUserActivities(
    DateTime startDate,
    DateTime endDate,
  ) async {
    final users = await _firebaseService.getUsers();
    final contributions = await _firebaseService.getContributions();

    final filteredContributions = contributions.where((c) {
      return c.createdAt.isAfter(startDate) && c.createdAt.isBefore(endDate);
    }).toList();

    final List<UserActivity> activities = [];
    for (final user in users) {
      final userContributions = filteredContributions
          .where((c) => c.userId == user.id)
          .toList();

      if (userContributions.isNotEmpty) {
        final lastActivity = userContributions
            .map((c) => c.createdAt)
            .reduce((a, b) => a.isAfter(b) ? a : b);

        activities.add(UserActivity(
          user: user,
          contributionCount: userContributions.length,
          lastActivity: lastActivity,
        ));
      }
    }

    // Sort by contribution count descending
    activities.sort((a, b) => b.contributionCount.compareTo(a.contributionCount));
    return activities;
  }
}

// Providers
final analyticsServiceProvider = Provider<AnalyticsService>((ref) {
  final firebaseService = ref.watch(firebaseServiceProvider);
  return AnalyticsService(firebaseService);
});

final analyticsDataProvider = FutureProvider.family<AnalyticsData, DateRange?>((ref, dateRange) async {
  final analyticsService = ref.watch(analyticsServiceProvider);
  final user = ref.watch(authProvider);
  
  // Only fetch analytics for authenticated users
  if (user == null) {
    return AnalyticsData.empty();
  }

  return analyticsService.getAnalyticsData(
    startDate: dateRange?.startDate,
    endDate: dateRange?.endDate,
  );
});

// User-specific analytics
final userAnalyticsProvider = FutureProvider.family<UserAnalytics, String>((ref, userId) async {
  final firebaseService = ref.watch(firebaseServiceProvider);
  final contributions = await firebaseService.getContributions();
  final userContributions = contributions.where((c) => c.userId == userId).toList();
  
  return UserAnalytics(
    totalContributions: userContributions.length,
    averageContributionsPerWeek: _calculateWeeklyAverage(userContributions),
    mostActiveProject: await _getMostActiveProject(userContributions, firebaseService),
    contributionStreak: _calculateContributionStreak(userContributions),
  );
});

// Helper class for date ranges
class DateRange {
  final DateTime startDate;
  final DateTime endDate;

  const DateRange({
    required this.startDate,
    required this.endDate,
  });

  factory DateRange.lastWeek() {
    final now = DateTime.now();
    return DateRange(
      startDate: now.subtract(const Duration(days: 7)),
      endDate: now,
    );
  }

  factory DateRange.lastMonth() {
    final now = DateTime.now();
    return DateRange(
      startDate: DateTime(now.year, now.month - 1, now.day),
      endDate: now,
    );
  }

  factory DateRange.lastYear() {
    final now = DateTime.now();
    return DateRange(
      startDate: DateTime(now.year - 1, now.month, now.day),
      endDate: now,
    );
  }
}

// User-specific analytics model
class UserAnalytics {
  final int totalContributions;
  final double averageContributionsPerWeek;
  final Project? mostActiveProject;
  final int contributionStreak;

  const UserAnalytics({
    required this.totalContributions,
    required this.averageContributionsPerWeek,
    this.mostActiveProject,
    required this.contributionStreak,
  });
}

// Helper functions
double _calculateWeeklyAverage(List<Contribution> contributions) {
  if (contributions.isEmpty) return 0.0;
  
  final firstContribution = contributions.map((c) => c.createdAt).reduce((a, b) => a.isBefore(b) ? a : b);
  final lastContribution = contributions.map((c) => c.createdAt).reduce((a, b) => a.isAfter(b) ? a : b);
  final totalWeeks = lastContribution.difference(firstContribution).inDays / 7;
  
  return totalWeeks > 0 ? contributions.length / totalWeeks : contributions.length.toDouble();
}

Future<Project?> _getMostActiveProject(List<Contribution> contributions, FirebaseService firebaseService) async {
  if (contributions.isEmpty) return null;
  
  final projectCounts = <String, int>{};
  for (final contribution in contributions) {
    projectCounts[contribution.projectId] = (projectCounts[contribution.projectId] ?? 0) + 1;
  }
  
  final mostActiveProjectId = projectCounts.entries
      .reduce((a, b) => a.value > b.value ? a : b)
      .key;
  
  final projects = await firebaseService.getProjects();
  return projects.where((p) => p.id == mostActiveProjectId).firstOrNull;
}

int _calculateContributionStreak(List<Contribution> contributions) {
  if (contributions.isEmpty) return 0;
  
  contributions.sort((a, b) => b.createdAt.compareTo(a.createdAt));
  
  int streak = 0;
  DateTime currentDate = DateTime.now();
  
  for (final contribution in contributions) {
    final contributionDate = DateTime(
      contribution.createdAt.year,
      contribution.createdAt.month,
      contribution.createdAt.day,
    );
    final checkDate = DateTime(
      currentDate.year,
      currentDate.month,
      currentDate.day,
    );
    
    if (contributionDate == checkDate || contributionDate == checkDate.subtract(const Duration(days: 1))) {
      streak++;
      currentDate = contributionDate;
    } else {
      break;
    }
  }
  
  return streak;
}