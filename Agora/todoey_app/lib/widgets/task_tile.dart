import 'package:flutter/material.dart';

class TaskTile extends StatefulWidget {
  @override
  _TaskTileState createState() => _TaskTileState();
}

class _TaskTileState extends State<TaskTile> {
  bool checkState = false;


  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        "This is a task",
        style: TextStyle(
            color: Colors.black87,
            decoration: checkState ? TextDecoration.lineThrough : null),
      ),
      trailing: CheckBox(isCheckBoxState: checkState, checkBoxChangeState:(bool newValue) {
        setState(() {
          checkState = newValue;
        },);
      },),
    );
  }
}

class CheckBox extends StatelessWidget {
  final bool isCheckBoxState;
  final Function checkBoxChangeState;

  CheckBox({this.isCheckBoxState, this.checkBoxChangeState});

  @override
  Widget build(BuildContext context) {
    return Checkbox(
      value: isCheckBoxState,
      onChanged: checkBoxChangeState,
    );
  }
}
