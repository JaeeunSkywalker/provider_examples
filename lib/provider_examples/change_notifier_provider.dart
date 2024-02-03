import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_sample/models/counter_model.dart';
import 'package:provider_sample/services/platform_service.dart';
import 'package:provider_sample/widgets/text.dart';

class ChangeNotifierProvider extends StatelessWidget {
  final Locale locale;

  const ChangeNotifierProvider({required this.locale, super.key});

  @override
  Widget build(BuildContext context) {
    String text;
    switch (locale.languageCode) {
      case 'ko':
        text = 'ChangeNotifier를 기반으로 한 상태를 위젯 트리에 제공하고,\n'
            '상태 변경 시 관련된 위젯들을 자동으로 재구성한다.\n\n'
            '쇼핑 앱에서 장바구니 기능을 구현할 때 쓰거나 한다.\n'
            '여기서는 단순 카운터 기능만 구현됐다.';
        break;
      case 'en':
        text = "Provides the state based on ChangeNotifier to the widget tree, "
            "and automatically rebuilds related widgets when the state changes.\n\n"
            "It can be used, for example, to implement a shopping cart feature in a shopping app. "
            "Here, only a simple counter functionality is implemented.";
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
            ElevatedButton(
              onPressed: () {
                PlatformService.openUrl(
                    'https://github.com/JaeeunSkywalker/provider_examples/blob/main/lib/provider_examples/change_notifier_provider.dart');
              },
              child: locale.toString() == "ko_KR"
                  ? const Text('깃헙에서 코드 보기')
                  : const Text('View code on GitHub'),
            ),
            Consumer<CounterModel>(
              builder: (context, counter, child) =>
                  Text('Counter: ${counter.count}'),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () =>
            Provider.of<CounterModel>(context, listen: false).increment(),
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
