import 'dart:typed_data';
import 'package:flutter/material.dart';
import '../theme/light_theme.dart';
import '../theme/dark_theme.dart';

class ContactCard extends StatelessWidget {
  final String name;
  final String email;
  final String phone;
  final Uint8List avatar;

  const ContactCard({
    Key? key,
    required this.name,
    required this.email,
    required this.phone,
    required this.avatar,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: ListTile(
        leading: CircleAvatar(
          backgroundImage: avatar != null ? MemoryImage(avatar) : null,
        ),
        title: Text(
          name,
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 4),
            Text(
              email,
              style: TextStyle(
                fontSize: 12,
                color: Theme.of(context).colorScheme.onPrimary,
              ),
            ),
            SizedBox(height: 4),
            Text(
              phone,
              style: TextStyle(
                fontSize: 12,
                color: Theme.of(context).colorScheme.onPrimary,
              ),
            ),
            SizedBox(height: 4),
          ],
        ),
      ),
    );
  }
}
