import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:hospital/presentation/resources/font_manager.dart';

class Text_Utils extends StatelessWidget {
  final String text;
  final double fontsize;
  final FontWeight fontWeight;
  final Color color;
  final bool isUndeLine;
  final int? maxlines;

  final TextAlign? textAlign;

  const Text_Utils(
      {required this.fontWeight,
      required this.text,
      required this.color,
      required this.isUndeLine,
      required this.fontsize,
      this.textAlign,
      this.maxlines,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontFamily: FontConstants.fontFamily,
        color: color,
        fontSize: fontsize,
        fontWeight: fontWeight,
        decoration: isUndeLine ? TextDecoration.underline : TextDecoration.none,
        decorationThickness: 10,
      ),
      maxLines: maxlines,
      overflow: TextOverflow.ellipsis,
      textAlign: textAlign,
    );
  }
}
