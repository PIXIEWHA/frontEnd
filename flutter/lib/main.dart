import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:pixie/Screens/Main/main.dart';
import 'package:pixie/Screens/Welcome/welcome_screen.dart';
import 'package:pixie/api/api.dart';
import 'package:pixie/constants.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
  print('Handling a background message ${message.messageId}');
}

AndroidNotificationChannel channel = AndroidNotificationChannel(
    'high_importance_channel',
    'High Importance Notifications',
    'import notifications',
    importance: Importance.high,
    playSound: true);

FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  await flutterLocalNotificationsPlugin
      .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin>()
      ?.createNotificationChannel(channel);

  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  // FCM 토큰 cBRwgIapRVyv7r4t5CfekZ:APA91bH-K3PutC9OECT-29Knkh-QLybNCC9_38KjC0N5P3rDL83c4AJLwEOhoWU5kpP-8ge3RXOAlms0f9khMiNE2bkSj5kBDueSxRPHdQdsitxGPizrTiPWsSys43ZwBRiHlM41NlCr
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  Future<bool> autoLogin() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool? check = prefs.getBool('loginStatus');

    if (check != null) {
      return check;
    }
    return false;
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider<RbProvider>(create: (context) => RbProvider()),
          ChangeNotifierProvider<UserProvider>(
              create: (context) => UserProvider()),
          ChangeNotifierProvider<ReportProvider>(
              create: (context) => ReportProvider()),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Pixie',
          theme: ThemeData(
            primaryColor: kPrimaryColor,
            scaffoldBackgroundColor: Colors.white,
          ),
          home: FutureBuilder<bool>(
            future: autoLogin(),
            builder: (context, snapshot) {
              if (snapshot.data == true) {
                return MainScreen();
              } else {
                return WelcomeScreen();
              }
            },
          ),
        ));
  }
}
