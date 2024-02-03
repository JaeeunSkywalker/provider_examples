import 'package:flutter/material.dart';

class FutureProvider extends StatelessWidget {
  final Locale locale;

  const FutureProvider({super.key, required this.locale});

  @override
  Widget build(BuildContext context) {
    return Text(runtimeType.toString());
  }
}
