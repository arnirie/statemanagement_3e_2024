import 'package:flutter/material.dart';

class ChangeColor extends StatefulWidget {
  const ChangeColor({super.key});

  @override
  State<ChangeColor> createState() => _ChangeColorState();
}

class _ChangeColorState extends State<ChangeColor> {
  var containerColor = Colors.yellow;

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Container(
        height: 300,
        width: 300,
        color: containerColor,
      ),
      ElevatedButton(
        onPressed: () {
          setState(() {
            containerColor = Colors.blue;
          });
        },
        child: Text('Change'),
      )
    ]);
  }
}
