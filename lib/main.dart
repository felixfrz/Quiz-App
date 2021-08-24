import 'package:flutter/material.dart';
import 'package:quiz/QuizBrain.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

void main() {
  runApp(Quiz());
}

// ABSTRACT, ENCAPSULATION, POLYMORPHISM, INHERITANCE
class Quiz extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 10.0,
            ),
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
  QuizBrain quizBrain = QuizBrain();

  List<Icon> scoreKeeper = [];

  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            flex: 5,
            child: Padding(
              padding: EdgeInsets.all(10.0),
              child: Center(
                child: Text(
                  quizBrain.getQuestionText(),
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 25.0,
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(15.0),
              // ignore: deprecated_member_use
              child: FlatButton(
                color: Colors.green,
                onPressed: () {
                  isCorrect(true);
                },
                child: Text(
                  'TRUE',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(15.0),
              // ignore: deprecated_member_use
              child: FlatButton(
                color: Colors.red,
                onPressed: () {
                  isCorrect(false);
                },
                child: Text(
                  'FALSE',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ),
          Row(
            children: scoreKeeper,
          )
        ]);
  }

  void isCorrect(bool userPickedAnswer) {
    bool correctAnswer = quizBrain.getAnswer();
    setState(() {
      if (quizBrain.isFinish() == true) {
        Alert(
                image: CircleAvatar(
                  radius: 50.0,
                  child: Image(
                    image: NetworkImage(
                        'https://randomuser.me/api/portraits/men/77.jpg'),
                  ),
                ),
                context: context,
                title: "Finished",
                desc: "You've reached the end of the quiz.")
            .show();
        quizBrain.reset();
        scoreKeeper = [];
      } else {
        if (userPickedAnswer == correctAnswer) {
          scoreKeeper.add(
            Icon(
              Icons.check,
              color: Colors.green,
            ),
          );
          print('user got it right');
        } else {
          scoreKeeper.add(
            Icon(
              Icons.close,
              color: Colors.red,
            ),
          );
          print('user got it wrong');
        }
        quizBrain.nextQuestion();
      }
    });
  }
}
