


import 'package:pta_contrib/Features/Projects/Data/model/model.dart';

class ProjectRepositoryImpl implements ProjectRepository {
  final ProjectRemoteDataSource remoteDataSource;

  ProjectRepositoryImpl({required this.remoteDataSource});

  @override
  Future<List<Project>> getActiveProjects() async {

    return await remoteDataSource.getActiveProjects();
  }

  @override
  Future<void> makeContribution(String projectId, double amount) {

    throw UnimplementedError();
  }
}