import 'package:flutter/material.dart';

class QuizzUserPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Quizz User Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Welcome to the Quizz User Page!',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Implement logic to start the quiz
                // Navigator.push(context, MaterialPageRoute(builder: (context) => QuizPage()));
              },
              child: Text('Start Quiz'),
            ),
          ],
        ),
      ),
    );
  }
}
