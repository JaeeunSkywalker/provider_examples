import 'package:flutter/material.dart';

class ProxyProvider2 extends StatelessWidget {
  final Locale locale;

  const ProxyProvider2({super.key, required this.locale});

  @override
  Widget build(BuildContext context) {
    return Text(runtimeType.toString());
  }
}
