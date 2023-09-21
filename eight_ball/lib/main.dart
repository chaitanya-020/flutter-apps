import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(MaterialApp(home: Ballpage()));
}

class Ballpage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text('Ask Me Anything'),
        ),
        backgroundColor: Colors.blue[900],
      ),
      backgroundColor: Colors.blueAccent,
      body: Ball(),
    );
  }
}

class Ball extends StatefulWidget {
  const Ball({Key? key}) : super(key: key);

  @override
  State<Ball> createState() => _BallState();
}

class _BallState extends State<Ball> {
  int x = 5;

  @override
  Widget build(BuildContext context) {
    return Center(
        child: TextButton(
            onPressed: () {
              setState(() {
                x = Random().nextInt(5) + 1;
              });
            },
            child: Image.asset('images/ball$x.png')));
  }
}
