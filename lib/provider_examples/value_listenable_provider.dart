import 'package:flutter/material.dart';

class ValueListenableProvider extends StatelessWidget {
  final Locale locale;

  const ValueListenableProvider({super.key, required this.locale});

  @override
  Widget build(BuildContext context) {
    return Text(runtimeType.toString());
  }
}
