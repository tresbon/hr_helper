import 'package:flutter/material.dart';

class LetterFooter extends StatefulWidget {
  @override
  _LetterHeaderState createState() => _LetterHeaderState();
}

class _LetterHeaderState extends State<LetterFooter> {
  String footerText = "This is Footer Text";
  @override
  Widget build(BuildContext context) {
    return Text(footerText);
  }
}
