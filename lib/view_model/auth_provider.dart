import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AuthProvider with ChangeNotifier {
  Future signIn({required String email, required String password}) async {
    await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email.trim(), password: password);
  }

  Future signUp({required String email, required String password}) async {
    await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email.trim(), password: password).then((res) async{
          print("this is sign up res user!.getIdToken()  ${await res.user!.getIdToken()}");
          print("this is sign up res user!.uid  ${res.user!.uid}");
          print("this is sign up res credential ${res.credential}");
    });
  }

  Future signOut() async {
    await FirebaseAuth.instance.signOut();
  }

  final User? userAuthData = FirebaseAuth.instance.currentUser;

  /* String _token;
  DateTime _expiryDate;
  String _userId;
  bool get isAuth {
    return _token != null;
  }
  String get token {
    if (_expiryDate != null && _expiryDate.isAfter(DateTime.now()) &&
        _token != null) {
      return _token;
    }
    return null;
  }
*/

  Future<void> authenticate(
      String email, String password, String urlSegment) async {
    final Uri url = Uri.parse(
        "https://identitytoolkit.googleapis.com/v1/accounts:$urlSegment?key=AIzaSyBCnG0EfH0CDyxpgOJ11UfXfqwEltN1T3o");
    try {
      final res = await http.post(url,
          body: json.encode({
            'email': email,
            'password': password,
            'returnSecureToken': true,
          }));
      notifyListeners();
      final resData = json.decode(res.body);
      if (resData['error'] != null) {
        throw "${resData['error']['message']}";
      }
/*
      _token = resData['idToken	'];
      _userId = resData['localId'];
      _expiryDate = DateTime.now().add(
          Duration(seconds: int.parse(resData['expiresIn'])));
      notifyListeners();
      final prefs = await SharedPreferences.getInstance();
      final userData = json.encode({
        'token': _token,
        'userId': _userId,
        'expiryData':_expiryDate.toIso8601String(),
      });
      prefs.setString('userData', userData);*/
      notifyListeners();
    } catch (e) {
      throw e;
    }
  }

  /* Future<void> signUp(String name, int age, String address, String phoneNumber, String email, String password) async{
    authenticate(email, password, "signUp");
  }*/

  /* Future<bool> autoLogin() async{
    final prefs = await SharedPreferences.getInstance();
    if(!prefs.containsKey('userData')){
      return false;
    }
    final extractedUserData = json.decode(prefs.getString('userData')) as Map<String, Object>;
    final expiry = DateTime.parse(extractedUserData['expiryData']);
    if(expiry.isBefore(DateTime.now())){
      return false;
    }
    _token = extractedUserData['token'];
    _userId = extractedUserData['userId'];
    _expiryDate = expiry;
    notifyListeners();
    return true;
  }*/

  void showErrorDialog(BuildContext ctx, String message) {
    showDialog(
        context: ctx,
        builder: (innerCtx) => AlertDialog(
              title: Text("حدث خطا ما!"),
              content: Text(message),
              actions: [
                TextButton(
                  child: Text("رجوع"),
                  onPressed: () {
                    Navigator.of(innerCtx).pop();
                  },
                ),
              ],
            ));
  }

  int currentIndex = 0;

  void onButtonPageView(int val) {
    currentIndex = val;
    notifyListeners();
  }

  var day1Controller = TextEditingController(),
      day2Controller = TextEditingController(),
      day3Controller = TextEditingController(),
      day4Controller = TextEditingController(),
      day5Controller = TextEditingController(),
      day6Controller = TextEditingController(),
      friController = TextEditingController();
}
