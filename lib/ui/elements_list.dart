import 'package:flutter/material.dart';

class TextElements extends StatefulWidget {
  Map<String, String> textElements;

  TextElements(this.textElements);

  String getTextElements() {
    return textElements.entries.fold(
        "",
        (k, v) =>
            k.toString() +
            v.key +
            "\n" * 2 +
            ((v.value != "") ? v.value + "\n" * 2 : ""));
  }

  @override
  _TextElementsState createState() => _TextElementsState();
}

class _TextElementsState extends State<TextElements> {
  Map getTextElements() {
    return widget.textElements;
  }

  Future<void> _showMyDialog(String mapKey, String mapValue) async {
    TextEditingController _contoller = TextEditingController(text: mapValue);
    return showDialog<void>(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Expanded(
              child: Text(
            mapKey,
            textAlign: TextAlign.justify,
            textDirection: TextDirection.ltr,
            softWrap: true,
          )),
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
                  widget.textElements.remove(mapKey);
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
                  widget.textElements[mapKey] = _contoller.text;
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
                  widget.textElements[_contoller.text] = "";
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
        ListView.builder(
            shrinkWrap: true,
            itemCount: widget.textElements.length,
            itemBuilder: (BuildContext context, int index) {
              String mapKey = widget.textElements.keys.elementAt(index);
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
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
                        Text(widget.textElements[mapKey]),
                        IconButton(
                            icon: Icon(Icons.edit),
                            onPressed: () => {
                                  _showMyDialog(
                                      mapKey, widget.textElements[mapKey])
                                })
                      ],
                    ),
                    Divider(
                      height: 1,
                      thickness: 1,
                    )
                  ],
                ),
              );
            }),
        ElevatedButton(
          onPressed: () => {_addSkillDialog()},
          child: Text("Добавить навык"),
        ),
      ],
    );
  }
}
