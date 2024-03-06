import 'package:flutter/material.dart';
import 'package:learning/pages/login.dart';
import 'pages/home.dart';
import './theme/light_theme.dart';
import './provider/provider.dart';
import 'package:provider/provider.dart';
import './theme/dark_theme.dart';
import 'package:firebase_core/firebase_core.dart';
import 'pages/signup.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => UiProvider()..init(),
      child:
          Consumer<UiProvider>(builder: (context, UiProvider notifier, child) {
        return MaterialApp(
          routes: {
            '/home': (context) =>
                Home(userRole: Provider.of<UiProvider>(context).userRole),
            '/login': (context) => LoginPage(),
            '/signup': (context) => SignUpPage(),
          },
          debugShowCheckedModeBanner: false,
          title: 'Dark Theme',
          theme: notifier.isDark ? darkMode : lightMode,
          home: LoginPage(),
        );
      }),
    );
  }
}
