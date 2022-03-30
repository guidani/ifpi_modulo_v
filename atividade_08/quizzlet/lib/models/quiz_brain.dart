import '../Entities/question.dart';

class QuizBrain {
  int _currentQuestion = 0;

  // ignore: prefer_final_fields
  List<Question> _questionBank = [
    Question('Some cats are actually allergic to humans', true),
    Question('You can lead a cow down stairs but not up stairs.', false),
    Question('Approximately one quarter of human bones are in the feet.', true),
    Question('A slug\'s blood is green.', true),
    Question('Buzz Aldrin\'s mother\'s maiden name was \"Moon\".', true),
    Question('It is illegal to pee in the Ocean in Portugal.', true),
  ];

  void nextQuestion() {
    if (_currentQuestion < _questionBank.length - 1) {
      _currentQuestion++;
    }
  }

  String getCurrentQuestion() {
    return "${_currentQuestion + 1}";
  }

  String getQuestionText() {
    return _questionBank[_currentQuestion].questionText!;
  }

  bool getCorrectAnswer() {
    return _questionBank[_currentQuestion].questionAnswer!;
  }

  bool isFinished() {
    if (_currentQuestion >= _questionBank.length - 1) {
      return true;
    } else {
      return false;
    }
  }

  void reset() {
    _currentQuestion = 0;
  }

  int numberOfQuestions() {
    return _questionBank.length;
  }
}
