import 'package:quiz_app/questions.dart';

class QuizBrain {
  int _questionNumber = 0;
  final List<Question> _questionsBank = [
    Question('The app authors name Ismail', true),
    Question('You are not honest', false),
    Question('Your lie', true),
    Question('you are 24', false),
    Question('Some cats are actually allergic to humans', true),
    Question('You can lead a cow down stairs but not up stairs.', false),
    Question('Approximately one quarter of human bones are in the feet.', true),
    Question('A slug\'s blood is green.', true),
    Question('Buzz Aldrin\'s mother\'s maiden name was \"Moon\".', true),
    Question('It is illegal to pee in the Ocean in Portugal.', true),
    Question(
        'No piece of square dry paper can be folded in half more than 7 times.',
        false),
    Question(
        'In London, UK, if you happen to die in the House of Parliament, you are technically entitled to a state funeral, because the building is considered too sacred a place.',
        true),
    Question(
        'The loudest sound produced by any animal is 188 decibels. That animal is the African Elephant.',
        false),
  ];

  void nextQuestion() {
    if (_questionNumber < _questionsBank.length - 1) {
      _questionNumber++;
    }
  }

  String getQuestion() {
    return _questionsBank[_questionNumber].questionsText;
  }

  bool getAnswer() {
    return _questionsBank[_questionNumber].questionsAnswer;
  }

  bool isFinished() {
    if (_questionNumber >= _questionsBank.length - 1) {
      return true;
    } else {
      return false;
    }
  }

  void reset() {
    _questionNumber = 0;
  }
}
