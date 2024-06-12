import 'package:flutter/material.dart';
import 'package:flutter_02/data/question.dart';
import 'package:flutter_02/questions_summary/questions_summary.dart';
import 'package:google_fonts/google_fonts.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen({
    super.key,
    required this.chosenAnswers,
    required this.onRestart, //必要＆命名參數，接收restartQuiz方法
    required this.startAgain,
  });

  final List<String> chosenAnswers;
  //宣告List，String型別的變數：chosenAnswers，接收selectedAnswers中儲存的答案(a List)
  final void Function() onRestart; //作業1，同lesson. 59
  final void Function() startAgain;

  List<Map<String, Object>> get summaryData {
    final List<Map<String, Object>> summary = [];

    for (int i = 0; i < chosenAnswers.length; i++) {
      summary.add(
        {
          'question_index': i,
          'question': questions[i].text,
          'correct_answer': questions[i].answers[0],
          'user_answer': chosenAnswers[i],
        },
      );
    } //get => lesson .88

    return summary;
  }

  @override
  Widget build(BuildContext context) {
    final numTotalQuestions = questions.length;
    final numCorrectQuestions = summaryData
        .where(
          (data) => data['correct_answer'] == data['user_answer'],
        )
        .length; //lesson .86 & .88

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'You answered $numCorrectQuestions out of $numTotalQuestions questions correctly!',
              style: GoogleFonts.lato(
                color: const Color.fromARGB(255, 230, 200, 253),
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),
            QuestionsSummary(summaryData), //lesson .84
            const SizedBox(height: 30),
            ElevatedButton.icon(
              onPressed: onRestart, //作業1，同lesson. 59
              style: ElevatedButton.styleFrom(),
              icon: const Icon(Icons.refresh),
              label: const Text('Restart Quiz!'),
            ),
            TextButton.icon(
              onPressed: startAgain, //作業1，同lesson. 59
              style: ElevatedButton.styleFrom(foregroundColor: Colors.white),
              icon: const Icon(Icons.refresh),
              label: const Text('Back to Start!'),
            ), //另一種按鈕
          ],
        ),
      ),
    );
  }
}
