import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:pixie/Screens/Main/main.dart';
import 'package:pixie/Screens/Welcome/welcome_screen.dart';
import 'package:pixie/api/api.dart';
import 'package:pixie/constants.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
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

// pixie에서 flutter로 폴더 제목 바꿈