import 'package:flutter/material.dart';

class ListenableProxyProvider3 extends StatelessWidget {
  final Locale locale;

  const ListenableProxyProvider3({super.key, required this.locale});

  @override
  Widget build(BuildContext context) {
    return Text(runtimeType.toString());
  }
}
