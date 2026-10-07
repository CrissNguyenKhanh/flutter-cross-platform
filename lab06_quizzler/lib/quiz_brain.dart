import 'question.dart';

class QuizBrain {
  final List<Question> _questions = const [
    Question(text: 'Flutter is developed by Google.', answer: true),
    Question(
      text: 'Dart is a programming language used by Flutter.',
      answer: true,
    ),
    Question(
      text: 'StatelessWidget can change its own state using setState().',
      answer: false,
    ),
    Question(
      text: 'Flutter can be used to build Android and iOS applications.',
      answer: true,
    ),
    Question(text: 'A bool value can only be true or false.', answer: true),
    Question(
      text: 'HTML is the main programming language of Flutter.',
      answer: false,
    ),
    Question(
      text: 'setState() tells Flutter that the UI may need to rebuild.',
      answer: true,
    ),
    Question(
      text: 'Flutter applications can only run on mobile devices.',
      answer: false,
    ),
    Question(
      text:
          'MaterialApp is commonly used as the root widget of a Material app.',
      answer: true,
    ),
    Question(text: 'Dart does not support classes.', answer: false),
  ];

  int _currentQuestion = 0;

  String getQuestionText() {
    return _questions[_currentQuestion].text;
  }

  bool getCorrectAnswer() {
    return _questions[_currentQuestion].answer;
  }

  int getCurrentQuestionNumber() {
    return _currentQuestion + 1;
  }

  int getTotalQuestions() {
    return _questions.length;
  }

  bool isFinished() {
    return _currentQuestion == _questions.length - 1;
  }

  void nextQuestion() {
    if (_currentQuestion < _questions.length - 1) {
      _currentQuestion++;
    }
  }

  void reset() {
    _currentQuestion = 0;
  }
}
