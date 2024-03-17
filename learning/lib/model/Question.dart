class Question {
  String id;
  String quizId;
  String question;
  List<String> options;
  int correctOption;

  Question({
    required this.id,
    required this.quizId,
    required this.question,
    required this.options,
    required this.correctOption,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'quizId': quizId,
      'question': question,
      'options': options,
      'correctOption': correctOption,
    };
  }

  factory Question.fromMap(Map<String, dynamic> map) {
    return Question(
      id: map['id'] ?? '',
      quizId: map['quizId'] ?? '',
      question: map['question'] ?? '',
      options: List<String>.from(map['options'] ?? []),
      correctOption: map['correctOption'] ?? 0,
    );
  }
}
