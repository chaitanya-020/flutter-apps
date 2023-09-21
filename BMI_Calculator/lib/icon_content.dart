import 'package:flutter/material.dart';
import 'constants.dart';

class iconcontent extends StatelessWidget {

  final String label;
  final IconData ic;
  iconcontent({required this.label, required this.ic });
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          ic,
          size:80.0,
        ),
        SizedBox(
          height: 15.0,
        ),
        Text(
          label,
          style:klabelTextStyle,
        )
      ],
    );
  }
}