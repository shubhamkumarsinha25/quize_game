
import 'package:quize_game/question.dart';
class QuizeBrain{
  int _questionnumber=0;
  List<Question>_questionbank=[
  Question('RAM is a non-volatile memory',false),
  Question('Variables defined in a function are local to that function, unless bound by the global keyword',true),
  Question('The condition x <= y <= z is allowed in Python',true),
  Question('A Python while can implement a definite loop',true),
  Question('a and (b or c) == (a and b) or (a and c)',true),
  Question('An int can be converted to a string while a string cannot be converted to an int',false),
  Question('The if statement can only accept a Boolean expression as a condition',true)
  ];

  void nextquetion()
  {
    if(_questionnumber<_questionbank.length-1)
      {
        _questionnumber++;
      }
  }
  String getquestionText()
  {
    return _questionbank[_questionnumber].questiontext;
  }
  bool getans()
  {
    return _questionbank[_questionnumber].questionans;
  }
  bool isfinished()
  {
    if(_questionnumber>=_questionbank.length-1)
      {
        return true;
      }
    else
      {
        return false;
      }
  }
  void reset()
  {_questionnumber=0;}
}