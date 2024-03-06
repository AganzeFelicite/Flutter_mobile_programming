import 'package:flutter/material.dart';

class QuizzAdminPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Quizz Admin Page'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Add New Quiz Question',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 16),
                  TextField(
                    decoration: InputDecoration(labelText: 'Question'),
                  ),
                  SizedBox(height: 16),
                  TextField(
                    decoration: InputDecoration(labelText: 'Option A'),
                  ),
                  SizedBox(height: 16),
                  TextField(
                    decoration: InputDecoration(labelText: 'Option B'),
                  ),
                  SizedBox(height: 16),
                  TextField(
                    decoration: InputDecoration(labelText: 'Option C'),
                  ),
                  SizedBox(height: 16),
                  TextField(
                    decoration: InputDecoration(labelText: 'Option D'),
                  ),
                  SizedBox(height: 16),
                  TextField(
                    decoration: InputDecoration(labelText: 'Correct Answer'),
                  ),
                  SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {
                      // TODO: Implement logic to add the question to the quiz database
                      // For now, just print the entered values
                      print('Question Added!');
                    },
                    child: Text('Add Question'),
                  ),
                ],
              ),
            ),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      // Navigate to the page where the admin can create a quiz
                      // You need to implement this page separately
                      // Navigator.push(context, MaterialPageRoute(builder: (context) => CreateQuizPage()));
                    },
                    child: Text('Create Quiz'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      // Navigate to the page where the admin can view quiz results
                      // You need to implement this page separately
                      // Navigator.push(context, MaterialPageRoute(builder: (context) => ViewQuizResultsPage()));
                    },
                    child: Text('View Quiz Results'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
