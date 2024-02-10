import 'package:flutter/material.dart';
import 'package:provider_sample/consts/github_url.dart';
import 'package:provider_sample/provider_examples/change_notifier_proxy_providers/supabase_notifier.dart';

import '../../widgets/text.dart';
import 'package:provider/provider.dart' as provider;

class ChangeNotifierProxyProvider0 extends StatelessWidget {
  final Locale locale;

  const ChangeNotifierProxyProvider0({super.key, required this.locale});

  @override
  Widget build(BuildContext context) {
    String text;

    switch (locale.languageCode) {
      case 'ko':
        text =
            'ChangeNotifierProxyProvider는 다른 프로바이더에 의존하지 않고 단독으로 상태를 관리할 수 있는 ChangeNotifier를 제공할 때 사용된다. 그러나 이는 직접적인 사용 사례가 드물어 여기서는 약간 억지로 외부 소스에서 데이터를 비동기적으로 로드해야 하는 상황을 만들어 구현한다.';
        break;
      case 'en':
        text =
            "The ChangeNotifierProxyProvider is used to provide a ChangeNotifier that can manage state independently without relying on other providers. However, direct use cases for this are rare, so here I somewhat contrive a scenario where data must be asynchronously loaded from an external source for implementation.";
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
              githubUrl: changeNotifierProxyProvider0Url,
              locale: locale.toString(),
            ),
            const SizedBox(height: 10.0),
            locale.languageCode == "ko"
                ? const PaddedText(
                    text:
                        "Supabase와 연동되어 있어\n깃헙에서 받은 파일로는 실행하기 어려울 것.\n코드 보고 개념만 이해합시다.",
                  )
                : const PaddedText(
                    text:
                        "Since it's integrated with Supabase, it might be difficult to run with just the files from GitHub. Let's just understand the concept by looking at the code.",
                  ),
            provider.Consumer<SupabaseNotifier>(
              builder: (context, notifier, child) {
                if (notifier.data.isEmpty) {
                  return const Center(
                      child: Padding(
                    padding: EdgeInsets.all(16.0),
                    child: CircularProgressIndicator(),
                  ));
                }
                return Expanded(
                  child: ListView.builder(
                    itemCount: notifier.data.length,
                    itemBuilder: (context, index) {
                      final item = notifier.data[index];
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          userInfoContainer(item),
                        ],
                      );
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

Widget userInfoContainer(dynamic item) {
  return Padding(
    padding: const EdgeInsets.all(16.0),
    child: Column(
      children: [
        Text(
          "USER_ID: ${item['user_id']}",
          overflow: TextOverflow.ellipsis,
        ),
        Text(
          style: const TextStyle(
            fontSize: 16.0,
            fontWeight: FontWeight.bold,
          ),
          "USER_NAME: ${item['user_name']}",
          overflow: TextOverflow.ellipsis,
        ),
        Text(
          "LOGGED_IN_TIME: ${item['logged_in_time']}",
          overflow: TextOverflow.ellipsis,
        ),
      ],
    ),
  );
}
