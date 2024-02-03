import 'package:flutter/material.dart';

class ProxyProvider extends StatelessWidget {
  final Locale locale;

  const ProxyProvider({super.key, required this.locale});

  @override
  Widget build(BuildContext context) {
    return Text(runtimeType.toString());
  }
}
