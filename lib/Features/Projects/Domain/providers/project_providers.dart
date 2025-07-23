// lib/features/projects/providers/projects_provider.dart
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pta_contrib/Features/Auth/Domain/providers/auth_provider.dart';
import 'package:pta_contrib/Features/Projects/Data/model/model.dart';
import 'package:pta_contrib/services/firebase/firebase_service.dart';
import 'package:uuid/uuid.dart';

// Projects repository provider
final projectsRepositoryProvider = Provider<ProjectsRepository>((ref) {
  final firebaseService = ref.watch(firebaseServiceProvider);
  return ProjectsRepository(firebaseService);
});

// All projects stream provider
final projectsStreamProvider = StreamProvider<List<Project>>((ref) {
  final repository = ref.watch(projectsRepositoryProvider);
  return repository.projectsStream();
});

// Featured projects provider
final featuredProjectsProvider = FutureProvider<List<Project>>((ref) {
  final repository = ref.watch(projectsRepositoryProvider);
  return repository.getFeaturedProjects();
});

// User projects stream provider
final userProjectsStreamProvider = StreamProvider.family<List<Project>, String>((ref, userId) {
  final repository = ref.watch(projectsRepositoryProvider);
  return repository.userProjectsStream(userId);
});

// Single project provider
final projectProvider = FutureProvider.family<Project?, String>((ref, projectId) {
  final repository = ref.watch(projectsRepositoryProvider);
  return repository.getProject(projectId);
});

// Projects controller provider
final projectsControllerProvider = StateNotifierProvider<ProjectsController, ProjectsState>((ref) {
  final repository = ref.watch(projectsRepositoryProvider);
  return ProjectsController(repository);
});

// Recent projects provider (for user's recently viewed projects)
final recentProjectsProvider = StateNotifierProvider<RecentProjectsController, List<Project>>((ref) {
  return RecentProjectsController();
});

class ProjectsRepository {
  final FirebaseService _firebaseService;

  ProjectsRepository(this._firebaseService);

  Stream<List<Project>> projectsStream() {
    return _firebaseService.projectsStream();
  }

  Future<List<Project>> getFeaturedProjects() {
    return _firebaseService.getFeaturedProjects();
  }

  Stream<List<Project>> userProjectsStream(String userId) {
    return _firebaseService.userProjectsStream(userId);
  }

  Future<Project?> getProject(String projectId) {
    return _firebaseService.getProject(projectId);
  }

  Future<void> createProject(Project project) {
    return _firebaseService.createProject(project);
  }

  Future<void> updateProject(Project project) {
    return _firebaseService.updateProject(project);
  }

  Future<void> deleteProject(String projectId) {
    return _firebaseService.deleteProject(projectId);
  }
}

class ProjectsController extends StateNotifier<ProjectsState> {
  final ProjectsRepository _repository;
  final _uuid = const Uuid();

  ProjectsController(this._repository) : super(const ProjectsState.initial());

  Future<void> createProject({
    required String title,
    required String description,
    required double targetAmount,
    required String adminId,
    String? category,
    List<String>? tags,
    DateTime? endDate,
    String? location,
    List<String>? imageUrls,
  }) async {
    state = const ProjectsState.loading();
    try {
      final project = Project(
        id: _uuid.v4(),
        title: title,
        description: description,
        targetAmount: targetAmount,
        adminId: adminId,
        category: category,
        tags: tags ?? [],
        endDate: endDate,
        location: location,
        imageUrls: imageUrls ?? [],
        createdAt: DateTime.now(),
      );

      await _repository.createProject(project);
      state = const ProjectsState.success('Project created successfully');
    } catch (e) {
      state = ProjectsState.error('Failed to create project: $e');
    }
  }

  Future<void> updateProject(Project project) async {
    state = const ProjectsState.loading();
    try {
      final updatedProject = project.copyWith(updatedAt: DateTime.now());
      await _repository.updateProject(updatedProject);
      state = const ProjectsState.success('Project updated successfully');
    } catch (e) {
      state = ProjectsState.error('Failed to update project: $e');
    }
  }

  Future<void> deleteProject(String projectId) async {
    state = const ProjectsState.loading();
    try {
      await _repository.deleteProject(projectId);
      state = const ProjectsState.success('Project deleted successfully');
    } catch (e) {
      state = ProjectsState.error('Failed to delete project: $e');
    }
  }

  Future<void> addProjectUpdate({
    required String projectId,
    required String title,
    required String content,
    required String adminId,
    List<String>? imageUrls,
  }) async {
    state = const ProjectsState.loading();
    try {
      final project = await _repository.getProject(projectId);
      if (project == null) {
        state = const ProjectsState.error('Project not found');
        return;
      }

      final update = ProjectUpdate(
        id: _uuid.v4(),
        title: title,
        content: content,
        adminId: adminId,
        imageUrls: imageUrls ?? [],
        createdAt: DateTime.now(),
      );

      final updatedProject = project.copyWith(
        updates: [...project.updates, update],
        updatedAt: DateTime.now(),
      );

      await _repository.updateProject(updatedProject);
      state = const ProjectsState.success('Project update added successfully');
    } catch (e) {
      state = ProjectsState.error('Failed to add project update')}}}