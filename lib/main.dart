import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:gradpro/view_model/main_provider.dart';
import 'package:provider/provider.dart';

import 'app/app.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp();
  runApp(ChangeNotifierProvider(
    child: MyApp(),
    create: (_) => MainProvider(),
  ));
}
