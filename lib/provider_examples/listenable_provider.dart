import 'package:flutter/material.dart';

class ListenableProvider extends StatelessWidget {
  final Locale locale;

  const ListenableProvider({super.key, required this.locale});

  @override
  Widget build(BuildContext context) {
    return Text(runtimeType.toString());
  }
}
