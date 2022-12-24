import 'package:flutter/material.dart';
import 'package:paralelism/core/di/di.dart';

import 'app_widget.dart';

void main() {
  
  Di.registerDependencies();

  runApp(const AppWidget());
}



