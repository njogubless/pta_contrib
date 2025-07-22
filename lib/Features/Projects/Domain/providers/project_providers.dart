import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pta_contrib/Features/Projects/Data/model/model.dart';
import 'package:pta_contrib/Features/Projects/Domain/providers/project_repository_impl.dart';


// 1. Provider for FirebaseFirestore instance
final firestoreProvider = Provider<FirebaseFirestore>((ref) => FirebaseFirestore.instance);

// 2. Provider for the DataSource
final projectRemoteDataSourceProvider = Provider<ProjectRemoteDataSource>(
  (ref) => ProjectRemoteDataSourceImpl(ref.watch(firestoreProvider)),
);

// 3. Provider for the Repository
final projectRepositoryProvider = Provider<ProjectRepository>(
  (ref) => ProjectRepositoryImpl(remoteDataSource: ref.watch(projectRemoteDataSourceProvider)),
);

// 4. Provider to fetch the list of projects (FutureProvider is great for one-off async ops)
final projectsProvider = FutureProvider.autoDispose<List<Project>>((ref) async {
  // It watches the repository provider and calls the method.
  // autoDispose will cache the state but destroy it when no longer listened to.
  final projectRepository = ref.watch(projectRepositoryProvider);
  return projectRepository.getActiveProjects();
});