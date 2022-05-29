import 'dart:convert';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:gradpro/app/http_helper.dart';
import 'package:gradpro/view_model/main_provider.dart';
import 'package:provider/provider.dart';

import 'app/app.dart';
import 'app/cash_helper.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await CacheHelper.init();
  await HttpHelper.init();
  // final Uri url = Uri.parse(
  //     'https://doctor-782d8-default-rtdb.firebaseio.com/Archive.json');
  // HttpHelper.httpRequest.get(url).then((res) {
  //   print(json.decode(res.body));
  // });

  runApp(ChangeNotifierProvider(
    child: MyApp(),
    create: (_) => MainProvider(),
  ));
}
