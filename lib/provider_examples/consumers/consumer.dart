import 'package:flutter/material.dart';

class Consumer extends StatelessWidget {
  final Locale locale;

  const Consumer({super.key, required this.locale});

  @override
  Widget build(BuildContext context) {
    return Text(runtimeType.toString());
  }
}
