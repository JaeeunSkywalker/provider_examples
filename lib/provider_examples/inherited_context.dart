import 'package:flutter/material.dart';

class InheritedContext extends StatelessWidget {
  final Locale locale;

  const InheritedContext({super.key, required this.locale});

  @override
  Widget build(BuildContext context) {
    return Text(runtimeType.toString());
  }
}
