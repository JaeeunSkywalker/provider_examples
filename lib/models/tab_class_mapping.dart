import 'package:flutter/material.dart';

import '../provider_examples/change_notifier_provider.dart';
import '../provider_examples/change_notifier_proxy_providers/change_notifier_proxy_provider.dart';
import '../provider_examples/change_notifier_proxy_providers/change_notifier_proxy_provider0.dart';
import '../provider_examples/change_notifier_proxy_providers/change_notifier_proxy_provider2.dart';
import '../provider_examples/change_notifier_proxy_providers/change_notifier_proxy_provider3.dart';
import '../provider_examples/change_notifier_proxy_providers/change_notifier_proxy_provider4.dart';
import '../provider_examples/change_notifier_proxy_providers/change_notifier_proxy_provider5.dart';
import '../provider_examples/change_notifier_proxy_providers/change_notifier_proxy_provider6.dart';
import '../provider_examples/consumers/consumer.dart';
import '../provider_examples/consumers/consumer2.dart';
import '../provider_examples/consumers/consumer3.dart';
import '../provider_examples/consumers/consumer4.dart';
import '../provider_examples/consumers/consumer5.dart';
import '../provider_examples/consumers/consumer6.dart';
import '../provider_examples/deferred_inherited_provider.dart';
import '../provider_examples/future_provider.dart';
import '../provider_examples/inherited_context.dart';
import '../provider_examples/inherited_provider.dart';
import '../provider_examples/listenable_provider.dart';
import '../provider_examples/listenable_proxy_providers/listenable_proxy_provider.dart';
import '../provider_examples/listenable_proxy_providers/listenable_proxy_provider0.dart';
import '../provider_examples/listenable_proxy_providers/listenable_proxy_provider2.dart';
import '../provider_examples/listenable_proxy_providers/listenable_proxy_provider3.dart';
import '../provider_examples/listenable_proxy_providers/listenable_proxy_provider4.dart';
import '../provider_examples/listenable_proxy_providers/listenable_proxy_provider5.dart';
import '../provider_examples/listenable_proxy_providers/listenable_proxy_provider6.dart';
import '../provider_examples/multi_provider.dart';
import '../provider_examples/provider.dart';
import '../provider_examples/provider_binding.dart';
import '../provider_examples/proxy_providers/proxy_provider.dart';
import '../provider_examples/proxy_providers/proxy_provider0.dart';
import '../provider_examples/proxy_providers/proxy_provider2.dart';
import '../provider_examples/proxy_providers/proxy_provider3.dart';
import '../provider_examples/proxy_providers/proxy_provider4.dart';
import '../provider_examples/proxy_providers/proxy_provider5.dart';
import '../provider_examples/proxy_providers/proxy_provider6.dart';
import '../provider_examples/reassemble_handler.dart';
import '../provider_examples/selectors/selector.dart';
import '../provider_examples/selectors/selector0.dart';
import '../provider_examples/selectors/selector2.dart';
import '../provider_examples/selectors/selector3.dart';
import '../provider_examples/selectors/selector4.dart';
import '../provider_examples/selectors/selector5.dart';
import '../provider_examples/selectors/selector6.dart';
import '../provider_examples/stream_provider.dart';
import '../provider_examples/value_listenable_provider.dart';

final Map<String, Widget Function(Locale)> tabClasses = {
  'ChangeNotifierProvider': (locale) => ChangeNotifierProvider(locale: locale),
  'ChangeNotifierProxyProvider': (locale) =>
      ChangeNotifierProxyProvider(locale: locale),
  'ChangeNotifierProxyProvider0': (locale) =>
      ChangeNotifierProxyProvider0(locale: locale),
  'ChangeNotifierProxyProvider2': (locale) =>
      ChangeNotifierProxyProvider2(locale: locale),
  'ChangeNotifierProxyProvider3': (locale) =>
      ChangeNotifierProxyProvider3(locale: locale),
  'ChangeNotifierProxyProvider4': (locale) =>
      ChangeNotifierProxyProvider4(locale: locale),
  'ChangeNotifierProxyProvider5': (locale) =>
      ChangeNotifierProxyProvider5(locale: locale),
  'ChangeNotifierProxyProvider6': (locale) =>
      ChangeNotifierProxyProvider6(locale: locale),
  'Consumer': (locale) => Consumer(locale: locale),
  'Consumer2': (locale) => Consumer2(locale: locale), // 10
  'Consumer3': (locale) => Consumer3(locale: locale),
  'Consumer4': (locale) => Consumer4(locale: locale),
  'Consumer5': (locale) => Consumer5(locale: locale),
  'Consumer6': (locale) => Consumer6(locale: locale),
  'DeferredInheritedProvider': (locale) =>
      DeferredInheritedProvider(locale: locale),
  'FutureProvider': (locale) => FutureProvider(locale: locale),
  'InheritedContext': (locale) => InheritedContext(locale: locale),
  'InheritedProvider': (locale) => InheritedProvider(locale: locale),
  'ListenableProvider': (locale) => ListenableProvider(locale: locale),
  'ListenableProxyProvider': (locale) =>
      ListenableProxyProvider(locale: locale), // 20
  'ListenableProxyProvider0': (locale) =>
      ListenableProxyProvider0(locale: locale),
  'ListenableProxyProvider2': (locale) =>
      ListenableProxyProvider2(locale: locale),
  'ListenableProxyProvider3': (locale) =>
      ListenableProxyProvider3(locale: locale),
  'ListenableProxyProvider4': (locale) =>
      ListenableProxyProvider4(locale: locale),
  'ListenableProxyProvider5': (locale) =>
      ListenableProxyProvider5(locale: locale),
  'ListenableProxyProvider6': (locale) =>
      ListenableProxyProvider6(locale: locale),
  'MultiProvider': (locale) => MultiProvider(locale: locale),
  'Provider': (locale) => Provider(locale: locale),
  'ProviderBinding': (locale) => ProviderBinding(locale: locale),
  'ProxyProvider': (locale) => ProxyProvider(locale: locale), // 30
  'ProxyProvider0': (locale) => ProxyProvider0(locale: locale),
  'ProxyProvider2': (locale) => ProxyProvider2(locale: locale),
  'ProxyProvider3': (locale) => ProxyProvider3(locale: locale),
  'ProxyProvider4': (locale) => ProxyProvider4(locale: locale),
  'ProxyProvider5': (locale) => ProxyProvider5(locale: locale),
  'ProxyProvider6': (locale) => ProxyProvider6(locale: locale),
  'ReassembleHandler': (locale) => ReassembleHandler(locale: locale),
  'Selector': (locale) => Selector(locale: locale),
  'Selector0': (locale) => Selector0(locale: locale),
  'Selector2': (locale) => Selector2(locale: locale), // 40
  'Selector3': (locale) => Selector3(locale: locale),
  'Selector4': (locale) => Selector4(locale: locale),
  'Selector5': (locale) => Selector5(locale: locale),
  'Selector6': (locale) => Selector6(locale: locale),
  'StreamProvider': (locale) => StreamProvider(locale: locale),
  'ValueListenableProvider': (locale) =>
      ValueListenableProvider(locale: locale), // 46
};
