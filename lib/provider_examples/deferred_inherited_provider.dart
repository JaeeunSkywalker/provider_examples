import 'package:flutter/material.dart';

class DeferredInheritedProvider extends StatelessWidget {
  final Locale locale;

  const DeferredInheritedProvider({super.key, required this.locale});

  @override
  Widget build(BuildContext context) {
    return Text(runtimeType.toString());
  }
}
