import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:provider_sample/app_localizations_delegate.dart';
import 'package:provider_sample/home_page.dart';
import 'package:provider_sample/models/for_change_notifier_provider/counter_model.dart';
import 'package:provider_sample/models/for_change_notifier_proxy_providers/login_state.dart';
import 'package:provider_sample/models/for_change_notifier_proxy_providers/user_profile.dart';
import 'package:provider_sample/models/tab_info.dart';
import 'package:provider_sample/services/data_service.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<CounterModel>(
          create: (context) => CounterModel(),
        ),
        ChangeNotifierProvider<LoginState>(
          create: (context) => LoginState(),
        ),
        ChangeNotifierProxyProvider<LoginState, UserProfile>(
          create: (context) => UserProfile(),
          update: (context, loginState, userProfile) =>
              userProfile!..updateFromLoginState(loginState),
        )
      ],
      child: const MyApp(),
    ),
  );
}

// TODO: 메인(홈) 화면에서  좌측으로 스와이프 했을 때 앱 종료 안 되게 하기.
// TODO: 탭바 UI 더 나은 거 있는지 생각해 보기.
// TODO: iOS에서 url 열리는지 확인할 것.

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Locale _appLocale = const Locale('ko', 'KR');

  void _setLocale(Locale locale) {
    setState(() {
      _appLocale = locale;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      locale: _appLocale,
      localizationsDelegates: [
        AppLocalizationsDelegate(),
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('ko', 'KR'),
        Locale('en', 'US'),
      ],
      home: FutureBuilder<List<TabInfo>>(
        future: loadToTabInfo(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final tabs = snapshot.data;
            return HomePage(
              tabs: tabs!,
              setLocale: _setLocale,
              locale: _appLocale,
            );
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else {
            return const CircularProgressIndicator();
          }
        },
      ),
    );
  }
}
