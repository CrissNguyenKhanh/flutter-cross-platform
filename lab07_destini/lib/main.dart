import 'package:flutter/material.dart';

import 'story.dart';
import 'story_brain.dart';

void main() {
  runApp(const DestiniApp());
}

class DestiniApp extends StatelessWidget {
  const DestiniApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Destini',
      theme: ThemeData(useMaterial3: true),
      home: const StoryPage(),
    );
  }
}

class StoryPage extends StatefulWidget {
  const StoryPage({super.key});

  @override
  State<StoryPage> createState() => _StoryPageState();
}

class _StoryPageState extends State<StoryPage> {
  final StoryBrain _storyBrain = StoryBrain();

  void _makeChoice(int choiceIndex) {
    setState(() {
      _storyBrain.choose(choiceIndex);
    });
  }

  void _restartStory() {
    setState(() {
      _storyBrain.restart();
    });
  }

  @override
  Widget build(BuildContext context) {
    final Story story = _storyBrain.currentStory;

    return Scaffold(
      backgroundColor: const Color(0xFF101820),
      appBar: AppBar(
        backgroundColor: const Color(0xFF101820),
        foregroundColor: Colors.white,
        centerTitle: true,
        title: const Text(
          'Destini',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Icon(Icons.auto_stories, color: Colors.white70, size: 50),
              const SizedBox(height: 20),
              Expanded(
                child: Center(
                  child: Text(
                    story.text,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      height: 1.5,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
              if (!_storyBrain.isFinished)
                ...List.generate(story.choices.length, (index) {
                  final choice = story.choices[index];

                  return Padding(
                    padding: const EdgeInsets.only(bottom: 14),
                    child: ElevatedButton(
                      onPressed: () {
                        _makeChoice(index);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: index == 0
                            ? Colors.blue
                            : Colors.deepOrange,
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 18,
                        ),
                      ),
                      child: Text(
                        choice.text,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  );
                }),
              if (_storyBrain.isFinished)
                ElevatedButton.icon(
                  onPressed: _restartStory,
                  icon: const Icon(Icons.restart_alt),
                  label: const Text(
                    'RESTART STORY',
                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 18),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
