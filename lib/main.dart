import 'package:flutter/material.dart';
import 'package:gradpro/view_model/main_provider.dart';
import 'package:provider/provider.dart';

import 'app/app.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(ChangeNotifierProvider(
    child: MyApp(),
    create: (_) => MainProvider(),
  ));
}
