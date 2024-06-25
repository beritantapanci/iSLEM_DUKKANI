import 'package:flutter/material.dart';

class DefaultElevatedButton extends StatelessWidget {
  final String label;
  final void Function() onPressed;
  final double leftBorderRadiusValue;
  final double rightBorderRadiusValue;

  DefaultElevatedButton(
      {Key? key,
      required this.label,
      required this.onPressed,
      required this.leftBorderRadiusValue,
      required this.rightBorderRadiusValue})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Container(
      height: height * 0.07,
      width: width * 0.60,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(leftBorderRadiusValue),
              topRight: Radius.circular(rightBorderRadiusValue),
            ),
          ),
        ),
        onPressed: this.onPressed,
        child: Text(
          this.label,
          style: TextStyle(
            color: Colors.white,
            fontSize: 17,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }
}
