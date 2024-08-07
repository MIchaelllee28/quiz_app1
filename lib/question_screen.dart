import 'package:flutter/material.dart';
import 'package:quiz_app1/answer_button.dart';
import 'package:quiz_app1/data/questions.dart';

class QuestionScreen extends StatefulWidget {
  const QuestionScreen({super.key, required this.onSelectAnswer});

  final void Function(String answer) onSelectAnswer;

  @override
  State<QuestionScreen> createState() {
    return _QuestionScreenState();
  }
}

class _QuestionScreenState extends State<QuestionScreen> {
  var currentButtonState = 0;

  void buttonPressed(String answerSelected) {
    widget.onSelectAnswer(answerSelected);
// currentButtonState = currentButtonState + 1;
// currentButtonState += 1;
    setState(() {
      currentButtonState++;
    });
  }

  @override
  Widget build(BuildContext context) {
    final currentQuestion = questions[currentButtonState];

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              currentQuestion.textQuestion,
              style: const TextStyle(color: Colors.white),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 30,
            ),
            ...currentQuestion.getShuffledAnswers().map(
              (answer) {
                return AnswerButton(
                    answerText: answer,
                    onTap: () {
                      buttonPressed(answer);
                    });
              },
            )
          ],
        ),
      ),
    );
  }
}
