import 'package:flutter/material.dart';
import 'package:provider_sample/services/platform_service.dart';

class PaddedText extends StatelessWidget {
  final String text;
  final EdgeInsetsGeometry padding;

  const PaddedText(
      {required this.text,
      this.padding = const EdgeInsets.all(16.0),
      super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: Text(
        text,
      ),
    );
  }
}

class CommonText extends StatelessWidget {
  final String text;
  final String githubUrl;
  final String locale;

  const CommonText(
      {required this.text,
      required this.githubUrl,
      required this.locale,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 10.0),
        PaddedText(text: text),
        ElevatedButton(
          onPressed: () => PlatformService.openUrl(githubUrl),
          child: locale == "ko_KR"
              ? const Text('깃헙에서 코드 보기')
              : const Text('View code on Github'),
        )
      ],
    );
  }
}
