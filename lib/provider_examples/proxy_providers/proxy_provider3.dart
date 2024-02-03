import 'package:flutter/material.dart';

class ProxyProvider3 extends StatelessWidget {
  final Locale locale;

  const ProxyProvider3({super.key, required this.locale});

  @override
  Widget build(BuildContext context) {
    return Text(runtimeType.toString());
  }
}
