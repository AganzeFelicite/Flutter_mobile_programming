import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../components/app_bar.dart';
import '../theme/light_theme.dart';
import '../provider/provider.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(appBarText: 'Settings Page'),
      body: Consumer<UiProvider>(
        builder: (context, notifier, child) {
          return Column(
            children: [
              ListTile(
                leading: Icon(Icons.dark_mode,
                    color: Theme.of(context).colorScheme.onPrimary),
                title: Text(
                  "Dark theme",
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.onPrimary,
                  ),
                ),
                trailing: Switch(
                  value: notifier.isDark,
                  onChanged: (value) => notifier.changeTheme(),
                  activeColor: Theme.of(context).colorScheme.onPrimary,
                  inactiveThumbColor: Theme.of(context).colorScheme.background,
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
