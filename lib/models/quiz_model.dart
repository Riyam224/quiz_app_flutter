// todo question class
class Question {
  String? questionText;
  List<Answer> answerList;
// todo constructor
  Question(this.questionText, this.answerList);
}

// todo answer class
class Answer {
  String? AnswerText;
  bool isCorrect;
  // todo constructor
  Answer(this.AnswerText, this.isCorrect);
}

// *
List<Question> getQuestion() {
  List<Question> qlist = [];
  qlist.add(Question(
    'Youtube is _____ platform?',
    [
      Answer('Music Sharing', false),
      Answer('Video Shaeing ', false),
      Answer('Live Streaming', false),
      Answer('All the above ', true)
    ],
  ));

  qlist.add(Question(
    'Flutter is developed by _____',
    [
      Answer('Google', true),
      Answer('Meta', false),
      Answer('Microsoft', false),
      Answer('Twitter', false),
    ],
  ));
  qlist.add(Question(
    'Which of the following language is used to build flutter app?',
    [
      Answer('Go', false),
      Answer('Dart', true),
      Answer('Java', false),
      Answer('React', false),
    ],
  ));
  qlist.add(Question(
    'What are the features of Flutter?',
    [
      Answer('Fast development', false),
      Answer('Huge widget catalog', false),
      Answer('High-performance', false),
      Answer('All of the above', true),
    ],
  ));
  qlist.add(Question(
    'Everything is a widget in Flutter. True or False?',
    [
      Answer('True', true),
      Answer('False', false),
    ],
  ));
  qlist.add(Question(
    'Choose the best editors for Flutter app development.',
    [
      Answer('VS Code', false),
      Answer('Sublime Text', false),
      Answer('Android Studio', false),
      Answer('All of the above', true),
    ],
  ));

  return qlist;
}
