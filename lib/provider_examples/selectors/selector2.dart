import 'package:flutter/material.dart';

class Selector2 extends StatelessWidget {
  final Locale locale;

  const Selector2({super.key, required this.locale});

  @override
  Widget build(BuildContext context) {
    return Text(runtimeType.toString());
  }
}
