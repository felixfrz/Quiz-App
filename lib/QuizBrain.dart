import 'package:quiz/Question.dart';

class QuizBrain {
  int _questionNumber = 0;
  List<Question> _questionBank = [
    Question('Nigeria got independent in the year 1960', true),
    Question('Kano is the capital of Nigeria', false),
    Question('kogi state is refered to as the confluence state', true),
  ];

  String getQuestionText() {
    return _questionBank[_questionNumber].question;
  }

  bool getAnswer() {
    return _questionBank[_questionNumber].answer;
  }

  void nextQuestion() {
    if (_questionNumber < _questionBank.length - 1) {
      _questionNumber++;
    }
  }

  bool isFinish() {
    // if (_questionNumber >= _questionBank.length - 1) {
    //   print('Now returning True');
    //   return true;
    // } else {
    //   return false;
    // }
    return _questionNumber >= _questionBank.length - 1;
  }

  void reset() {
    _questionNumber = 0;
  }
}
