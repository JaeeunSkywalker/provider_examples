import 'package:flutter/material.dart';

class Provider extends StatelessWidget {
  final Locale locale;

  const Provider({super.key, required this.locale});

  @override
  Widget build(BuildContext context) {
    return Text(runtimeType.toString());
  }
}
