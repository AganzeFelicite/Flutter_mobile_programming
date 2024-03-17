import 'package:flutter/material.dart';
import 'package:learning/model/Quiz.dart';
import '../components/app_bar.dart'; // Custom AppBar widget
import '../services/firestore_service.dart'; // FirestoreService class for fetching quiz data
import '../theme/dark_theme.dart'; // Dark theme data
import '../theme/light_theme.dart'; // Light theme data
import '../model/Quiz.dart'; // Quiz class

class ViewQuizzesPage extends StatelessWidget {
  final FirestoreService _firestoreService =
      FirestoreService(); // Initialize FirestoreService

  @override
  Widget build(BuildContext context) {
    Future<List<Quiz>?> arr = _firestoreService.getQuizzes();
    print(arr);
    return Theme(
      data: Theme.of(context).brightness == Brightness.dark
          ? darkMode
          : lightMode, // Apply theme based on brightness
      child: Scaffold(
        appBar: CustomAppBar(
            appBarText: 'View Quizzes'), // Custom app bar with title
        body: FutureBuilder<List<Quiz>?>(
          future: _firestoreService.getQuizzes(),
          // Fetch quizzes data from Firestore
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              // Show loading indicator while data is being fetched
              return Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              // Show error message if an error occurs
              return Center(child: Text('Error: ${snapshot.error}'));
            } else if (snapshot.data == null || snapshot.data!.isEmpty) {
              // Show message if no quizzes are available
              return Center(child: Text('No quizzes available.'));
            } else {
              // Display quizzes once data is fetched
              final quizzes = snapshot.data!;
              return ListView.builder(
                itemCount: quizzes.length,
                itemBuilder: (context, index) {
                  final quiz = quizzes[index];
                  return ListTile(
                    title: Text(quiz.title), // Display quiz title
                    subtitle:
                        Text(quiz.description), // Display quiz description
                    onTap: () {
                      // Handle tap on quiz to view details
                      // You can navigate to a details page or show a dialog
                    },
                  );
                },
              );
            }
          },
        ),
      ),
    );
  }
}
