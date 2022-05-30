import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gradpro/model/user.dart';

import '../component/drop_down_numbers.dart';

class MainProvider with ChangeNotifier {
  /// search method
  String searchWord = '';

  searchOnSubmitted(value) {
    searchWord = value;
    notifyListeners();

    /// todo : search method on firebase
  }

  /// bottom sheet
  int? dropYearGroupValue;

  dropDownOnTap(value) {
    dropYearGroupValue = value;
    notifyListeners();
  }

  filterInitState() {
    dropYearGroupValue = null;
    //notifyListeners();
  }


  /// multi select
  List selectedFieldsOfLanguages = [];
  List selectedFieldsOfTools = [];
  List selectedSoftOthers = [];
  List selectedSoftSoftSkills = [];

  multiSelectLanguages(values) {
    selectedFieldsOfLanguages = values;
    notifyListeners();
  }

  multiSelectTools(values) {
    selectedFieldsOfTools = values;
    notifyListeners();
  }

  multiSelectOthers(values) {
    selectedSoftOthers = values;
    notifyListeners();
  }

  multiSelectSoftSkills(values) {
    selectedSoftSoftSkills = values;
    notifyListeners();
  }




  /// auth methods
  Future signUp({required String email, required String password}) async {
    await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email.trim(), password: password)
        .then((res) async {
      //print("this is sign up res user!.getIdToken()  ${await res.user!.getIdToken()}");
      print("this is sign up res user!.uid  ${res.user!.uid}");

      await FirebaseFirestore.instance
          .collection('users')
          .doc(res.user!.uid)
          .set({
        'id': res.user!.uid,
        'name': 'name',
        'bio': "bio",
        'image': 'image',
        'email': res.user!.email,
        'role': 0,
        'projectsIds': [
          {'id': "id1", 'name': "name1"},
          {'id': "id2", 'name': "name2"},
        ],
        'skills': ['skill1', 'skill2', 'skill3'],
        'others': ['others1', 'others2', 'others3'],
        'tools': ['tools1', 'tools2', 'tools3'],
        'languages': ['languages1', 'languages2', 'languages3'],
        "teamId": null, // get all team from it
      });
    });
  }
  Future signIn({required String email, required String password}) async {
    await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email.trim(), password: password);
  }

  final User? userAuthData = FirebaseAuth.instance.currentUser;

  Future getUserData() async {
    final User? userAuthData = FirebaseAuth.instance.currentUser;
    if (userAuthData != null) {
      FirebaseFirestore.instance
          .collection('users')
          .doc(userAuthData.uid)
          .get()
          .then((res) {
        print("this is get user data res id ${res.id}");
        final Map<String, dynamic>? result = res.data();
        if(result != null){
          print("this is get user data res id ${json.encode(result)}");
          UserModel userAllData = UserModel.fromJson(json.encode(result) as Map<String, dynamic>);

          print("this is user model name ${userAllData.name}");
        }
      });
    }
  }

  Future signOut() async {
    await FirebaseAuth.instance.signOut();
  }
}
