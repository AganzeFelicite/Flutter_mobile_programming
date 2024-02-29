import 'package:flutter/material.dart';
import 'package:learning/pages/calculator.dart';
import '../theme/light_theme.dart';
import '../theme/dark_theme.dart';
import '../components/app_bar.dart';
import '../pages/settings.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    List<Widget> pages = [
      Container(
        width: double.infinity,
        height: double.infinity,
        color: Theme.of(context).colorScheme.primary,
      ),
      Calculator(),
      SettingsPage(),
    ];
    return Scaffold(
      appBar:
          currentPageIndex == 0 ? CustomAppBar(appBarText: 'Home Page') : null,
      body: pages[currentPageIndex],
      bottomNavigationBar: NavigationBar(
        destinations: const [
          NavigationDestination(icon: Icon(Icons.home), label: 'home'),
          NavigationDestination(icon: Icon(Icons.contacts), label: 'contacts'),
          NavigationDestination(icon: Icon(Icons.settings), label: 'Settings'),
          NavigationDestination(icon: Icon(Icons.image), label: 'galery'),
          NavigationDestination(
              icon: Icon(Icons.calculate), label: 'calculator'),
          NavigationDestination(icon: Icon(Icons.quiz), label: 'quizz'),
        ],
        selectedIndex: currentPageIndex,
        onDestinationSelected: (int index) {
          setState(() {
            currentPageIndex = index;
          });
        },
        indicatorColor: Theme.of(context).colorScheme.secondary,
      ),
    );
  }
}
