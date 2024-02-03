import 'package:flutter/material.dart';

class ChangeNotifierProxyProvider3 extends StatelessWidget {
  final Locale locale;

  const ChangeNotifierProxyProvider3({super.key, required this.locale});

  @override
  Widget build(BuildContext context) {
    return Text(runtimeType.toString());
  }
}
