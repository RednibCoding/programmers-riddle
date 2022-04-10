import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Cell extends StatefulWidget {
  int value = 0;
  double size;
  double fontSize;
  Function? onTap;
  Cell({Key? key, required this.size, required this.fontSize, this.onTap}) : super(key: key);

  @override
  _CellState createState() => _CellState();
}

class _CellState extends State<Cell> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.size,
      height: widget.size,
      child: OutlinedButton(
        child: Text(widget.value == 0 ? "O" : "I", style: TextStyle(fontSize: widget.fontSize)),
        onPressed: _onPressed,
        style: ButtonStyle(padding: MaterialStateProperty.all<EdgeInsets>(const EdgeInsets.all(4))),
      ),
    );
  }

  void _onPressed() {
    setState(() {
      widget.value = 1 - widget.value;
      widget.onTap?.call();
    });
  }
}
