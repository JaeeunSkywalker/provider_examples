import 'package:flutter/material.dart';
import 'package:provider/provider.dart' as provider;
import 'package:provider_sample/consts/github_url.dart';
import 'package:provider_sample/models_and_providers//for_change_notifier_provider/counter_model.dart';
import 'package:provider_sample/widgets/text.dart';

import '../models_and_providers//for_change_notifier_proxy_providers/login_state.dart';
import '../models_and_providers//for_change_notifier_proxy_providers/user_profile.dart';

class ChangeNotifierProvider extends StatelessWidget {
  final Locale locale;

  const ChangeNotifierProvider({required this.locale, super.key});

  @override
  Widget build(BuildContext context) {
    String text;
    String counterString = '';
    String userLoginState = '';
    switch (locale.languageCode) {
      case 'ko':
        text = 'ChangeNotifier를 기반으로 한 상태를 위젯 트리에 제공하고,\n'
            '상태 변경 시 관련된 위젯들을 자동으로 재구성한다.\n\n'
            '쇼핑 앱에서 장바구니 기능을 구현할 때 쓰거나 한다.\n'
            '여기서는 단순 카운터 기능만 구현됐다.';
        counterString = "카운터";
        userLoginState = "유저의 로그인 상태";
        break;
      case 'en':
        text = "Provides the state based on ChangeNotifier to the widget tree, "
            "and automatically rebuilds related widgets when the state changes.\n\n"
            "It can be used, for example, to implement a shopping cart feature in a shopping app. "
            "Here, only a simple counter functionality is implemented.";
        counterString = "Counter";
        userLoginState = "User's login state";
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
              githubUrl: changeNotifierProviderUrl,
              locale: locale.toString(),
            ),
            provider.Consumer<CounterModel>(
              builder: (context, counter, child) =>
                  Text('$counterString: ${counter.count}'),
            ),
            provider.Consumer<UserProfile>(
              builder: (context, userProfile, child) {
                String displayText;
                final loginState =
                    provider.Provider.of<LoginState>(context, listen: false);
                if (locale.languageCode == "ko") {
                  displayText = loginState.isLoggedIn ? "로그인 유저" : "게스트";
                } else {
                  displayText = userProfile.username;
                }
                return Column(
                  children: <Widget>[
                    Text('$userLoginState: $displayText'),
                  ],
                );
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () =>
            provider.Provider.of<CounterModel>(context, listen: false)
                .increment(),
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
