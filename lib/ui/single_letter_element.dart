import 'package:flutter/material.dart';

class SingleLetterElement extends StatefulWidget {
  String text;

  SingleLetterElement(this.text);

  String getText() {
    return text + "\n" * 2;
  }

  @override
  _LetterFooterState createState() => _LetterFooterState();
}

class _LetterFooterState extends State<SingleLetterElement> {
  Future<void> _editLetteFieldDiaog() async {
    TextEditingController _contoller = TextEditingController(text: widget.text);
    return showDialog<void>(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Редактировать"),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                TextField(
                  keyboardType: TextInputType.multiline,
                  maxLines: null,
                  controller: _contoller,
                  onSubmitted: (String value) => {_contoller.text = value},
                ),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Отменить'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text('Сохранить'),
              onPressed: () {
                setState(() {
                  widget.text = _contoller.text;
                });
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Text(
                widget.text,
                textAlign: TextAlign.justify,
                textDirection: TextDirection.ltr,
                softWrap: true,
              ),
            ),
            IconButton(
                icon: Icon(Icons.edit),
                onPressed: () {
                  _editLetteFieldDiaog();
                })
          ],
        ),
        Divider(
          height: 1,
          thickness: 1,
        )
      ],
    );
  }
}
