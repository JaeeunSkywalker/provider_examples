import 'package:flutter/material.dart';

class ListenableProxyProvider2 extends StatelessWidget {
  final Locale locale;

  const ListenableProxyProvider2({super.key, required this.locale});

  @override
  Widget build(BuildContext context) {
    return Text(runtimeType.toString());
  }
}
