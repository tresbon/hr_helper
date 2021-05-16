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
    TextEditingController _contoller = TextEditingController(text: mapValue);
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

  Future<void> _addSkillDialog() async {
    TextEditingController _contoller = TextEditingController();
    return showDialog<void>(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Добавить навык"),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                TextField(
                  keyboardType: TextInputType.text,
                  maxLines: 1,
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
                  textElements[_contoller.text] = "";
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
    return Column(
      children: [
        ListView.builder(
            shrinkWrap: true,
            itemCount: textElements.length,
            itemBuilder: (BuildContext context, int index) {
              String mapKey = textElements.keys.elementAt(index);
              return Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    mapKey,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(textElements[mapKey]),
                      IconButton(
                          icon: Icon(Icons.edit),
                          onPressed: () =>
                              {_showMyDialog(mapKey, textElements[mapKey])})
                    ],
                  ),
                ],
              );
            }),
        ElevatedButton(onPressed: () => {_addSkillDialog()}, child: Text("Добавить навык"),),

      ],
    );
  }
}
