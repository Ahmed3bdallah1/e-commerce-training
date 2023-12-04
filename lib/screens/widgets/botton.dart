import 'package:flutter/material.dart';

class DefaultButton extends StatelessWidget {
  Widget childWidget;
  Function() function;
  double width;
  Color? backgroundColor = Colors.indigo;
  bool isUpperCase;
  double radius;
  double height;
  Color borderColor;

  DefaultButton({
    super.key,
    this.height = 50,
    required this.childWidget,
    required this.function,
    this.backgroundColor,
    this.width = double.infinity,
    this.isUpperCase = true,
    this.radius = 10.0,
    this.borderColor = Colors.transparent,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        border: Border.all(color: borderColor),
        borderRadius: BorderRadius.circular(radius),
        color: backgroundColor,
      ),
      child: MaterialButton(
        onPressed: function,
        child: childWidget,
      ),
    );
  }
}
