import 'package:flutter/material.dart';

class LetterHeader extends StatefulWidget {
  @override
  _LetterFooterState createState() => _LetterFooterState();
}

class _LetterFooterState extends State<LetterHeader> {
  String headerText = "This Is Header Text";
  @override
  Widget build(BuildContext context) {
    return Text(headerText);
  }
}
