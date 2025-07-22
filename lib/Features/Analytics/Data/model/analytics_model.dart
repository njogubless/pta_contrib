import 'package:firebase_auth/firebase_auth.dart';
import 'package:pta_contrib/Features/Projects/Data/model/model.dart';

class AnalyticsData {
  final int totalContributions;
  final int totalProjects;
  final int totalUsers;
  final double averageContributionsPerProject;
  final List<ContributionTrend> contributionTrends;
  final List<ProjectStats> projectStats;
  final List<UserActivity> userActivities;

  const AnalyticsData({
    required this.totalContributions,
    required this.totalProjects,
    required this.totalUsers,
    required this.averageContributionsPerProject,
    required this.contributionTrends,
    required this.projectStats,
    required this.userActivities,
  });

  factory AnalyticsData.empty() {
    return const AnalyticsData(
      totalContributions: 0,
      totalProjects: 0,
      totalUsers: 0,
      averageContributionsPerProject: 0.0,
      contributionTrends: [],
      projectStats: [],
      userActivities: [],
    );
  }
}

class ContributionTrend {
  final DateTime date;
  final int count;

  const ContributionTrend({
    required this.date,
    required this.count,
  });
}

class ProjectStats {
  final Project project;
  final int contributionCount;
  final int activeUsers;

  const ProjectStats({
    required this.project,
    required this.contributionCount,
    required this.activeUsers,
  });
}

class UserActivity {
  final User user;
  final int contributionCount;
  final DateTime lastActivity;

  const UserActivity({
    required this.user,
    required this.contributionCount,
    required this.lastActivity,
  });
}