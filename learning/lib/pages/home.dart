import 'package:flutter/material.dart';
import 'package:learning/pages/calculator.dart';
import '../theme/light_theme.dart';
import '../theme/dark_theme.dart';
import '../components/app_bar.dart';
import '../pages/settings.dart';
import '../pages/contacts.dart';
import '../pages/images.dart';
import '../pages/login.dart';
import '../components/myAvatar.dart';
import '../pages/admin.dart';
import '../pages/userQuizzPage.dart';

class Home extends StatefulWidget {
  final String userRole;
  Home({Key? key, required this.userRole}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int currentPageIndex = 0;
  bool isLoggedIn = true;
  bool admin = false;

  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic>? args =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;
    final String userRole = args?['userRole'] ?? '';

    if (userRole == 'admin') {
      admin = true;
    } else {
      admin = false;
    }
    List<Widget> pages = [
      Container(
        width: double.infinity,
        height: double.infinity,
        color: Theme.of(context).colorScheme.primary,
      ),
      Contacts(),
      SettingsPage(),
      PhoneImages(),
      Calculator(),
      if (admin) QuizzAdminPage() else QuizzUserPage(),
    ];
    return Scaffold(
      appBar:
          currentPageIndex == 0 ? CustomAppBar(appBarText: 'Home Page') : null,
      body: pages[currentPageIndex],
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              child: Column(
                children: [
                  Center(child: MyAvatarWidget()),
                  SizedBox(height: 8),
                  Text('John Doe'),
                ],
              ),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('Home'),
              onTap: () {
                setState(() {
                  currentPageIndex = 0;
                });
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.contacts),
              title: Text('Contacts'),
              onTap: () {
                setState(() {
                  currentPageIndex = 1;
                });
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Settings'),
              onTap: () {
                setState(() {
                  currentPageIndex = 2;
                });
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.image),
              title: Text('Gallery'),
              onTap: () {
                setState(() {
                  currentPageIndex = 3;
                });
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.calculate),
              title: Text('Calculator'),
              onTap: () {
                setState(() {
                  currentPageIndex = 4;
                });
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.quiz),
              title: Text('Quizz'),
              onTap: () {
                setState(() {
                  currentPageIndex = 5;
                });
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.logout),
              title: Text('Logout'),
              onTap: () {
                setState(() {
                  isLoggedIn = false;
                  Navigator.pushReplacementNamed(context, '/login');
                });
                // Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
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
          if (isLoggedIn) {
            setState(() {
              currentPageIndex = index;
            });
          } else {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: Text('Unauthorized Access'),
                  content: Text('Please login to access this page.'),
                  actions: [
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                        // Redirect to login page
                        setState(() {
                          currentPageIndex = 0;
                        });
                      },
                      child: Text('OK'),
                    ),
                  ],
                );
              },
            );
          }
        },
        indicatorColor: Theme.of(context).colorScheme.secondary,
      ),
    );
  }
}
