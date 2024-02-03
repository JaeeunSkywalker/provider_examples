import 'package:flutter/material.dart';

import 'models/tab_info.dart';
import 'services/tab_class_factory.dart';

class HomePage extends StatelessWidget {
  final Locale locale;
  final List<TabInfo> tabs;
  final Function(Locale) setLocale;

  const HomePage(
      {required this.locale,
      required this.tabs,
      required this.setLocale,
      super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: tabs.length,
      child: Scaffold(
        appBar: AppBar(
          title: locale.toString() == "ko_KR"
              ? const Text("프로바이더 사용 예시")
              : const Text("Provider examples"),
          bottom: TabBar(
            isScrollable: true,
            tabs: tabs.map((tab) => Tab(text: tab.title)).toList(),
          ),
          actions: <Widget>[
            TextButton(
                child: const Text('KR'),
                onPressed: () {
                  setLocale(const Locale('ko', 'KR'));
                }),
            TextButton(
                child: const Text('EN'),
                onPressed: () {
                  setLocale(const Locale('en', 'US'));
                }),
          ],
        ),
        body: TabBarView(
          children: tabs.map((tab) {
            final tabClass = getTabClassByName(
              tab.className,
              locale,
            );
            return tabClass;
          }).toList(),
        ),
      ),
    );
  }
}
