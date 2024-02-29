import 'package:flutter/material.dart';
import 'pages/home.dart';
import './theme/light_theme.dart';
import './provider/provider.dart';
import 'package:provider/provider.dart';
import './theme/dark_theme.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
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
          debugShowCheckedModeBanner: false,
          title: 'Dark Theme',
          theme: notifier.isDark ? darkMode : lightMode,
          home: const Home(),
        );
      }),
    );
  }
}
