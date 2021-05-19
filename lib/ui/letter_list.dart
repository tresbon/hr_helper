import 'package:flutter/services.dart';
import 'elements_list.dart';
import 'single_letter_element.dart';
import 'package:flutter/material.dart';

class Letter extends StatelessWidget {
  TextElements textElements = TextElements({
    "Системное мышление": "",
    "Софт скиллы": "",
  });
  SingleLetterElement letterHeader = SingleLetterElement("""Добрый день, !\n
По результатам собеседования мы оценили ваши навыки
""");
  SingleLetterElement letterFooter = SingleLetterElement("С уважением, ");

  void copyText() {
    String copiedText = letterHeader.getText() +
        textElements.getTextElements() +
        letterFooter.getText();
    Clipboard.setData(ClipboardData(text: copiedText));
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
          ElevatedButton(
            onPressed: () {
              copyText();
              ScaffoldMessenger.of(context)
                  .showSnackBar(SnackBar(content: Text("Текст скопирован!")));
            },
            child: Text("Копировать"),
          )
        ],
      ),
    );
  }
}
