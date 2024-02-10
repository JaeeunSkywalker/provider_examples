import 'package:flutter/material.dart';
import 'package:provider_sample/consts/github_url.dart';
import 'package:provider_sample/models_and_providers//for_change_notifier_proxy_providers/login_state.dart';
import 'package:provider_sample/models_and_providers//for_change_notifier_proxy_providers/user_profile.dart';
import 'package:provider/provider.dart' as provider;

import '../../models_and_providers//for_change_notifier_provider/counter_model.dart';
import '../../widgets/text.dart';

class ChangeNotifierProxyProvider extends StatelessWidget {
  final Locale locale;

  const ChangeNotifierProxyProvider({required this.locale, super.key});

  @override
  Widget build(BuildContext context) {
    String text;
    String counterString = '';
    String userLoginState = '';
    String login = '';
    String logout = '';
    switch (locale.languageCode) {
      case 'ko':
        text = '하나의 데이터 모델이 다른 데이터 모델에 의존할 때 유용하다.\n'
            '이는 특히 다른 프로바이더의 상태에 따라 업데이트되어야 하는 데이터 모델을 관리할 때 사용하기 적합하다.\n\n'
            '사용자의 로그인 상태에 따라 다른 데이터를 보여주는 사용자 프로필 정보 관리에 사용하기 좋다.';
        userLoginState = "유저의 로그인 상태";
        counterString = "카운터";
        login = "로그인";
        logout = "로그아웃";
        break;
      case 'en':
        text = "Useful when one data model depends on another data model.\n"
            "It is especially suited for managing data models that need to be updated based on the state of another provider.\n\n"
            "Great for managing user profile information that shows different data depending on the user's login status.";
        userLoginState = "User's login state";
        counterString = "Counter";
        login = "login";
        logout = "logout";

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
              githubUrl: changeNotifierProxyProviderUrl,
              locale: locale.toString(),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    provider.Provider.of<LoginState>(context, listen: false)
                        .login();
                  },
                  child: Text(login),
                ),
                ElevatedButton(
                  onPressed: () {
                    provider.Provider.of<LoginState>(context, listen: false)
                        .logout();
                  },
                  child: Text(logout),
                ),
              ],
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
            provider.Consumer<CounterModel>(
              builder: (context, counter, child) {
                return Text('$counterString: ${counter.count}');
              },
            ),
          ],
        ),
      ),
    );
  }
}
