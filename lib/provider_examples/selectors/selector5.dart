import 'package:flutter/material.dart';

class Selector5 extends StatelessWidget {
  final Locale locale;

  const Selector5({super.key, required this.locale});

  @override
  Widget build(BuildContext context) {
    return Text(runtimeType.toString());
  }
}
