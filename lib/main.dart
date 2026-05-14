import 'dart:io';

import 'package:app_escuela_judicial/core/services/notification_local_service.dart';
import 'package:app_escuela_judicial/features/home/presentation/pages/home_page.dart';
import 'package:flutter/material.dart';

final notificationService = NotificationLocalService();

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}
void main() async {
  WidgetsFlutterBinding.ensureInitialized();

   HttpOverrides.global = MyHttpOverrides();

  await notificationService.init();

  runApp(MyApp(notificationService: notificationService,));
}

class MyApp extends StatelessWidget {
  final NotificationLocalService notificationService;

  const MyApp({super.key, required this.notificationService});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: HomePage( notificationService: notificationService,));
  }
}

// class ActividadesPage extends StatefulWidget {
//   @override
//   _ActividadesPageState createState() => _ActividadesPageState();
// }

// class _ActividadesPageState extends State<ActividadesPage> {
//   final service = ActividadesRemoteDataSource();

//   List<Map<String, dynamic>> actividades = [];
//   bool isLoading = true;

//   @override
//   void initState() {
//     super.initState();
//     setupNotifications();
//     fetchActividades();
//   }

//   Future<void> fetchActividades() async {
//     final data = await service.getActividades();
//     cargarActividades(data);

//     setState(() {
//       actividades = data;
//       isLoading = false;
//     });
//   }

//     //
//   Future<void> setupNotifications() async {
//     FirebaseMessaging messaging = FirebaseMessaging.instance;

//     await messaging.requestPermission();

//     String? token = await messaging.getToken();
//     print("TOKEN: $token");

//     FirebaseMessaging.onMessage.listen((RemoteMessage message) {
//       print('Notificación: ${message.notification?.title}');

//       Fluttertoast.showToast(
//         msg: "${message.notification?.title}\n${message.notification?.body}",
//         toastLength: Toast.LENGTH_SHORT,
//         gravity: ToastGravity.BOTTOM,
//       );
//     });
//   }

//   // Función para cargar actividades en SQLite y mostrar mensaje con el número de actividades guardadas
//   Future<void> cargarActividades(data) async {
//     try {
//       final actividades = data;

//       // Guardar en SQLite
//       for (var act in actividades) {
//         await DatabaseHelper.instance.insertActividad(act);
//       }

//       // Leer desde SQLite
//       final dataLocal = await DatabaseHelper.instance.getActividades();

//       // Mostrar mensaje con el número de actividades guardadas en sqlite
//       Fluttertoast.showToast(
//         msg: "${actividades.length} actividades cargadas y guardadas localmente en SQLite",
//         toastLength: Toast.LENGTH_LONG,
//         gravity: ToastGravity.CENTER,
//         timeInSecForIosWeb: 3,
//         backgroundColor: Colors.red,
//         textColor: Colors.white,
//         fontSize: 30.0
//       );

//       print(dataLocal);
//     } catch (e) {
//       print(e);
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Lista de actividades del mes de enero del 2020'),
//       ),
//       body: isLoading
//           ? Center(child: CircularProgressIndicator())
//           : ListView.builder(
//               itemCount: actividades.length,
//               itemBuilder: (context, index) {
//                 final actividad = actividades[index];

//                 return ListTile(
//                   leading: CircleAvatar(
//                     child: Text('${index + 1}'),
//                   ),
//                   title: Text(actividad['NombreActividad']),
//                   subtitle: Text(actividad['Destinatarios']),
//                 );
//               },
//             ),
//     );
//   }
// }
