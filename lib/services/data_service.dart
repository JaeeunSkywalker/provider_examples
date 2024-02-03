import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:provider_sample/models/tab_info.dart';

Future<List<TabInfo>> loadToTabInfo() async {
  final jsonString = await rootBundle.loadString('assets/tab_info.json');
  final jsonResponse = json.decode(jsonString);
  List<TabInfo> tabs = (jsonResponse['tabs'] as List)
      .map((tabJson) => TabInfo.fromJson(tabJson))
      .toList();
  return tabs;
}
