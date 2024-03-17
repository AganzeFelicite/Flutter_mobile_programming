import 'package:flutter/material.dart';
import 'package:learning/components/app_bar.dart';

class StudentScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(appBarText: 'Available Quizzes'),
      body: ListView(
        padding: EdgeInsets.all(16.0),
        children: [
          QuizCard(
            quizTitle: 'Math Quiz',
            quizDescription: 'Test your math skills!',
            onTap: () {
              // Navigate to the quiz screen for the selected quiz
              Navigator.pushNamed(context, '/quiz_screen', arguments: {
                'quizId': 'math_quiz_id', // Pass the quiz ID if needed
              });
            },
          ),
          SizedBox(height: 16.0),
          QuizCard(
            quizTitle: 'Science Quiz',
            quizDescription: 'Explore science topics!',
            onTap: () {
              // Navigate to the quiz screen for the selected quiz
              Navigator.pushNamed(context, '/quiz_screen', arguments: {
                'quizId': 'science_quiz_id', // Pass the quiz ID if needed
              });
            },
          ),
          // Add more QuizCard widgets for additional quizzes
        ],
      ),
    );
  }
}

class QuizCard extends StatelessWidget {
  final String quizTitle;
  final String quizDescription;
  final VoidCallback onTap;

  const QuizCard({
    required this.quizTitle,
    required this.quizDescription,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                quizTitle,
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8.0),
              Text(
                quizDescription,
                style: TextStyle(
                  fontSize: 16.0,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
