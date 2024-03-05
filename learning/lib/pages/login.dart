import 'package:flutter/material.dart';
import '../components/app_bar.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: CustomAppBar(appBarText: 'Welcome Back!'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              decoration: InputDecoration(
                labelText: 'Username',
              ),
            ),
            TextField(
              decoration: InputDecoration(
                labelText: 'Password',
              ),
              obscureText: true,
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // Perform login logic here
                // For demonstration purposes, let's assume successful login
                Navigator.pushReplacementNamed(context, '/home');
              },
              child: Text('Login'),
            ),
          ],
        ),
      ),
    );
  }
}
