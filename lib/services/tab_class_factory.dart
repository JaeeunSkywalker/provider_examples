import 'package:flutter/material.dart';

import '../models_and_providers//tab_class_mapping.dart';

Widget getTabClassByName(String className, Locale locale) {
  return tabClasses[className]?.call(locale) ?? Container();
}
