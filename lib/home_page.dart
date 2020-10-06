import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  final List<String> items =
      List<String>.generate(30, (index) => "Item ${1 + index}");

  Widget _getListTile(BuildContext context, String text, int index) {
    return Dismissible(
      key: Key(items[index]),
      onDismissed: (direction) {
        items.removeAt(index);
        Scaffold.of(context).showSnackBar(
          SnackBar(
            content: Text("Item Deleted"),
          ),
        );
      },
      background: Container(
        color: Colors.red,
        child: Text(
          'Delete',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      child: ListTile(
        leading: CircleAvatar(
          radius: 20,
          // backgroundImage: ExactAssetImage('assets/image.jpg'),
          // child: Image.asset(
          //   'assets/image.jpg',
          // ),
          child: Text((1 + index).toString()),
        ),
        title: Text(text),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Swipe Action")),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (BuildContext context, int index) {
          return _getListTile(context, items[index], index);
        },
      ),
    );
  }
}
