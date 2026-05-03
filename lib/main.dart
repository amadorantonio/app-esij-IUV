import 'package:app_escuela_judicial/data/local/database_helper.dart';
import 'package:flutter/material.dart';
import 'features/actividades/data/datasourses/actividades_remote_datasource.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';


Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  print("Mensaje en background: ${message.messageId}");
}

void main() async {

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ActividadesPage(),
    );
  }
}

class ActividadesPage extends StatefulWidget {
  @override
  _ActividadesPageState createState() => _ActividadesPageState();
}

class _ActividadesPageState extends State<ActividadesPage> {
  final service = ActividadesRemoteDataSource();

  List<Map<String, dynamic>> actividades = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    setupNotifications();
    fetchActividades();
  }

Future<void> setupNotifications() async {
  FirebaseMessaging messaging = FirebaseMessaging.instance;

  await messaging.requestPermission();

  String? token = await messaging.getToken();
  print("TOKEN: $token");

  FirebaseMessaging.onMessage.listen((RemoteMessage message) {
     print('Notificación: ${message.notification?.title}');

    Fluttertoast.showToast(
      msg: "${message.notification?.title}\n${message.notification?.body}",
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
    );
  });
}

  Future<void> fetchActividades() async {
    final data = await service.getActividades();
    cargarActividades(data);

    setState(() {
      actividades = data;
      isLoading = false;
    });
  }

  // Función para cargar actividades en SQLite y mostrar mensaje con el número de actividades guardadas
  Future<void> cargarActividades(data) async {
    try {
      final actividades = data;

      // Guardar en SQLite
      for (var act in actividades) {
        await DatabaseHelper.instance.insertActividad(act);
      }

      // Leer desde SQLite
      final dataLocal = await DatabaseHelper.instance.getActividades();

      // Mostrar mensaje con el número de actividades guardadas en sqlite
      Fluttertoast.showToast(
        msg: "${actividades.length} actividades cargadas y guardadas localmente en SQLite",
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 3,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 30.0
      );

      print(dataLocal);
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de actividades del mes de enero del 2020'),
      ),
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: actividades.length,
              itemBuilder: (context, index) {
                final actividad = actividades[index];

                return ListTile(
                  leading: CircleAvatar(
                    child: Text('${index + 1}'),
                  ),
                  title: Text(actividad['NombreActividad']),
                  subtitle: Text(actividad['Destinatarios']),
                );
              },
            ),
    );
  }
}