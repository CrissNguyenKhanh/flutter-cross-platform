class Choice {
  final String text;
  final int nextStory;

  const Choice({required this.text, required this.nextStory});
}

class Story {
  final String text;
  final List<Choice> choices;

  const Story({required this.text, required this.choices});
}
