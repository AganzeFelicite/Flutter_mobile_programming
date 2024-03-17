import 'package:cloud_firestore/cloud_firestore.dart';
import '../model/Quiz.dart';
import '../model/Question.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Quiz Operations
  Future<String> saveQuiz(Map<String, dynamic> quizData) async {
    final quizRef = _firestore.collection('quizzes').doc();
    final quizId = quizRef.id;
    await quizRef.set({
      'id': quizId,
      'title': quizData['title'],
      'description': quizData['description'],
      'questionIds': [],
    });
    return quizId;
  }

  Future<List<Quiz>?> getQuizzes() async {
    final snapshot = await _firestore.collection('quizzes').get();
    if (snapshot.docs.isNotEmpty) {
      return snapshot.docs.map((doc) {
        final data = doc.data() as Map<String, dynamic>;
        final List<String> questionIds =
            List<String>.from(data['questionIds'] ?? []);
        return Quiz.fromMap({
          ...data,
          'questionIds': questionIds,
        });
      }).toList();
    }
    return null;
  }

  Future<Quiz?> getQuiz(String quizId) async {
    final snapshot = await _firestore.collection('quizzes').doc(quizId).get();
    if (snapshot.exists) {
      return Quiz.fromMap(snapshot.data()!);
    }
    return null;
  }

  Future<void> updateQuiz(Quiz quiz) async {
    await _firestore.collection('quizzes').doc(quiz.id).update(quiz.toMap());
  }

  Future<void> deleteQuiz(String quizId) async {
    await _firestore.collection('quizzes').doc(quizId).delete();
  }

  // Question Operations
  Future<void> addQuestion(
      Map<String, dynamic> questionData, String quizId) async {
    final questionRef = _firestore.collection('questions').doc();
    final questionId = questionRef.id;
    await questionRef.set({
      'id': questionId,
      'quizId': quizId,
      'question': questionData['question'],
      'options': questionData['options'],
      'correctOption': questionData['correctOption'],
    });

    // Update the questionIds list in the quiz document
    await _firestore.collection('quizzes').doc(quizId).update({
      'questionIds': FieldValue.arrayUnion([questionId]),
    });
  }

  Future<Question?> getQuestion(String questionId) async {
    final snapshot =
        await _firestore.collection('questions').doc(questionId).get();
    if (snapshot.exists) {
      return Question.fromMap(snapshot.data()!);
    }
    return null;
  }

  Future<void> updateQuestion(Question question) async {
    await _firestore
        .collection('questions')
        .doc(question.id)
        .update(question.toMap());
  }

  Future<void> deleteQuestion(String questionId) async {
    await _firestore.collection('questions').doc(questionId).delete();
  }
}
