import 'package:flutter/material.dart';

class Selector extends StatelessWidget {
  final Locale locale;

  const Selector({super.key, required this.locale});

  @override
  Widget build(BuildContext context) {
    return Text(runtimeType.toString());
  }
}
