import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotificationLocalService {
  final FlutterLocalNotificationsPlugin _notifications =
      FlutterLocalNotificationsPlugin();

  Future<void> init() async {
    const android = AndroidInitializationSettings('@mipmap/ic_launcher');

    const settings = InitializationSettings(android: android);

    await _notifications.initialize(settings: settings);

    await _notifications
        .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin
        >()
        ?.requestNotificationsPermission();
  }

  Future<void> mostrarNotificacion({
    required String titulo,
    required String mensaje,
  }) async {
    const androidDetails = AndroidNotificationDetails(
      'inscripciones_channel',
      'Inscripciones',
      channelDescription: 'Notificaciones de inscripción',
      importance: Importance.max,
      priority: Priority.high,
      playSound: true,
    );

    const details = NotificationDetails(android: androidDetails);

    await _notifications.show(
      id: DateTime.now().millisecondsSinceEpoch ~/ 1000,
      title: titulo,
      body: mensaje,
      notificationDetails: details,
    );
  }
}
