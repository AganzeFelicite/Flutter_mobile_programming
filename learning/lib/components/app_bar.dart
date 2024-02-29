import 'package:flutter/material.dart';
import '../theme/light_theme.dart';
import '../theme/dark_theme.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String appBarText;
  const CustomAppBar({Key? key, required this.appBarText}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Theme.of(context).colorScheme.background,
      title: Center(
        child: Text(
          this.appBarText,
          style: TextStyle(
            color: Theme.of(context).colorScheme.primary,
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
