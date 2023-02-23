import 'package:flutter/material.dart';

class ReusableCard extends StatelessWidget {
  final Color colour;
  final Widget cardChild;
  final VoidCallback gesture;

  ReusableCard({required this.colour,required this.cardChild,required this.gesture});

  @override
  Widget build(BuildContext context) {
    //GestureDetector widget is used to replace Textbutton based on its functionality is basically to detect gestures
    return GestureDetector(
      onTap: gesture,
      child: Container(
        padding: EdgeInsets.all(12),
        child: cardChild,
        margin: EdgeInsets.all(15.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: colour,
        ),
      ),
    );
  }
}