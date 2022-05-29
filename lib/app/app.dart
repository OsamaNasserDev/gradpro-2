import 'package:flutter/material.dart';
import 'package:gradpro/presentation/resources/routes_manger.dart';
import 'package:gradpro/presentation/resources/theme_manager.dart';

class MyApp extends StatefulWidget {

  // named constructor
  MyApp._internal();

  static  final MyApp _instance =   MyApp._internal();  // singleton or single instance

  factory MyApp() => _instance ;  // factory

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme:getApplicationTheme(),
      debugShowCheckedModeBanner: false,
      onGenerateRoute: RouteGenerator.getRoute,
      initialRoute: Routes.chooseSignRoute,
    );
  }
}