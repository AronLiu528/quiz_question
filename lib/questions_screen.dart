import 'package:flutter/material.dart';
import 'package:flutter_02/answer_button.dart';
import 'package:flutter_02/data/question.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen({super.key,required this.onSelectAnswer});

  final void Function(String answer) onSelectAnswer;
  //宣告一個void Function(String型別，變數answer)的變數：onSelectedAnswer，接收chooseAnswer()方法

  @override
  State<QuestionsScreen> createState() {
    return _QuestionScreenState();
  }
}

class _QuestionScreenState extends State<QuestionsScreen> {
  var currentQuestionIndex = 0;

  void answerQuestion(String selectedAnswer) {
    widget.onSelectAnswer(selectedAnswer);    
    setState(() {
      //currentQuestionIndex = currentQuestion + 1;
      //currentQuestionIndex += 1;//不同運算符，相同結果
      currentQuestionIndex++; //一次僅能+1
    });
  }//lesson .73

  @override
  Widget build(context) {
    final currentQuestion = questions[currentQuestionIndex];

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              currentQuestion.text,
              style: GoogleFonts.lato(
                //GoogleFonts lesson .75
                color: const Color.fromARGB(255, 201, 153, 251),
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),

            const SizedBox(
              height: 30,
            ),
            ...currentQuestion.shuffledAnswers.map((answer) {
              return AnswerButton(
                answerText: answer,
                onTap: (){
                  answerQuestion(answer);//lesson .76
                },
              );
            }), // lesson .70
          ],
        ),
      ),
    );
  }
}
