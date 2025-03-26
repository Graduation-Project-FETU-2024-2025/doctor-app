import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, required this.onPressed, required this.text, this.backgroundColor});
  final VoidCallback onPressed;
  final String text;
  final Color? backgroundColor;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
          minimumSize: Size(255, 55),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          backgroundColor: backgroundColor,
        ),
        onPressed: onPressed,
        child: Text(text));
  }
}
