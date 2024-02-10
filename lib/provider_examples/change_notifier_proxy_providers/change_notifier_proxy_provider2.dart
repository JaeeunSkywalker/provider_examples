import 'package:flutter/material.dart';
import 'package:provider_sample/models_and_providers//for_change_notifier_proxy_providers/settings_notifier.dart';

import '../../consts/github_url.dart';
import '../../widgets/text.dart';
import 'package:provider/provider.dart' as provider;

class ChangeNotifierProxyProvider2 extends StatelessWidget {
  final Locale locale;

  const ChangeNotifierProxyProvider2({super.key, required this.locale});

  @override
  Widget build(BuildContext context) {
    String text;

    switch (locale.languageCode) {
      case 'ko':
        text = '데이터나 객체를 다른 클래스로부터 받아와야 하고, 이를 통해 상태를 관리해야 하는 상황에서 활용할 수 있다.';
        break;
      case 'en':
        text =
            'This can be used in situations where data or objects need to be obtained from another class, and through this, the state must be managed.';
        break;
      default:
        text = '';
    }
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            CommonText(
              text: text,
              githubUrl: changeNotifierProxyProvider2Url,
              locale: locale.toString(),
            ),
            const SizedBox(height: 10.0),
            locale.languageCode == "ko"
                ? const PaddedText(
                    text:
                        '여기서는 User 모델과 Settings 모델을 가지고 사용자 설정(다크 모드)을 업데이트 해 본다.',
                  )
                : const PaddedText(
                    text:
                        'Here, I will update user settings(dark mode) using the User model and Settings model.',
                  ),
            provider.Consumer<SettingsNotifier>(
              builder: (context, settingsNotifier, _) {
                return Switch(
                  value: settingsNotifier.isDarkMode,
                  onChanged: (val) {
                    settingsNotifier.updateDarkMode(val);
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
