import 'package:bmi_calculator/constants.dart';
import 'package:flutter/material.dart';
import 'reusable_card.dart';
import 'input.dart';
import 'constants.dart';
import 'BottomButton.dart';
import 'calculator.dart';


class ResultsPage extends StatelessWidget {

  final String bmiResult;
  final String resultText;
  final String interpretation;

  ResultsPage({ required this.bmiResult, required this.resultText, required this. interpretation});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCLULATOR'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.all(15.0),
              child: Text(
                'Your Result',
                style: ktitletextstyle,
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: mycontainer(
              colour: kactivecardcolor,
              onPress: () {},
              cardchild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    resultText.toUpperCase(),
                    style: kresulttextstyle,
                  ),
                  Text(
                    bmiResult,
                    style: kBMItextstyle,
                  ),
                  Text(
                    interpretation,
                    textAlign: TextAlign.center,
                    style: kbodytextstyle,
                  ),
                ],
              ),
            ),
          ),
          BottomButton(
            buttonTitle: 'RE-CALCULATE',
            ontap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => InputPage()),
              );
            },
          ),
        ],
      ),
    );
  }
}
