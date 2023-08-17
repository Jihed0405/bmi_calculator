import 'package:flutter/material.dart';

class ReusableCard extends StatelessWidget {
 const ReusableCard({super.key, required this.colour,this.cardChild});
 final Color colour;
final Widget? cardChild;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(15.0),
    decoration: BoxDecoration(borderRadius: BorderRadius.circular(10.0),
    color: colour,),
    height: 150.0,
      child: cardChild,
    );
  }
}