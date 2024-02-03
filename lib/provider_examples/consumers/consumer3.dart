import 'package:flutter/material.dart';

class Consumer3 extends StatelessWidget {
  final Locale locale;

  const Consumer3({super.key, required this.locale});

  @override
  Widget build(BuildContext context) {
    return Text(runtimeType.toString());
  }
}
