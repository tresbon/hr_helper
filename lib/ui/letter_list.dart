import 'elements_list.dart';
import 'letter_footer.dart';
import 'letter_header.dart';
import 'package:flutter/material.dart';

class Letter extends StatelessWidget {

  Widget textElements = TextElements();



  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 30, 10, 20),
      child: ListView(
        shrinkWrap: true,
        children: [
          LetterHeader(),
          textElements,
          LetterFooter(),
        ],
      ),
    );
  }
}
