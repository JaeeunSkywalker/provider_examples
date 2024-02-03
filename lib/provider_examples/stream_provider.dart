import 'package:flutter/material.dart';

class StreamProvider extends StatelessWidget {
  final Locale locale;

  const StreamProvider({super.key, required this.locale});

  @override
  Widget build(BuildContext context) {
    return Text(runtimeType.toString());
  }
}
