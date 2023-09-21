import 'package:flutter/material.dart';
import 'package:quizzler/quiz_brain.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

Quizbrain quizBrain = Quizbrain();
void main() => runApp(Quizzler());

class Quizzler extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
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
  List<Icon> scorekeeper = [];
  int count=0;



  void checkAnswer(bool userpickedAnswer)
  {
    bool correctanswer = quizBrain.getAnswer();
    setState(() {
      if(quizBrain.isFinished())
        {

          Alert(context: context, title: "FINISHED!!", desc: "You have finished the end of the Quiz").show();
          Alert(
            context: context,
            type: AlertType.none,
            title: "SCORE",
            desc: count.toString()+"/13",
            buttons: [
              DialogButton(
                child: Text(
                  "OK",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
                onPressed: () => Navigator.pop(context),
                color: Color.fromRGBO(0, 179, 134, 1.0),
                radius: BorderRadius.circular(0.0),
              ),
            ],
          ).show();
          quizBrain.reset();
          scorekeeper=[];
          count=0;

        }
      else
        {
          if (userpickedAnswer == correctanswer)
          {
            scorekeeper.add(
              Icon(Icons.check, color: Colors.green,),
            );
            count++;
          }
          else
          {
            scorekeeper.add(
              Icon(Icons.close, color: Colors.red,),
            );
          }
        }

      quizBrain.nextQuestion();
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
            padding: EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                quizBrain.getQuestionText(),
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: TextButton(

              child: Text(
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
            padding: EdgeInsets.all(15.0),
              child:TextButton(

              child: Text(
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
        Row(children: scorekeeper)
      ],
    );
  }
}

/*
question1: 'You can lead a cow down stairs but not up stairs.', false,
question2: 'Approximately one quarter of human bones are in the feet.', true,
question3: 'A slug\'s blood is green.', true,
*/
