import 'package:flutter/material.dart';

class Selector3 extends StatelessWidget {
  final Locale locale;

  const Selector3({super.key, required this.locale});

  @override
  Widget build(BuildContext context) {
    return Text(runtimeType.toString());
  }
}
