import 'package:flutter/material.dart';

class ProviderBinding extends StatelessWidget {
  final Locale locale;

  const ProviderBinding({super.key, required this.locale});

  @override
  Widget build(BuildContext context) {
    return Text(runtimeType.toString());
  }
}
