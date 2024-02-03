import 'package:flutter/material.dart';

class MultiProvider extends StatelessWidget {
  final Locale locale;

  const MultiProvider({super.key, required this.locale});

  @override
  Widget build(BuildContext context) {
    return Text(runtimeType.toString());
  }
}
