import 'package:app_escuela_judicial/core/services/notification_local_service.dart';
import 'package:app_escuela_judicial/features/home/presentation/pages/home_page.dart';
import 'package:flutter/material.dart';

final notificationService = NotificationLocalService();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await notificationService.init();

  runApp(MyApp(notificationService: notificationService,));
}

class MyApp extends StatelessWidget {
  final NotificationLocalService notificationService;

  const MyApp({super.key, required this.notificationService});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: HomePage(notificationService: notificationService,));
  }
}