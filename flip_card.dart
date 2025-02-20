import 'package:flutter/material.dart';
import 'package:flip_card/flip_card.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: FlipCardExample(),
    );
  }
}


class FlipCardExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Flip Card Example')),
      body: Center(
        child: FlipCard(
          direction: FlipDirection.HORIZONTAL,
          front: Card(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
            elevation: 4,
            child: Container(
              width: 200,
              height: 300,
              alignment: Alignment.center,
              child: Text(
                'Front Side',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          back: Card(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
            elevation: 4,
            color: Colors.blue,
            child: Container(
              width: 200,
              height: 300,
              alignment: Alignment.center,
              child: Text(
                'Back Side',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
