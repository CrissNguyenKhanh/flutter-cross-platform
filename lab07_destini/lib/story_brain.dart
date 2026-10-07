import 'story.dart';

class StoryBrain {
  int _currentStoryIndex = 0;

  final List<Story> _stories = const [
    Story(
      text:
          'You are walking alone at night when you reach a fork in the road. '
          'One path leads into a dark forest, while the other leads to an old house.',
      choices: [
        Choice(text: 'Enter the dark forest', nextStory: 1),
        Choice(text: 'Walk toward the old house', nextStory: 2),
      ],
    ),
    Story(
      text:
          'Inside the forest, you find a fast river. '
          'There is an old bridge nearby, but it does not look safe.',
      choices: [
        Choice(text: 'Cross the old bridge', nextStory: 3),
        Choice(text: 'Look for another way', nextStory: 4),
      ],
    ),
    Story(
      text:
          'You arrive at the old house. The door is closed, '
          'but you can see a light through the window.',
      choices: [
        Choice(text: 'Knock on the door', nextStory: 5),
        Choice(text: 'Leave the house and continue walking', nextStory: 4),
      ],
    ),
    Story(
      text:
          'The bridge breaks while you are crossing. '
          'Fortunately, you grab a branch and climb safely back to land.',
      choices: [
        Choice(text: 'Follow the river', nextStory: 6),
        Choice(text: 'Return to the forest', nextStory: 4),
      ],
    ),
    Story(
      text:
          'After walking for a while, you see bright lights in the distance. '
          'You have finally found the road back to town.',
      choices: [Choice(text: 'Continue toward the town', nextStory: 7)],
    ),
    Story(
      text:
          'A friendly stranger opens the door and explains that you are lost. '
          'They show you a safe shortcut back to town.',
      choices: [Choice(text: 'Take the shortcut', nextStory: 7)],
    ),
    Story(
      text:
          'Following the river leads you to a small village. '
          'The villagers help you find your way home. Your adventure ends safely!',
      choices: [],
    ),
    Story(
      text:
          'You arrive safely in town. '
          'After a strange night full of choices, your adventure is finally over!',
      choices: [],
    ),
  ];

  Story get currentStory {
    return _stories[_currentStoryIndex];
  }

  bool get isFinished {
    return currentStory.choices.isEmpty;
  }

  void choose(int choiceIndex) {
    if (isFinished) {
      return;
    }

    if (choiceIndex < 0 || choiceIndex >= currentStory.choices.length) {
      return;
    }

    _currentStoryIndex = currentStory.choices[choiceIndex].nextStory;
  }

  void restart() {
    _currentStoryIndex = 0;
  }
}
