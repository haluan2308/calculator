


import 'package:flutter/material.dart';

class Buttonwidget extends StatelessWidget {

  final color;
  final btntext;
  final txtColor;
  final buttonOntap;

  Buttonwidget({ this.btntext,  this.color, this.buttonOntap,  this.txtColor});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: buttonOntap,
      child: Padding(
        padding: EdgeInsets.all(5),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: Container(
            width: 30,
            height: 30,
            color: color,
            child: Center(
              child: Text(
                btntext,
                style: TextStyle(
                  fontSize: 20
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
