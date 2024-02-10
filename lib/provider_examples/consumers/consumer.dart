import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../../services/platform_service.dart';

class Consumer extends StatelessWidget {
  final Locale locale;

  const Consumer({super.key, required this.locale});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20.0),
      child: RichText(
        text: TextSpan(
          style: DefaultTextStyle.of(context).style,
          children: <TextSpan>[
            const TextSpan(
              text:
                  "In the 'Classes' section of the official documentation at ",
              style: TextStyle(fontSize: 16, color: Colors.black),
            ),
            TextSpan(
              text:
                  "https://pub.dev/documentation/provider/latest/provider/provider-library.html",
              style: const TextStyle(
                  fontSize: 16,
                  color: Colors.blue,
                  decoration: TextDecoration.underline),
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  PlatformService.openUrl(
                      "https://pub.dev/documentation/provider/latest/provider/provider-library.html");
                },
            ),
            const TextSpan(
              text:
                  ", providers and consumers are listed together. However, the ",
              style: TextStyle(fontSize: 16, color: Colors.black),
            ),
            const TextSpan(
              text: "Consumer",
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.deepOrange),
            ),
            const TextSpan(
              text: " mentioned here is not a provider itself. The ",
              style: TextStyle(fontSize: 16, color: Colors.black),
            ),
            const TextSpan(
              text: "Consumer",
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.deepOrange),
            ),
            const TextSpan(
              text:
                  " is a widget that solely consumes data from providers. In this project, ",
              style: TextStyle(fontSize: 16, color: Colors.black),
            ),
            const TextSpan(
              text: "Consumer and Consumer3",
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.green),
            ),
            const TextSpan(
              text: " have been previously used. ",
              style: TextStyle(fontSize: 16, color: Colors.black),
            ),
            const TextSpan(
              text: "Consumer2 and Consumer3",
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.green),
            ),
            const TextSpan(
              text: " are very similar in structure, and ",
              style: TextStyle(fontSize: 16, color: Colors.black),
            ),
            const TextSpan(
              text: "Consumer4 to Consumer6",
              style: TextStyle(
                  fontSize: 16, fontWeight: FontWeight.bold, color: Colors.red),
            ),
            const TextSpan(
              text: " are too complex to be implemented here.",
              style: TextStyle(fontSize: 16, color: Colors.black),
            ),
          ],
        ),
      ),
    );
  }
}
