import 'package:flutter/material.dart';

class BoardTile extends StatelessWidget {
  final String text;
  final VoidCallback onTap;

  const BoardTile({super.key, required this.text, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedSwitcher(
        duration: Duration(milliseconds: 1000),
        child: Container(
          decoration: BoxDecoration(border: Border.all(color: Colors.black)),
          child: Center(
            child: Text(
              text,
              style: TextStyle(fontSize: 48, color: Colors.lightBlue),
            ),
          ),
        ),
      ),
    );
  }
}
