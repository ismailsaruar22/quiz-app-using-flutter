import 'package:flutter/material.dart';
import 'package:quiz_app/quiz_brain.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

QuizBrain quizBrain = QuizBrain();

void main() => runApp(Quizzler());

class Quizzler extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey.shade900,
        appBar: AppBar(
          backgroundColor: Colors.blue.shade900,
          title: const Text(
            'Quiz App',
          ),
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: QuizPage(),
          ),
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  int rightAnswer = 0;
  List<Icon> scoreChecker = [];
  void checkAnswer(bool userPickerAnswer) {
    bool correctAnswer = quizBrain.getAnswer();

    setState(() {
      quizBrain.nextQuestion();
      if (quizBrain.isFinished() == true) {
        Alert(
          context: context,
          type: AlertType.warning,
          title: "Quiz over",
          desc: "You have made $rightAnswer correct answer",
          buttons: [
            DialogButton(
              child: const Text(
                "Try Again",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              onPressed: () {
                Navigator.pop(context);
              },
              color: const Color.fromRGBO(0, 179, 134, 1.0),
            ),
          ],
        ).show();
        quizBrain.reset();
        scoreChecker.clear();
        rightAnswer = 0;
      } else {
        if (userPickerAnswer == correctAnswer) {
          scoreChecker.add(
            const Icon(
              Icons.check,
              color: Colors.green,
              size: 24.0,
            ),
          );
          rightAnswer++;
        } else {
          scoreChecker.add(
            const Icon(
              Icons.close,
              color: Colors.red,
              size: 24.0,
            ),
          );
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 5,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                quizBrain.getQuestion(),
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 25.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: TextButton(
              style: TextButton.styleFrom(
                primary: Colors.white,
                backgroundColor: Colors.green,
              ),
              child: const Text(
                'True',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
              onPressed: () {
                checkAnswer(true);
              },
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: TextButton(
              style: TextButton.styleFrom(
                primary: Colors.red,
                backgroundColor: Colors.red,
              ),
              child: const Text(
                'False',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
              onPressed: () {
                checkAnswer(false);
              },
            ),
          ),
        ),
        Row(
          children: scoreChecker,
        ),
        const SizedBox(
          height: 15,
        )
      ],
    );
  }
}
