class Quiz {
  String id;
  String title;
  String description;
  List<String> questionIds;

  Quiz({
    required this.id,
    required this.title,
    required this.description,
    required this.questionIds,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'questionIds': questionIds,
    };
  }

  // factory Quiz.fromMap(Map<String, dynamic> map) {
  //   return Quiz(
  //     id: map['id'] ?? '',
  //     title: map['title'] ?? '',
  //     description: map['description'] ?? '',
  //     questionIds: List<String>.from(map['questionIds'] ?? []),
  //   );
  // }
  factory Quiz.fromMap(Map<String, dynamic> map) {
    return Quiz(
      id: map['id'],
      title: map['title'],
      description: map['description'],
      questionIds: List<String>.from(map['questionIds']),
    );
  }
}
