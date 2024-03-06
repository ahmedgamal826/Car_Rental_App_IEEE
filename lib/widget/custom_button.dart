import 'package:cars_rental_app/screens/login_screen.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatefulWidget {
  const CustomButton(
      {super.key,
      required this.onPressed,
      required this.buttonText,
      required this.fontSize});

  final VoidCallback onPressed;
  final String buttonText;
  final double fontSize;

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(5))),
      onPressed: widget.onPressed,
      child: Text(
        '${widget.buttonText}',
        style: TextStyle(
            color: Colors.black,
            fontSize: widget.fontSize,
            fontWeight: FontWeight.bold),
      ),
    );
  }
}
