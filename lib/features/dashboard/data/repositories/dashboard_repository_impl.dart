import 'package:app_escuela_judicial/features/dashboard/data/datasources/dashboard_remote_datasource.dart';
import 'package:app_escuela_judicial/features/dashboard/domain/entities/dashboard.dart';
import 'package:app_escuela_judicial/features/dashboard/domain/entities/repositories/dashboard_repository.dart';

class DashboardRepositoryImpl implements DashboardRepository {

  final DashboardRemoteDatasource remoteDataSource;

  DashboardRepositoryImpl(this.remoteDataSource);

  @override
  Future<Dashboard> getDashboard() async {

    final dashboard = await remoteDataSource.getDashboard();

    return dashboard as Dashboard;
  }
}