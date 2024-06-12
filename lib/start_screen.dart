import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StartScreen extends StatelessWidget {
  const StartScreen(this.startQuiz, {super.key});

  final void Function() startQuiz; //位置參數,接收switchScreen()

  @override
  Widget build(context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        //mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/images/quiz-logo.png',
            width: 300,
            color: const Color.fromARGB(200, 255, 255, 255),
          ),
          const SizedBox(height: 50),
          Text(
            'Learn Flutter the fun way !',
            style: GoogleFonts.lato(
              color: Colors.white,
              fontSize: 25,
            ),
          ),
          const SizedBox(height: 50),
          ElevatedButton.icon(
            onPressed:startQuiz,//lesson .59，startQuiz變數已有儲存switchScreen()方法
            style: ElevatedButton.styleFrom(),
            icon: const Icon(Icons.arrow_right_alt),
            label: const Text('Start Quiz'),
          ),
          // OutlinedButton(
          //   onPressed: (){},
          //   style: OutlinedButton.styleFrom(
          //     foregroundColor: Colors.white,
          //   ),
          //   child: const Text('Start Quiz'),
          //   )

          // TextButton(
          //   onPressed: () {},
          //   style: TextButton.styleFrom(
          //     foregroundColor: Colors.white,
          //     textStyle: TextStyle(fontSize: 20),
          //   ),
          //   child: Text('Start Quiz'),
          // )
        ],
      ),
    );
  }
}
