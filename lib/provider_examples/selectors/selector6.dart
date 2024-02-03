import 'package:flutter/material.dart';

class Selector6 extends StatelessWidget {
  final Locale locale;

  const Selector6({super.key, required this.locale});

  @override
  Widget build(BuildContext context) {
    return Text(runtimeType.toString());
  }
}
