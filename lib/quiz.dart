import 'package:flutter/material.dart';
import 'package:quiz_app1/data/questions.dart';
import 'package:quiz_app1/question_screen.dart';
import 'package:quiz_app1/result_screen.dart';
import 'package:quiz_app1/start_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  List<String> selectedAnswer = [];
  var activeScreen = "start-screen";

  void switchScreen() {
    setState(() {
      activeScreen = "question-screen";
    });
  }

  void chooseScreen(String answer) {
    selectedAnswer.add(answer);

    if (selectedAnswer.length == questions.length) {
      setState(
        () {
          selectedAnswer = [];
          activeScreen = "result-screen";
        },
      );
    }
  }

  // Alternatif 1
  // Widget? activeScreen;

  // @override
  // void initState() {
  //   activeScreen = StartScreen(switchScreen);
  //   super.initState();
  // }

  // void switchScreen() {
  //   setState(() {
  //     activeScreen = const QuestionScreen();
  //   });
  // }

  @override
  Widget build(context) {
    Widget screenWidget = StartScreen(switchScreen);

    if (activeScreen == "question-screen") {
      screenWidget = QuestionScreen(
        onSelectAnswer: chooseScreen,
      );
    }

    if (activeScreen == "result-screen") {
      screenWidget = ResultScreen(
        answerChosen: selectedAnswer,
      );
    }

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 78, 13, 151),
                Color.fromARGB(255, 107, 15, 168),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: screenWidget,

          // alternative 2 :
          //  activeScreen == "start-screen"
          //     ? StartScreen(switchScreen)
          //     : const QuestionScreen(),

          //alternative 1 :
          //activeScreen,
        ),
      ),
    );
  }
}
