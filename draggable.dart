import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DraggableContentPage(),
    );
  }
}

class DraggableContentPage extends StatefulWidget {
  @override
  _DraggableContentPageState createState() => _DraggableContentPageState();
}

class _DraggableContentPageState extends State<DraggableContentPage> {
  Color targetColor = Colors.grey.shade300; // Default target box color
  bool isDropped = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Draggable Content')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Draggable Widget
          Draggable<Color>(
            data: Colors.blue,
            feedback: Container(
              width: 100,
              height: 100,
              color: Colors.blue.withOpacity(0.7),
              child: Center(child: Text('Dragging...', style: TextStyle(color: Colors.white))),
            ),
            childWhenDragging: Container(
              width: 100,
              height: 100,
              color: Colors.blue.withOpacity(0.3),
              child: Center(child: Text('Moving...')),
            ),
            child: Container(
              width: 100,
              height: 100,
              color: Colors.blue,
              child: Center(child: Text('Drag Me', style: TextStyle(color: Colors.white))),
            ),
          ),
          SizedBox(height: 50),

          // Drag Target Area
          DragTarget<Color>(
            onAccept: (color) {
              setState(() {
                targetColor = color;
                isDropped = true;
              });
            },
            builder: (context, candidateData, rejectedData) {
              return Container(
                width: 120,
                height: 120,
                decoration: BoxDecoration(
                  color: targetColor,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.black, width: 2),
                ),
                child: Center(
                  child: isDropped
                      ? Text('Dropped!', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold))
                      : Text('Drop Here', style: TextStyle(fontSize: 16)),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
