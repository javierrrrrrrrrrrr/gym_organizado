import 'package:flutter/material.dart';
import 'package:gym_organizado/Constants/contants.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    Key? key,
    required this.onPressed,
    required this.title,
    this.height,
    this.width,
    this.color,
  }) : super(key: key);

  final String title;
  final VoidCallback? onPressed;
  final Color? color;
  final double? height;
  final double? width;

  @override
  Widget build(BuildContext context) {
    final ancho = MediaQuery.of(context).size.width;
    return MaterialButton(
      onPressed: onPressed,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      elevation: 0,
      splashColor: Colors.transparent,
      height: height,
      minWidth: width,
      color: (color == null) ? kprimarycolor : color,
      child: Text(
        title,
        style: TextStyle(fontSize: ancho * 0.05, color: Colors.white),
      ),
    );
  }
}
