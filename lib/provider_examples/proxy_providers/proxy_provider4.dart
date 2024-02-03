import 'package:flutter/material.dart';

class ProxyProvider4 extends StatelessWidget {
  final Locale locale;

  const ProxyProvider4({super.key, required this.locale});

  @override
  Widget build(BuildContext context) {
    return Text(runtimeType.toString());
  }
}
