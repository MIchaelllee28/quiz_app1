import 'package:flutter/material.dart';
import 'package:quiz_app1/data/questions.dart';
import 'package:quiz_app1/the_summary.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({super.key, required this.answerChosen});

  final List<String> answerChosen;

  List<Map<String, Object>> getSumData() {
    final List<Map<String, Object>> summary = [];

    for (var i = 0; i < answerChosen.length; i++) {
      summary.add({
        "index_question": i,
        "questions": questions[i].textQuestion,
        "answers_correct": questions[i].answers[0],
        "answers_picked": answerChosen[i],
      });
    }
    return summary;
  }

  @override
  Widget build(BuildContext context) {
    final dataSum = getSumData();
    final totalQuestion = answerChosen;
    final correctAnswer = dataSum.where(
      (element) {
        return element["answers_picked"] == element["answers_correct"];
      },
    ).length;

    return SizedBox(
        width: double.infinity,
        child: Container(
          margin: const EdgeInsets.all(40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                  'You answered $correctAnswer ammount of $totalQuestion questions corectly'),
              const SizedBox(
                height: 20,
              ),
              TheSummary(
                allSummary: dataSum,
              ),
              const SizedBox(
                height: 20,
              ),
              TextButton(
                onPressed: () {},
                child: const Text('Restart'),
              )
            ],
          ),
        ));
  }
}
