class QuizQuestion {
  const QuizQuestion(this.textQuestion, this.answers);

  final String textQuestion;
  final List<String> answers;

  List<String> getShuffledAnswers() {
    final shuffledlist = List.of(answers);
    shuffledlist.shuffle();
    return shuffledlist;
  }
}
