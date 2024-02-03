import 'package:flutter/material.dart';

class InheritedProvider extends StatelessWidget {
  final Locale locale;

  const InheritedProvider({super.key, required this.locale});

  @override
  Widget build(BuildContext context) {
    return Text(runtimeType.toString());
  }
}
