import 'package:flutter/material.dart';

import '../../widgets/text.dart';

class ChangeNotifierProxyProvider extends StatelessWidget {
  final Locale locale;

  const ChangeNotifierProxyProvider({required this.locale, super.key});

  @override
  Widget build(BuildContext context) {
    String text;
    switch (locale.languageCode) {
      case 'ko':
        text = '하나의 데이터 모델이 다른 데이터 모델에 의존할 때 유용하다.\n'
            '이는 특히 다른 프로바이더의 상태에 따라 업데이트되어야 하는 데이터 모델을 관리할 때 사용하기 적합하다.\n\n'
            '사용자의 로그인 상태에 따라 다른 데이터를 보여주는 사용자 프로필 정보 관리에 사용하기 좋다.';
        break;
      case 'en':
        text = "Useful when one data model depends on another data model.\n"
            "It is especially suited for managing data models that need to be updated based on the state of another provider.\n\n"
            "Great for managing user profile information that shows different data depending on the user's login status.";

        break;
      default:
        text = '';
    }
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            const SizedBox(
              height: 10.0,
            ),
            Text('$runtimeType example'),
            PaddedText(text),
          ],
        ),
      ),
    );
  }
}
