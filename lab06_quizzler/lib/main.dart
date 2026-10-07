import 'package:flutter/material.dart';

import 'quiz_brain.dart';

void main() {
  runApp(const QuizzlerApp());
}

class QuizzlerApp extends StatelessWidget {
  const QuizzlerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Quizzler',
      theme: ThemeData(useMaterial3: true),
      home: const QuizPage(),
    );
  }
}

class QuizPage extends StatefulWidget {
  const QuizPage({super.key});

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  final QuizBrain _quizBrain = QuizBrain();

  final List<Icon> _scoreKeeper = [];

  int _correctAnswers = 0;

  Future<void> _checkAnswer(bool userAnswer) async {
    final correctAnswer = _quizBrain.getCorrectAnswer();
    final finished = _quizBrain.isFinished();

    setState(() {
      if (userAnswer == correctAnswer) {
        _correctAnswers++;

        _scoreKeeper.add(
          const Icon(Icons.check_circle, color: Colors.greenAccent),
        );
      } else {
        _scoreKeeper.add(const Icon(Icons.cancel, color: Colors.redAccent));
      }

      if (!finished) {
        _quizBrain.nextQuestion();
      }
    });

    if (finished && mounted) {
      await _showResultDialog();
    }
  }

  Future<void> _showResultDialog() async {
    final totalQuestions = _quizBrain.getTotalQuestions();

    await showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return AlertDialog(
          title: const Text('Quiz Complete!'),
          content: Text('Your score: $_correctAnswers / $totalQuestions'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('RESTART'),
            ),
          ],
        );
      },
    );

    if (!mounted) {
      return;
    }

    setState(() {
      _quizBrain.reset();
      _scoreKeeper.clear();
      _correctAnswers = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    final currentQuestion = _quizBrain.getCurrentQuestionNumber();
    final totalQuestions = _quizBrain.getTotalQuestions();

    return Scaffold(
      backgroundColor: const Color(0xFF101820),
      appBar: AppBar(
        backgroundColor: const Color(0xFF101820),
        foregroundColor: Colors.white,
        centerTitle: true,
        title: const Text(
          'Quizzler',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Question $currentQuestion / $totalQuestions',
                textAlign: TextAlign.center,
                style: const TextStyle(color: Colors.white60, fontSize: 16),
              ),
              const SizedBox(height: 20),
              Expanded(
                child: Center(
                  child: Text(
                    _quizBrain.getQuestionText(),
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 27,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  _checkAnswer(true);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 18),
                ),
                child: const Text(
                  'TRUE',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 14),
              ElevatedButton(
                onPressed: () {
                  _checkAnswer(false);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 18),
                ),
                child: const Text(
                  'FALSE',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 20),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(children: _scoreKeeper),
              ),
              const SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}
