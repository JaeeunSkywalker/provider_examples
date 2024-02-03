import 'package:flutter/material.dart';

class ChangeNotifierProxyProvider2 extends StatelessWidget {
  final Locale locale;

  const ChangeNotifierProxyProvider2({super.key, required this.locale});

  @override
  Widget build(BuildContext context) {
    return Text(runtimeType.toString());
  }
}
