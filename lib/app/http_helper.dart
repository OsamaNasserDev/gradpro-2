import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class HttpHelper {
  static late http.Client httpRequest;

  static init() {
    httpRequest = http.Client();
  }
}