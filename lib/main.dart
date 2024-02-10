import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:provider_sample/app_localizations_delegate.dart';
import 'package:provider_sample/consts/config_keywords.dart';
import 'package:provider_sample/home_page.dart';
import 'package:provider_sample/models_and_providers//for_change_notifier_provider/counter_model.dart';
import 'package:provider_sample/models_and_providers//for_change_notifier_proxy_providers/location_provider.dart';
import 'package:provider_sample/models_and_providers//for_change_notifier_proxy_providers/login_state.dart';
import 'package:provider_sample/models_and_providers//for_change_notifier_proxy_providers/settings_notifier.dart';
import 'package:provider_sample/models_and_providers//for_change_notifier_proxy_providers/theme_settings_provider.dart';
import 'package:provider_sample/models_and_providers//for_change_notifier_proxy_providers/user_profile.dart';
import 'package:provider_sample/models_and_providers//for_change_notifier_proxy_providers/weather_provider.dart';
import 'package:provider_sample/models_and_providers//tab_info.dart';
import 'package:provider_sample/provider_examples/change_notifier_proxy_providers/supabase_notifier.dart';
import 'package:provider_sample/services/data_service.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:provider_sample/models_and_providers//for_change_notifier_proxy_providers/user.dart'
    as user;

import 'models_and_providers//for_change_notifier_proxy_providers/app_settings_provider.dart';
import 'models_and_providers//for_change_notifier_proxy_providers/settings.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(
    url: supabase_url,
    anonKey: supabase_anon_key,
  );
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
        ),
        ChangeNotifierProxyProvider0<SupabaseNotifier>(
          create: (context) => SupabaseNotifier(),
          update: (_, notifier) => notifier!..fetchData(),
        ),
        Provider<user.User>(
          create: (_) => user.User('Jane Doe', 17),
        ),
        Provider<Settings>(
          create: (_) => Settings(false),
        ),
        ChangeNotifierProxyProvider2<user.User, Settings, SettingsNotifier>(
          create: (context) => SettingsNotifier(
            Settings(false),
          ),
          update: (_, user, settings, settingsNotifier) {
            final isDarkMode = user.age >= 30 ? true : settings.isDarkMode;
            return SettingsNotifier(Settings(isDarkMode));
          },
        ),
        ChangeNotifierProvider(create: (_) => LocationProvider()),
        ChangeNotifierProvider(create: (_) => WeatherProvider()),
        ChangeNotifierProvider(
            create: (_) => ThemeSettingsProvider('defaultImage')),
        ChangeNotifierProxyProvider3<LocationProvider, WeatherProvider,
            ThemeSettingsProvider, AppSettingsProvider>(
          create: (context) => AppSettingsProvider(
            locationProvider:
                Provider.of<LocationProvider>(context, listen: false),
            weatherProvider:
                Provider.of<WeatherProvider>(context, listen: false),
            themeSettingsProvider:
                Provider.of<ThemeSettingsProvider>(context, listen: false),
          ),
          update: (_, locationProvider, weatherProvider, themeSettingsProvider,
                  appSettingsProvider) =>
              appSettingsProvider!..updateSettings(),
        ),
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
    return Consumer<SettingsNotifier>(
      builder: (context, settingsNotifier, child) {
        return MaterialApp(
          theme: ThemeData.light(),
          darkTheme: ThemeData.dark(),
          themeMode:
              settingsNotifier.isDarkMode ? ThemeMode.dark : ThemeMode.light,
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
      },
    );
  }
}
