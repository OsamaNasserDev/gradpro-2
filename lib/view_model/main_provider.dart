import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
  dropDownOnTap(value){
    dropYearGroupValue = value;
    notifyListeners();
  }

  filterInitState(){
    dropYearGroupValue = null;
    notifyListeners();
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








}
