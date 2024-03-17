import 'package:flutter/material.dart';
import '../components/app_bar.dart';
import '../services/firestore_service.dart';
import '../services/firestore_qtn.dart';
import '../components/questionTile.dart';
import '../theme/dark_theme.dart';
import '../pages/view_quiz.dart';
import '../theme/light_theme.dart'; // Assuming you have a custom quiz card component

class AdminForm extends StatefulWidget {
  @override
  _AdminFormState createState() => _AdminFormState();
}

class _AdminFormState extends State<AdminForm> {
  final _formKey = GlobalKey<FormState>();
  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _firestoreService = FirestoreService();
  final _quizQuestionService = QuizQuestionService();

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).brightness == Brightness.dark
          ? darkMode
          : lightMode,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Create Quiz'),
          actions: [
            IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ViewQuizzesPage()),
                );
              },
              icon: Icon(Icons.list),
            ),
            IconButton(
              onPressed: () {
                // Action to view marks
              },
              icon: Icon(Icons.grade),
            ),
            IconButton(
              onPressed: () {
                // Action to delete quiz
              },
              icon: Icon(Icons.delete),
            ),
            IconButton(
              onPressed: () {
                // Action to delete questions
              },
              icon: Icon(Icons.delete_forever),
            ),
          ],
        ),
        body: Padding(
          padding: EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: ListView(
              children: [
                TextFormField(
                  controller: _titleController,
                  decoration: InputDecoration(
                    labelText: 'Quiz Title',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter a title';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 16.0),
                TextFormField(
                  controller: _descriptionController,
                  decoration: InputDecoration(
                    labelText: 'Quiz Description',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter a description';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 16.0),
                ..._quizQuestionService.questions
                    .asMap()
                    .entries
                    .map((entry) => QuestionTile(
                          question: entry.value,
                          index: entry.key,
                          onChanged: (updatedQuestion) {
                            setState(() {
                              _quizQuestionService.questions[entry.key] =
                                  updatedQuestion;
                            });
                          },
                        )),
                SizedBox(height: 16.0),
                ElevatedButton(
                  onPressed: _addQuestion,
                  child: Text(
                    'Add Question',
                    style: TextStyle(color: Colors.white),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Theme.of(context).colorScheme.primary,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0),
                    ),
                  ),
                ),
                SizedBox(height: 16.0),
                ElevatedButton(
                  onPressed: _saveQuiz,
                  child: Text(
                    'Save Quiz',
                    style: TextStyle(color: Colors.white),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Theme.of(context).colorScheme.primary,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        backgroundColor: Colors.grey[200],
      ),
    );
  }

  void _saveQuiz() async {
    if (_formKey.currentState!.validate()) {
      final quizData = {
        'title': _titleController.text,
        'description': _descriptionController.text,
      };

      final quizId = await _firestoreService.saveQuiz(quizData);

      for (final question in _quizQuestionService.questions) {
        await _firestoreService.addQuestion(question, quizId);
      }

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'Quiz saved successfully',
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.green,
        ),
      );
    }
  }

  void _addQuestion() {
    setState(() {
      _quizQuestionService.addQuestion(
        question: '',
        options: ['', '', '', ''],
        correctOption: 0,
      );
    });
  }
}
