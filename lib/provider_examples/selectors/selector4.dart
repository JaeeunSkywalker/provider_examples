import 'package:flutter/material.dart';

class Selector4 extends StatelessWidget {
  final Locale locale;

  const Selector4({super.key, required this.locale});

  @override
  Widget build(BuildContext context) {
    return Text(runtimeType.toString());
  }
}
