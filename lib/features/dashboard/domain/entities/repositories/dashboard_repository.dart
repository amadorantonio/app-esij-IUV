import 'package:app_escuela_judicial/features/dashboard/domain/entities/dashboard.dart';

abstract class DashboardRepository {
  Future<Dashboard> getDashboard();
}