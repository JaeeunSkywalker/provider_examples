import 'package:flutter/material.dart';

class Consumer5 extends StatelessWidget {
  final Locale locale;

  const Consumer5({super.key, required this.locale});

  @override
  Widget build(BuildContext context) {
    return Text(runtimeType.toString());
  }
}
