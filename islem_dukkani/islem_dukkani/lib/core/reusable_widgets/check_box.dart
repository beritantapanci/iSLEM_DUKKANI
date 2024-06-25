import 'dart:ffi';

import 'package:flutter/material.dart';

class DefaultCheckBox extends StatefulWidget {
  final onChanged;
  final bool value;

  DefaultCheckBox({Key? key, required this.onChanged, required this.value})
      : super(key: key);

  @override
  _DefaultCheckBoxState createState() => _DefaultCheckBoxState();
}

class _DefaultCheckBoxState extends State<DefaultCheckBox> {
  @override
  Widget build(BuildContext context) {
    return Checkbox(
      activeColor: Colors.teal,
      value: widget.value,
      onChanged: widget.onChanged,
      checkColor: Colors.orange,
      hoverColor: Colors.red,
    );
  }
}
