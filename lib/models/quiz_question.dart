class QuizQuestion {
  const QuizQuestion(this.text, this.answers);

  final String text;
  final List<String> answers;
  
  List<String> get shuffledAnswers{ //lesson .72
    final shuffledList = List.of(answers);//copy original answer List
    shuffledList.shuffle();//隨機順序answer List
    return shuffledList;
  }

}
