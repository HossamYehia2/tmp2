import 'package:flutter/material.dart';

class ListDisplay extends StatefulWidget {
  final List<Object> itemsList;

  const ListDisplay({Key? key, required this.itemsList}) : super(key: key);

  @override
  State createState() => DynamicList();
}

class DynamicList extends State<ListDisplay> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: <Widget>[
        Expanded(
            child: ListView.builder(
                itemCount: widget.itemsList.length,
                itemBuilder: (context, int index) {
                  return Card(
                    child: widget.itemsList[index] as Widget,
                  );
                }))
      ],
    ));
  }
}
