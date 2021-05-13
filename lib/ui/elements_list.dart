import 'package:flutter/material.dart';

class TextElements extends StatefulWidget {
  @override
  _TextElementsState createState() => _TextElementsState();
}

class _TextElementsState extends State<TextElements> {
  @override
  Map<String, String> textElements = {
    "Системное мышление": "",
    "Софт скиллы": "",
  };

  Future<void> _showMyDialog(String mapKey, String mapValue) async {
    TextEditingController _contoller = TextEditingController(
      text: mapValue
    );
    return showDialog<void>(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(mapKey),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                TextField(
                  controller: _contoller,
                  onSubmitted: (String value) => {_contoller.text = value},
                ),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Удалить'),
              onPressed: () {
                setState(() {
                  textElements.remove(mapKey);
                });
                Navigator.of(context).pop();
              },
            ),
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
                  textElements[mapKey] = _contoller.text;
                });
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        itemCount: textElements.length,
        itemBuilder: (BuildContext context, int index) {
          String mapKey = textElements.keys.elementAt(index);
          return Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(textElements[mapKey]),
              ElevatedButton(onPressed: () => {_showMyDialog(mapKey, textElements[mapKey])}, child: Text(mapKey))
            ],
          );
        });
  }
}
