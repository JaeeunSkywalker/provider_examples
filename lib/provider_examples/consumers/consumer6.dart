import 'package:flutter/material.dart';

class Consumer6 extends StatelessWidget {
  final Locale locale;

  const Consumer6({super.key, required this.locale});

  @override
  Widget build(BuildContext context) {
    return Text(runtimeType.toString());
  }
}
