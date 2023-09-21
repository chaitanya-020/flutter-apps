import 'package:flutter/material.dart';
import 'constants.dart';


class BottomButton extends StatelessWidget {
  final Function ontap;
  final String buttonTitle;

  BottomButton({required this.ontap, required this.buttonTitle});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        ontap();
      },
      child: Container(
        child: Center(
          child: Text(
            buttonTitle,
            style: klargebuttonstyle,
          ),
        ),
        color: kbottomcontainercolor,
        margin: EdgeInsets.only(top: 10.0),
        width: double.infinity,
        height: kbottomcontainerheight,
      ),
    );
  }
}
