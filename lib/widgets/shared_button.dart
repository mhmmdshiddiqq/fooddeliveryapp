import 'package:flutter/material.dart';

class SharedButton extends StatelessWidget {
  final String text;
  final void Function()? onPressed;
  final EdgeInsets? margins;

  const SharedButton({
    super.key,
    required this.text,
    this.onPressed,
    this.margins,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100 * 3,
      height: 60,
      margin: margins,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: Color.fromARGB(255, 250, 74, 12),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(40),
          ),
          elevation: 3,
        ),
        child: Text(
          text,
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
