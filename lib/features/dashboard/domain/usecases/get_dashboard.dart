import 'package:app_escuela_judicial/features/dashboard/domain/entities/dashboard.dart';
import 'package:app_escuela_judicial/features/dashboard/domain/entities/repositories/dashboard_repository.dart';

class GetDashboard {
  final DashboardRepository repository;

  GetDashboard(this.repository);

  Future<Dashboard> call() async {
    return await repository.getDashboard();
  }
}