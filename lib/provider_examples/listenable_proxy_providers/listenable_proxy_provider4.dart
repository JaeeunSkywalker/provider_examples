import 'package:flutter/material.dart';

class ListenableProxyProvider4 extends StatelessWidget {
  final Locale locale;

  const ListenableProxyProvider4({super.key, required this.locale});

  @override
  Widget build(BuildContext context) {
    return Text(runtimeType.toString());
  }
}
