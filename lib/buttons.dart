import 'package:flutter/material.dart';

class Mybutton extends StatelessWidget {
  final Color;
  final textcolor;
  final String buttonstext;
  var buttondata;

  Mybutton(
      {required this.buttonstext,
      required this.textcolor,
      required this.Color,
      required this.buttondata});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: buttondata,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20.0),
          child: Container(
            color: Color,
            child: Center(
              child: Text(
                buttonstext,
                style: TextStyle(
                    color: textcolor,
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
