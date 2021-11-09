import 'package:flutter/material.dart';

import 'config/app_config.dart';
import 'screens/app.dart';

void main() async {
  await AppConfig().initialize();
  runApp(MyApp());
}
