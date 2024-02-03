import 'package:flutter/material.dart';

class PaddedText extends StatelessWidget {
  final String text;
  final EdgeInsetsGeometry padding;

  const PaddedText(this.text,
      {this.padding = const EdgeInsets.all(16.0), super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: Text(
        text,
      ),
    );
  }
}
