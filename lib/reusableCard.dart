import 'package:flutter/material.dart';

class ReusableCard extends StatelessWidget {
  final Color colors;
  final childCard;
  final Function onPress;
  ReusableCard({@required this.colors,@required this.childCard,this.onPress});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        child: childCard,
        margin: EdgeInsets.all(15),
        decoration: BoxDecoration(
            color: colors,
            borderRadius: BorderRadius.circular(10.0)
        ),
      ),
    );
  }
}