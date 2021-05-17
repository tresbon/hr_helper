import 'package:flutter/services.dart';

import 'elements_list.dart';
import 'single_letter_element.dart';
import 'package:flutter/material.dart';

class Letter extends StatelessWidget {
  Widget textElements = TextElements({
    "Системное мышление": "",
    "Софт скиллы": "",
  });
  Widget letterHeader = SingleLetterElement("This is a header");
  Widget letterFooter = SingleLetterElement("This is a footer");

  void copyText(String s) {
    Clipboard.setData(ClipboardData(text: s));
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 30, 10, 20),
      child: ListView(
        shrinkWrap: true,
        children: [
          letterHeader,
          textElements,
          letterFooter,
          ElevatedButton(onPressed: () {},
          child: Text("Копировать"),)
        ],
      ),
    );
  }
}
