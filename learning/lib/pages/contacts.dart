// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:contacts_service/contacts_service.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:url_launcher/url_launcher.dart'; // Import the url_launcher package
import '../components/app_bar.dart';
import '../components/contact_card.dart';
import 'dart:typed_data';

class Contacts extends StatefulWidget {
  const Contacts({Key? key}) : super(key: key);

  @override
  _ContactsState createState() => _ContactsState();
}

class _ContactsState extends State<Contacts> {
  List<Contact> contacts = [];

  Future<void> _getContacts() async {
    if (await Permission.contacts.request().isGranted) {
      final List<Contact> fetchedContacts = await ContactsService.getContacts();
      setState(() {
        contacts = fetchedContacts;
      });
    } else {
      print('Permission denied');
    }
  }

  // Function to launch the dialer with the provided phone number
  Future<void> _launchDialer(String phoneNumber) async {
    final Uri phoneLaunchUri = Uri(scheme: 'tel', path: phoneNumber);
    if (await canLaunch(phoneLaunchUri.toString())) {
      await launch(phoneLaunchUri.toString());
    } else {
      print('Could not launch dialer');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(appBarText: "List of Contacts"),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: Theme.of(context).colorScheme.primary,
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            ElevatedButton(
              onPressed: _getContacts,
              child: Text(
                'Get Contacts',
                style: TextStyle(
                  color: Theme.of(context).colorScheme.onPrimary,
                ),
              ),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(
                    Theme.of(context).colorScheme.secondary),
              ),
            ),
            SizedBox(height: 16.0),
            Expanded(
              child: ListView.builder(
                itemCount: contacts.length,
                itemBuilder: (context, index) {
                  final contact = contacts[index];
                  return GestureDetector(
                    onTap: () {
                      if (contact.phones?.isNotEmpty == true) {
                        _launchDialer(contact.phones!.first.value ?? '');
                      }
                    },
                    child: ContactCard(
                      name: contact.displayName ?? '',
                      email: contact.emails?.isNotEmpty == true
                          ? contact.emails!.first.value ?? ''
                          : '',
                      phone: contact.phones?.isNotEmpty == true
                          ? contact.phones!.first.value ?? ''
                          : '',
                      avatar: contact.avatar != null
                          ? contact.avatar!
                          : Uint8List(0),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
