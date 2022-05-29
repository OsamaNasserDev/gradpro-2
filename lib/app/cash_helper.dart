import 'package:get_storage/get_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper {

  static GetStorage? box;

  static init() async {
    box = GetStorage();
  }

  /// for Strings data
  static saveStringToBox({required String key, required String data}) {
    if (box != null) {
      box!.write(key, data);
    } else {}
  }
  static String? loadStringFromBox({required String key}) {
    if(box != null){
      return box!.read(key);
    }else{
      return null;
    }
  }

  /// for integers data
  static saveIntToBox({required String key, required int data}) {
    if (box != null) {
      box!.write(key, data);
    } else {}
  }
  static int? loadIntFromBox({required String key}) {
    if(box != null){
      return box!.read(key);
    }else{
      return null;
    }
  }

  /// for bool data
  static saveBoolToBox({required String key, required bool data}) {
    if (box != null) {
      box!.write(key, data);
    } else {}
  }
  static bool? loadBoolFromBox({required String key}) {
    if(box != null){
      return box!.read(key);
    }else{
      return null;
    }
  }

  /// for list data
  static saveListToBox({required String key, required List data}) {
    if (box != null) {
      box!.write(key, data);
    } else {}
  }
  static List? loadListFromBox({required String key}) {
    if(box != null){
      return box!.read(key);
    }else{
      return null;
    }
  }

  /// remove any key data
  static removeBox({required String key}){
    if(box != null){
      box!.remove(key);
    }else{}
  }

}

class CashKeys {
  static const String uId = "userId";
}


