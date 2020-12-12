import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'quizebrain.dart';
QuizeBrain quizeBrain=QuizeBrain();
void main()
{
  runApp(quize());
}
class quize extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: QuizePage(),
          ),
        ),
      ),
    );
  }
}
class QuizePage extends StatefulWidget {
  @override
  _QuizePageState createState() => _QuizePageState();
}

class _QuizePageState extends State<QuizePage> {
  List<Icon>score=[];
  void checkans(bool userchoice)
  {
    bool correctans=quizeBrain.getans();
    setState(() {
      if(quizeBrain.isfinished()==true)
        {
          Alert(
            context: context,
            title: 'Finished',
            desc: 'you\'ve reached the end of the quiz.',
          ).show();
          quizeBrain.reset();
          score=[];
        }
      if(correctans==userchoice)
        {
          score.add(Icon(Icons.check,color: Colors.green,));
        }
      else{
        score.add(Icon(Icons.close,color: Colors.red,));
      }
      quizeBrain.nextquetion();
    });
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children:<Widget> [
        Expanded(
          flex: 5,
          child: Padding(
            padding:EdgeInsets.all(10),
            child: Center(
              child: Text(
                quizeBrain.getquestionText(),
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 24,
                  color: Colors.red
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(10),
            child: FlatButton(
              textColor: Colors.white,
              color: Colors.green,
              child: Text('True'),
              onPressed: (){
                checkans(true);
              },
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(10),
            child: FlatButton(
              textColor: Colors.white,
              color: Colors.red,
              child: Text('False'),
              onPressed: (){
                checkans(false);
              },
            ),
          ),
        ),
        Row(
          children:score,
        )
      ],
    );
  }
}

