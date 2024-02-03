import 'package:flutter/material.dart';

class ListenableProxyProvider5 extends StatelessWidget {
  final Locale locale;

  const ListenableProxyProvider5({super.key, required this.locale});

  @override
  Widget build(BuildContext context) {
    return Text(runtimeType.toString());
  }
}
