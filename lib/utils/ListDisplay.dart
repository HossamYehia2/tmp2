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
    return ListView.builder(
      itemCount: widget.itemsList.length,
      itemBuilder: (context, int index) {
        return Card(
          color: Colors.transparent, // Transparent Card background color
          elevation: 0, // No elevation shadow
          child: widget.itemsList[index] as Widget,
        );
      },
    );
  }
}


