class QuizQuestionService {
  List<Map<String, dynamic>> _questions = [];

  void addQuestion({
    required String question,
    required List<String> options,
    required int correctOption,
  }) {
    _questions.add({
      'question': question,
      'options': options,
      'correctOption': correctOption,
    });
  }

  List<Map<String, dynamic>> get questions => _questions;
}
