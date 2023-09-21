import 'package:flutter/material.dart';

class mycontainer extends StatelessWidget {

  final Color colour;
  final Widget cardchild;
  final Function onPress;

  mycontainer({ required this.colour, required this.cardchild, required this.onPress});




  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        onPress();
      },
      child: Container(
        child: cardchild,
        margin: EdgeInsets.all(15.0),
        decoration: BoxDecoration(
          color: colour,
          borderRadius: BorderRadius.circular(10.0),
        ),
        height: 200.0,
        width: double.infinity,
      ),
    );
  }
}
