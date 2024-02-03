import 'package:flutter/material.dart';

class ListenableProxyProvider extends StatelessWidget {
  final Locale locale;

  const ListenableProxyProvider({super.key, required this.locale});

  @override
  Widget build(BuildContext context) {
    return Text(runtimeType.toString());
  }
}
