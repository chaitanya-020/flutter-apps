import 'dart:math';
class calculator {

  final int height;
  final int weight;

  calculator({ required this.height, required this.weight});

  double _bmi=0;
  String calcluateBMI(){

    _bmi= weight/pow(height/100,2);
    return _bmi.toStringAsFixed(1);
  }

  String getResult(){
     if(_bmi>=25){
       return 'Overweight';
     }else if(_bmi>18.5){
       return 'Normal';
     }else{
       return 'Underweight';
     }
  }

  String bmiContext(){
    if(_bmi>=25){
      return 'You have a higher than normal body weight. Try to Exercise more.';
    }else if(_bmi>18.5){
      return 'You have a normal body weight. Good job! Keep it up.';
    }else{
      return 'You have a lower than normal body weight. Eat a bit more.';
    }


  }
}