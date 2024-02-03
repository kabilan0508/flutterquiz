class QuizQuestion {
  const QuizQuestion(this.question, this.answers);
  final String question;
  final List<String> answers;

  List<String> getSuffeledanswers() {
    final suffeled = List.of(answers);
    suffeled.shuffle();
    return suffeled;
  }
}
