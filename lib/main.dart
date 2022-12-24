import 'package:flutter/material.dart';
import 'package:paralelism/core/di/di.dart';

import 'app_widget.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  Di.registerDependencies();

  runApp(const AppWidget());
}
