import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'icon_content.dart';
import 'reusable_card.dart';
import 'constants.dart';
import 'results_page.dart';
import 'RoundIconButton.dart';
import 'BottomButton.dart';
import 'calculator.dart';

enum Gender {
  male,
  female,
  nullValue,
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender selectedgender = Gender.nullValue;
  int Height = 150;
  int Weight = 50;
  int Age = 25;
  

  // Color malecardcolor=inactivecardcolor;
  // Color femalecardcolor = inactivecardcolor;
  // // gender--->> 0->female, 1->male
  // void updatecolor(Gender gender)
  // {
  //   if(gender== Gender.male )
  //     {
  //       if(malecardcolor== inactivecardcolor) {
  //         malecardcolor = activecardcolor;
  //         femalecardcolor = inactivecardcolor;
  //       }
  //       else
  //         malecardcolor=inactivecardcolor;
  //
  //     }
  //   if(gender==Gender.female)
  //     {
  //       if(femalecardcolor == inactivecardcolor) {
  //         femalecardcolor = activecardcolor;
  //         malecardcolor = inactivecardcolor;
  //       }
  //       else
  //         femalecardcolor = inactivecardcolor;
  //     }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('BMI CALCULATOR')),
      ),
      body: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: mycontainer(
                    onPress: () {
                      setState(() {
                        selectedgender = Gender.male;
                      });
                    },
                    colour: selectedgender == Gender.male
                        ? kactivecardcolor
                        : kinactivecardcolor,
                    cardchild:
                        iconcontent(ic: FontAwesomeIcons.mars, label: "Male"),
                  ),
                ),
                Expanded(
                  child: mycontainer(
                    onPress: () {
                      setState(() {
                        selectedgender = Gender.female;
                      });
                    },
                    colour: selectedgender == Gender.female
                        ? kactivecardcolor
                        : kinactivecardcolor,
                    cardchild: iconcontent(
                        ic: FontAwesomeIcons.venus, label: "Female"),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
              child: mycontainer(
            colour: kactivecardcolor,
            cardchild: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'HEIGHT',
                  style: klabelTextStyle,
                ),
                Row(
                  textBaseline: TextBaseline.alphabetic,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  children: [
                    Text(
                      Height.toString(),
                      style: knumberstyle,
                    ),
                    Text(
                      'CM',
                      style: klabelTextStyle,
                    ),
                  ],
                ),
                SliderTheme(
                  data: SliderThemeData(
                    activeTrackColor: Colors.white,
                    inactiveTrackColor: Color(0xFF8D8E98),
                    thumbColor: Color(0xFFEB1555),
                    overlayColor: Color(0x29EB1555),
                    thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15.0),
                    overlayShape: RoundSliderOverlayShape(overlayRadius: 30.0),
                  ),
                  child: Slider(
                    value: Height.toDouble(),
                    min: 70,
                    max: 230,
                    divisions: 160,
                    onChanged: (double newvalue) {
                      setState(() {
                        Height = newvalue.round();
                      });
                    },
                  ),
                ),
              ],
            ),
            onPress: () {},
          )),
          Expanded(
              child: Row(
            children: [
              Expanded(
                  child: mycontainer(
                colour: kactivecardcolor,
                cardchild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'WEIGHT',
                      style: klabelTextStyle,
                    ),
                    Text(
                      Weight.toString(),
                      style: knumberstyle,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        RoundIconButton(
                            ic1: FontAwesomeIcons.minus,
                            onpressed: () {
                              setState(() {
                                Weight--;
                              });
                            }),
                        SizedBox(
                          width: 10.0,
                        ),
                        RoundIconButton(
                            ic1: FontAwesomeIcons.plus,
                            onpressed: () {
                              setState(() {
                                Weight++;
                              });
                            }),
                      ],
                    ),
                  ],
                ),
                onPress: () {},
              )),
              Expanded(
                  child: mycontainer(
                colour: kactivecardcolor,
                cardchild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Age',
                      style: klabelTextStyle,
                    ),
                    Text(
                      Age.toString(),
                      style: knumberstyle,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        RoundIconButton(
                            ic1: FontAwesomeIcons.minus,
                            onpressed: () {
                              setState(() {
                                Age--;
                              });
                            }),
                        SizedBox(
                          width: 10.0,
                        ),
                        RoundIconButton(
                            ic1: FontAwesomeIcons.plus,
                            onpressed: () {
                              setState(() {
                                Age++;
                              });
                            }),
                      ],
                    ),
                  ],
                ),
                onPress: () {},
              )),
            ],
          )),
          BottomButton(
            buttonTitle: 'CALCULATE',
            ontap: () {

              calculator calc = new calculator(height: Height, weight: Weight);
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ResultsPage(

                    bmiResult: calc.calcluateBMI(),
                    resultText: calc.getResult(),
                    interpretation: calc.bmiContext(),

                  ),),);
            },
          ),
        ],
      ),
    );
  }
}


