import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:toast/toast.dart';
import'package:intl/intl.dart';

class PatientData {
  final String id;

  final String name;
  final String gender;
  final int age;
  final String adress;
  final int phhoneNum;
  final String bookType;
  final String branch;
  final DateTime appointment;
  final int noOfPatient;
  final int cost;
  final int duration;
  final String problem;

  //bool checkValue;
  //final String mOrF;

  PatientData({
    required this.id,
    required this.name,
    required this.gender,
    required this.age,
    required this.adress,
    required this.phhoneNum,
    required this.bookType,
    required this.branch,
    required this.appointment,
    required this.noOfPatient,
    required this.cost,
    required this.duration,
    required this.problem,
    // required this.checkValue,
    //required this.mOrF,
  });
}

class PatientProvider with ChangeNotifier {
  var radioValue;
  String gender = "";
  late List<PatientData> allData;
  late String selectedBook;
  late String selectedPlace;

  bool passWordVisibility = true;

  var nameController = TextEditingController(),
      addressController = TextEditingController(),
      ageController = TextEditingController(),
      phoneController = TextEditingController(),
      eController = TextEditingController(),
      passController = TextEditingController(),
      patientNumController = TextEditingController(),
      patientProblemController = TextEditingController();

  String name = "";
  String address = "";
  int age = 0;
  int phone = 0;
  String email = "";
  String pass = "";
  bool isLoading = false;
  bool isLoadClient = true;
  bool isLoadArchive = true;
  bool isLoadAvatar = true;
  late double doubleAge;
  late double doublePhone;
  String pProblem = "";

  late DateTime selectedDate;

  List<PatientData> patients = [];
  List<PatientData> archiveItems = [];

  late String authToken;

  //PatientProvider(this.authToken , this.patients ,this.archiveItems);
  getData(String authTok, List<PatientData> clients, List<PatientData> archi) {
    authToken = authTok;
    patients = clients;
    archiveItems = archi;
    notifyListeners();
  }

  void radioButton(val, gen) {
    radioValue = val;
    gender = gen;
    notifyListeners();
  }

  int price = 0;

  int bookDuration = 0;

  void dropBookButton(cur) {
    selectedBook = cur;
    if (cur == 'كشف جديد') {
      price = 100;
      bookDuration = 30;
    } else if (cur == 'إعادة') {
      price = 50;
      bookDuration = 20;
    } else if (cur == 'عمل تقويم') {
      price = 2000;
      bookDuration = 60;
    } else if (cur == 'عمل حشو') {
      price = 450;
      bookDuration = 40;
    }
    notifyListeners();
  }

  void dropPlaceButton(cur) {
    selectedPlace = cur;
    notifyListeners();
  }

  void passVisibile() {
    passWordVisibility = !passWordVisibility;
    notifyListeners();
  }

  Future fetchClients() async{
    final Uri url = Uri.parse(
        'https://doctor-782d8-default-rtdb.firebaseio.com/clients.json');

    return await http.get(url).catchError((error) {
      throw error;
    }).then((res) {
      final extractedClients = json.decode(res.body) as Map<String, dynamic>;
      if (extractedClients != null) {
        extractedClients.forEach((patientId, allData) {
          var isExist = patients.firstWhere(
                  (element) => element.id == patientId);
          if (isExist == null) {
            patients.add(PatientData(
                id: patientId,
                name: allData['name'],
                gender: allData['gender'],
                age: allData['age'],
                adress: allData['adress'],
                phhoneNum: allData['phoneNum'],
                bookType: allData['bookType'],
                branch: allData['branch'],
                appointment: DateTime.parse(allData['appointment']),
                noOfPatient: allData['noOfPatient'],
                cost: allData['cost'],
                duration: allData['duration'],
                problem: allData['problem']
            ));
            notifyListeners();
          }

        });
      }
      isLoadClient = false;
      notifyListeners();
    });
  }

  void dateCategory () {
    // for(int i=0 ; i<patients.length ; i++){}
    //  if(patients[i].appointment == patients[i+1].appointment){}
    patients.sort((a,b){
      return a.appointment.compareTo(b.appointment);
    });
    archiveItems.sort((a,b){
      return a.appointment.compareTo(b.appointment);
    });

    patients.sort((a,b){
      return a.noOfPatient.compareTo(b.noOfPatient);
    });
    archiveItems.sort((a,b){
      return a.noOfPatient.compareTo(b.noOfPatient);
    });

  }

  Future fetchArchive() {
    final Uri url = Uri.parse(
        'https://doctor-782d8-default-rtdb.firebaseio.com/Archive.json');

    return http.get(url).catchError((error) {
      throw error;
    }).then((res) {
      final extractedArchive = json.decode(res.body) as Map<String, dynamic>;
      if (extractedArchive != null) {
        extractedArchive.forEach((patientId, allData) {
          var isExist = archiveItems.firstWhere(
                  (element) => element.id == patientId);
          if (isExist == null) {
            archiveItems.add(PatientData(
                id: patientId,
                name: allData['name'],
                gender: allData['gender'],
                age: allData['age'],
                adress: allData['adress'],
                phhoneNum: allData['phoneNum'],
                bookType: allData['bookType'],
                branch: allData['branch'],
                appointment: DateTime.parse(allData['appointment']),
                noOfPatient: allData['noOfPatient'],
                cost: allData['cost'],
                duration: allData['duration'],
                problem: allData['problem']
            ));
            notifyListeners();
          } else {
            archiveItems.removeWhere((element) => element.id != patientId);
          }
        });
      }
      isLoadArchive = false;
      notifyListeners();
    });
  }

  late int currentNum;
  late int n;

  Future firstPage() async {
    WidgetsFlutterBinding.ensureInitialized();
    final Uri url2 = Uri.parse(
        'https://doctor-782d8-default-rtdb.firebaseio.com/patientNumber.json');
    final res = await http.get(url2);
    n = json.decode(res.body)['patientNum'];
    /////////
    notifyListeners();
    ///////
    final Uri url = Uri.parse(
        'https://doctor-782d8-default-rtdb.firebaseio.com/currentPatientNumber.json');
    await http.get(url).then((res2) {
      currentNum = json.decode(res2.body)['currentPatientNum'] ?? 0;
      isLoadAvatar = false;
      notifyListeners();
    });
  }

  /* Future upDateNumP() async{
    WidgetsFlutterBinding.ensureInitialized();
    final Uri url = Uri.parse(
        'https://doctor-782d8-default-rtdb.firebaseio.com/currentPatientNumber.json');
    await http.get(url).then((res2){
      currentNum = json.decode(res2.body)['currentPatientNum']?? 0;
      isLoadAvatar = false;
      notifyListeners();
    });
    notifyListeners();
  }*/
  void increase(ctx) async {
    final Uri url2 = Uri.parse(
        'https://doctor-782d8-default-rtdb.firebaseio.com/patientNumber.json');
    final res = await http.get(url2);
    n = json.decode(res.body)['patientNum'];

    WidgetsFlutterBinding.ensureInitialized();
    final Uri url = Uri.parse(
        'https://doctor-782d8-default-rtdb.firebaseio.com/currentPatientNumber.json');
    await http.patch(url, body: json.encode({'currentPatientNum': currentNum}));
    if (n <= currentNum) {
      Toast.show("لا يمكن ان يتخطى هذا الرقم عدد العلاء",
          gravity: 1, duration: 3);
    } else {
      currentNum++;
      print(n);
      print(currentNum);
      notifyListeners();
    }
  }

  void decrease(ctx) async {
    if (currentNum <= 0) {
      Toast.show("لا يمكن ان يقل هذا الرقم اكثر من ذلك",
          gravity: 1, duration: 3);
    } else {
      currentNum--;
    }
    WidgetsFlutterBinding.ensureInitialized();
    final Uri url = Uri.parse(
        'https://doctor-782d8-default-rtdb.firebaseio.com/currentPatientNumber.json');
    await http.patch(url, body: json.encode({'currentPatientNum': currentNum}));
    notifyListeners();
  }

  Future<void> _upDateNumPatient(int number) async {
    WidgetsFlutterBinding.ensureInitialized();
    final Uri url = Uri.parse(
        'https://doctor-782d8-default-rtdb.firebaseio.com/patientNumber.json');

    await http.patch(url, body: json.encode({'patientNum': number}));
    notifyListeners();
  }

  Future ensureButton(ctx) async {
    WidgetsFlutterBinding.ensureInitialized();
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    //_prefs.setInt('patientNumber', n);
    String? _id = _prefs.getString("id");
    String? _admin = _prefs.getString("admin");
    if (_id != null && _admin == null) {
      showDialog<Null>(
        context: ctx,
        builder: (innerContext) => AlertDialog(
          title: Text("لديك حجز بالفعل !"),
          content: Text("هل ترغب فى حذف الكشف واضافة كشف اخر جديد ؟"),
          actions: [
            TextButton(
                onPressed: () => Navigator.of(innerContext).pop(),
                child: Text("رجوع")),
            TextButton(
                onPressed: () async {
                  final Uri url = Uri.parse(
                      'https://doctor-782d8-default-rtdb.firebaseio.com/clients/$_id.json');
                  await http.delete(url).then((_) async{
                    final Uri url2 = Uri.parse(
                        'https://doctor-782d8-default-rtdb.firebaseio.com/patientNumber.json');
                    await http.get(url2).then((res2) async{
                      n = json.decode(res2.body)['patientNum'];
                      await http.patch(url2, body: json.encode({'patientNumber': --n}));
                    });
                    _prefs.clear();
                  });
                  notifyListeners();
                  Navigator.of(innerContext).pop();
                  Toast.show("لقد تم حذف الحجز قم بتأكيد الحجز الجديد الان",
                      gravity: 1, duration: 3);
                  notifyListeners();
                },
                child: Text("نعم"))
          ],
        ),
      );
    } else {
      isLoading = true;
      name = nameController.text;
      age = int.parse(ageController.text) ?? 0;
      address = addressController.text;
      phone = int.parse(phoneController.text) ?? 0;
      pProblem = patientProblemController.text;

      notifyListeners();
      final Uri url = Uri.parse(
          'https://doctor-782d8-default-rtdb.firebaseio.com/clients.json');
      final Uri url2 = Uri.parse(
          'https://doctor-782d8-default-rtdb.firebaseio.com/patientNumber.json');
      final res2 = await http.get(url2);
      n = json.decode(res2.body)['patientNum'];
      n++;

      return await http
          .post(url,
          body: json.encode({
            'name': name,
            'gender': gender,
            'age': age,
            'adress': address,
            'phoneNum': phone,
            'bookType': selectedBook,
            'branch': selectedPlace,
            'appointment':selectedDate.toString(),
            'noOfPatient': n,
            'cost': price,
            'duration': bookDuration,
            'problem':pProblem
          }))
          .catchError((e) {
        throw e;
      }).then((res) async {
        SharedPreferences _prefs = await SharedPreferences.getInstance();
        _prefs.setInt('patientNumber', n);
        _prefs.setString("id", "${json.decode(res.body)['name']}");

        patients.add(PatientData(
            id: json.decode(res.body)['name'],
            name: name,
            gender: gender,
            age: age,
            adress: address,
            phhoneNum: phone,
            bookType: selectedBook,
            branch: selectedPlace,
            appointment: selectedDate,
            noOfPatient: n,
            cost: price,
            duration: bookDuration,
            problem: pProblem
        ));
        _upDateNumPatient(n);
        notifyListeners();
        Navigator.of(ctx)
            .pushReplacementNamed('/isEnsured', arguments: {'pNumber': n}).then((_){
          nameController.text  = "";
          addressController.text  = "";
          ageController.text  = "";
          phoneController.text  = "";
          patientProblemController.text = "";
          selectedDate;
          selectedBook;
          selectedPlace;
          radioValue = null;
          gender;
        });
        //isLoading = false;
      });
    }
  }

  void fromTTOF() {
    isLoading = false;
    notifyListeners();
  }

  void date(){
    //DateFormat df = DateFormat.yMd();
    DateTime now = DateTime.now();
    selectedDate = DateTime(now.year,now.month,now.day);
    /*selectedDate = DateTime(now.year,now.month,now.day).add(Duration(days: index));*/

  }


  /*void date(ctx) {
    showDatePicker(
      context: ctx,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2022),
    ).then((value) {
      if (value == null) {
        return;
      }
      selectedDate = value;
    });
    notifyListeners();
  }*/
  Future onDelete(index, ctx) async {
    WidgetsFlutterBinding.ensureInitialized();
    final item = patients[index];
    final Uri url = Uri.parse(
        'https://doctor-782d8-default-rtdb.firebaseio.com/clients/${item.id}.json');
    final patientIndex =
    patients.indexWhere((element) => element.id == item.id);
    patients.removeAt(patientIndex);

    return await http.delete(url).catchError((error) {
      throw error;
    }).then((res) {
      Toast.show("تم حذف العنصر من قائمة العملاء",
          gravity: 1, duration: 2);
      notifyListeners();
    });
  }

  late bool notYet;

  bool isClientFound = false;
  bool isArchiveFound = false;

  Future onArchive(index, ctx) {
    WidgetsFlutterBinding.ensureInitialized();
    final Uri _url = Uri.parse(
        'https://doctor-782d8-default-rtdb.firebaseio.com/Archive.json');

    return http
        .post(_url,
        body: json.encode({
          'name': patients[index].name,
          'gender': patients[index].gender,
          'age': patients[index].age,
          'adress': patients[index].adress,
          'phoneNum': patients[index].phhoneNum,
          'bookType': patients[index].bookType,
          'branch': patients[index].branch,
          'appointment': patients[index].appointment.toString(),
          'noOfPatient': patients[index].noOfPatient,
          'cost': patients[index].cost,
          'duration': patients[index].duration,
          'problem': patients[index].problem
        }))
        .then((value) async {
      SharedPreferences _prefs = await SharedPreferences.getInstance();

      _prefs.setString("id", json.decode(value.body)['name']);
      //archiveItems.add(p);
      //patients.remove(p);
      onDelete(index, ctx);
      notifyListeners();
    });
  }

  Future checkIfDone() async{
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    String? _id = _prefs.getString("id");

    Uri _url = Uri.parse(
        'https://doctor-782d8-default-rtdb.firebaseio.com/clients/$_id.json');
    var _res1 = await http.get(_url);

    Uri _url2 = Uri.parse(
        'https://doctor-782d8-default-rtdb.firebaseio.com/Archive/$_id.json');
    var _res2 = await http.get(_url2);
    var _val1 = json.decode(_res1.body) as Map<String, dynamic>;
    var _val2 = json.decode(_res2.body) as Map<String, dynamic>;
    if (_id == null  ) {
      notYet = true;
      print('is not book yet');
    } else if(_val1 == null && _val2 == null) {
      notYet = false;
      isClientFound = false;
      isArchiveFound = false;

      print('it is deleted');
    }else{
      notYet = false;



      if (_val1 != null) {
        print("is in clients");
        isClientFound = true;
        isArchiveFound = false;
      } else if (_val2 != null) {
        print("is in archive");
        isArchiveFound = true;
        isClientFound = false;

      }
    }
    notifyListeners();
  }

  /* void saveMonthData(BuildContext ctx) async{
*/
/*    final Uri url1 = Uri.parse(
        'https://doctor-782d8-default-rtdb.firebaseio.com/clients.json');
    final res1 = await http.get(url1);
    var val1  = json.decode(res1.body) as Map<String, dynamic>;
    if(val1 != null){
      val1.forEach((key, value) {
          final Uri url11 = Uri.parse(
              'https://doctor-782d8-default-rtdb.firebaseio.com/clients/$key.json');
          http.delete(url11);
      });
    }
    final Uri url3 = Uri.parse(
        'https://doctor-782d8-default-rtdb.firebaseio.com/patientNumber.json');
    await http.patch(url3, body:json.encode({
      'patientNum': 0
    }));
    final Uri url4 = Uri.parse(
        'https://doctor-782d8-default-rtdb.firebaseio.com/currentPatientNumber.json');
    await http.patch(url4, body:json.encode({
      'currentPatientNum': 0
    }));*/

  /*
    final Uri url2 = Uri.parse(
        'htt'
            'ps://doctor-782d8-default-rtdb.firebaseio.com/Archive.json');
    final res2 = await http.get(url2);
    var val2 = json.decode(res2.body) as Map<String, dynamic>;
    if(val2 != null) {
      val2.forEach((key, value) {
          final Uri url22 = Uri.parse(
              'https://doctor-782d8-default-rtdb.firebaseio.com/Archive/$key.json');
          http.delete(url22);
      });
    }
    archiveItems = [];
    notifyListeners();
  }*/
  void storeData(BuildContext ctx) async {
    final Uri url2 = Uri.parse(
        'https://doctor-782d8-default-rtdb.firebaseio.com/Archive.json');
    final res2 = await http.get(url2);
    var val2 = json.decode(res2.body) as Map<String, dynamic>;
    if (val2 != null) {
      Toast.show("جارى التحميل برجاء الانتظار قليلا ...",
          gravity: 1, duration: 3);
      val2.forEach((key, value) {
        final Uri url22 = Uri.parse(
            'https://doctor-782d8-default-rtdb.firebaseio.com/Archive/$key.json');
        FirebaseFirestore.instance.collection('patients').add({
          'name': value['name'],
          'gender': value['gender'],
          'age': value['age'],
          'adress': value['adress'],
          'phoneNum': value['phoneNum'],
          'bookType': value['bookType'],
          'branch': value['branch'],
          'appointment': value['appointment'],
          'cost': value['cost'],
          'duration': value['duration'],
          'problem' : value['problem']
        }).then((_) {
          final patientIndex =
          archiveItems.indexWhere((element) => element.id == key);
          archiveItems.removeAt(patientIndex);
          http.delete(url22).catchError((error) {
            throw error;
          }).then((res) {
            Toast.show("تمت العمليه بنجاح", gravity: 1, duration: 2);
            notifyListeners();
          });
        });
      });
    } else {
      Toast.show("لا يوجد بيانات لتخزينها", gravity: 1, duration: 3);
    }
  }

/*
  void googleSheet(BuildContext ctx) async{
      final String sheetUrl =
          'https://script.google.com/macros/s/AKfycbxSRVBtAuGL8jcjclDR1Qy-2U89uOYsOHQXIA5WSgZ14jboFmGxkXURX0kLp-UwQCqVbA/exec';
      final Uri url2 = Uri.parse(
          'https://doctor-782d8-default-rtdb.firebaseio.com/Archive.json');
      final res2 = await http.get(url2);
      var data = json.decode(res2.body) as Map<String, dynamic>;
      if(data != null) {
        archiveItems.forEach((element) {
          String feedb = "?name=${element.name}&gender=${element.gender}&age=${element.age}&adress=${element.adress}&phoneNum=${element.phhoneNum}&bookType=${element.bookType}&branch=${element.branch}&appointment=${element.appointment}";
          String last1 = sheetUrl+feedb;
          launch(last1);
          notifyListeners();
        });
      }
      notifyListeners();
  }
*/

  var na, ge, ag, ad, ph, bo, br, ap, nop,prob;

  void dashDetails(int index, BuildContext ctx) async {
    var item1 = patients[index];
    var patientIndex1 =
    patients.indexWhere((element) => element.id == item1.id);

    if (patientIndex1 >= 0) {
      na = item1.name;
      ge = item1.gender;
      ag = item1.age;
      ad = item1.adress;
      ph = item1.phhoneNum;
      bo = item1.bookType;
      br = item1.branch;
      ap = item1.appointment;
      nop = item1.noOfPatient;
      prob =item1.problem;
      Navigator.of(ctx).pushNamed('/pDetail');
    }
  }

  void archiveDetails(int index, BuildContext ctx) async {
    var item2 = archiveItems[index];
    var patientIndex2 =
    archiveItems.indexWhere((element) => element.id == item2.id);
    if (patientIndex2 >= 0) {
      na = item2.name;
      ge = item2.gender;
      ag = item2.age;
      ad = item2.adress;
      ph = item2.phhoneNum;
      bo = item2.bookType;
      br = item2.branch;
      ap = item2.appointment;
      nop = item2.noOfPatient;
      prob =item2.problem;
      Navigator.of(ctx).pushNamed('/pDetail');
    }
  }
/*  void excelSheet(List<String> args){
    var file = "/Users/kawal/Desktop/form.xlsx";
    var bytes = File(file).readAsBytesSync();
    var excel = Excel.createExcel();
    // or
    //var excel = Excel.decodeBytes(bytes);
    for (var table in excel.tables.keys) {
      print(table);
      print(excel.tables[table].maxCols);
      print(excel.tables[table].maxRows);
      for (var row in excel.tables[table].rows) {
        print("$row");
      }
    }
    var sheet = excel['mySheet'];
    var cell = sheet.cell(CellIndex.indexByString("A1"));
    cell.value = "Heya How are you I am fine ok goood night";
    var cell2 = sheet.cell(CellIndex.indexByString("E5"));
    cell2.value = "Heya How night";
    /// printing cell-type
    print("CellType: " + cell.cellType.toString());
    /// Iterating and changing values to desired type
    for (int row = 0; row < sheet.maxRows; row++) {
      sheet.row(row).forEach((cell) {
        var val = cell.value; //  Value stored in the particular cell
        cell.value = ' My custom Value ';
      });
    }
    /// appending rows
    List<List<String>> list = List.generate(
        6000, (index) => List.generate(20, (index1) => '$index $index1'));
    //Stopwatch stopwatch = new Stopwatch()..start();
    list.forEach((row) {
      sheet.appendRow(row);
    });
   // print('doSomething() executed in ${stopwatch.elapsed}');
    sheet.appendRow([8]);
    // Saving the file
  }*/
/* Future<void> generateExcel() async {
    //Create a Excel document.
    //Creating a workbook.
    final Workbook workbook = Workbook();
    //Accessing via index
    final Worksheet sheet = workbook.worksheets[0];
    sheet.showGridlines = false;
    // Enable calculation for worksheet.
    sheet.enableSheetCalculations();
    //Set data in the worksheet.
    sheet.getRangeByName('A1').columnWidth = 4.82;
    sheet.getRangeByName('B1:C1').columnWidth = 13.82;
    sheet.getRangeByName('D1').columnWidth = 13.20;
    sheet.getRangeByName('E1').columnWidth = 7.50;
    sheet.getRangeByName('F1').columnWidth = 9.73;
    sheet.getRangeByName('G1').columnWidth = 8.82;
    sheet.getRangeByName('H1').columnWidth = 4.46;
    sheet.getRangeByName('A1:H1').cellStyle.backColor = '#333F4F';
    sheet.getRangeByName('A1:H1').merge();
    sheet.getRangeByName('B4:D6').merge();
    sheet.getRangeByName('B4').setText('Invoice');
    sheet.getRangeByName('B4').cellStyle.fontSize = 32;
    sheet.getRangeByName('B8').setText('BILL TO:');
    sheet.getRangeByName('B8').cellStyle.fontSize = 9;
    sheet.getRangeByName('B8').cellStyle.bold = true;
    sheet.getRangeByName('B9').setText('Abraham Swearegin');
    sheet.getRangeByName('B9').cellStyle.fontSize = 12;
    sheet
        .getRangeByName('B10')
        .setText('United States, California, San Mateo,');
    sheet.getRangeByName('B10').cellStyle.fontSize = 9;
    sheet.getRangeByName('B11').setText('9920 BridgePointe Parkway,');
    sheet.getRangeByName('B11').cellStyle.fontSize = 9;
    sheet.getRangeByName('B12').setNumber(9365550136);
    sheet.getRangeByName('B12').cellStyle.fontSize = 9;
    sheet.getRangeByName('B12').cellStyle.hAlign = HAlignType.left;
    final Range range1 = sheet.getRangeByName('F8:G8');
    final Range range2 = sheet.getRangeByName('F9:G9');
    final Range range3 = sheet.getRangeByName('F10:G10');
    final Range range4 = sheet.getRangeByName('F11:G11');
    final Range range5 = sheet.getRangeByName('F12:G12');
    range1.merge();
    range2.merge();
    range3.merge();
    range4.merge();
    range5.merge();
    sheet.getRangeByName('F8').setText('INVOICE#');
    range1.cellStyle.fontSize = 8;
    range1.cellStyle.bold = true;
    range1.cellStyle.hAlign = HAlignType.right;
    sheet.getRangeByName('F9').setNumber(2058557939);
    range2.cellStyle.fontSize = 9;
    range2.cellStyle.hAlign = HAlignType.right;
    sheet.getRangeByName('F10').setText('DATE');
    range3.cellStyle.fontSize = 8;
    range3.cellStyle.bold = true;
    range3.cellStyle.hAlign = HAlignType.right;
    sheet.getRangeByName('F11').dateTime = DateTime(2020, 08, 31);
    sheet.getRangeByName('F11').numberFormat =
    '[\$-x-sysdate]dddd, mmmm dd, yyyy';
    range4.cellStyle.fontSize = 9;
    range4.cellStyle.hAlign = HAlignType.right;
    range5.cellStyle.fontSize = 8;
    range5.cellStyle.bold = true;
    range5.cellStyle.hAlign = HAlignType.right;
    final Range range6 = sheet.getRangeByName('B15:G15');
    range6.cellStyle.fontSize = 10;
    range6.cellStyle.bold = true;
    sheet.getRangeByIndex(15, 2).setText('Code');
    sheet.getRangeByIndex(16, 2).setText('CA-1098');
    sheet.getRangeByIndex(17, 2).setText('LJ-0192');
    sheet.getRangeByIndex(18, 2).setText('So-B909-M');
    sheet.getRangeByIndex(19, 2).setText('FK-5136');
    sheet.getRangeByIndex(20, 2).setText('HL-U509');
    sheet.getRangeByIndex(15, 3).setText('Description');
    sheet.getRangeByIndex(16, 3).setText('AWC Logo Cap');
    sheet.getRangeByIndex(17, 3).setText('Long-Sleeve Logo Jersey, M');
    sheet.getRangeByIndex(18, 3).setText('Mountain Bike Socks, M');
    sheet.getRangeByIndex(19, 3).setText('ML Fork');
    sheet.getRangeByIndex(20, 3).setText('Sports-100 Helmet, Black');
    sheet.getRangeByIndex(15, 3, 15, 4).merge();
    sheet.getRangeByIndex(16, 3, 16, 4).merge();
    sheet.getRangeByIndex(17, 3, 17, 4).merge();
    sheet.getRangeByIndex(18, 3, 18, 4).merge();
    sheet.getRangeByIndex(19, 3, 19, 4).merge();
    sheet.getRangeByIndex(20, 3, 20, 4).merge();
    sheet.getRangeByIndex(15, 5).setText('Quantity');
    sheet.getRangeByIndex(16, 5).setNumber(2);
    sheet.getRangeByIndex(17, 5).setNumber(3);
    sheet.getRangeByIndex(18, 5).setNumber(2);
    sheet.getRangeByIndex(19, 5).setNumber(6);
    sheet.getRangeByIndex(20, 5).setNumber(1);
    sheet.getRangeByIndex(15, 6).setText('Price');
    sheet.getRangeByIndex(16, 6).setNumber(8.99);
    sheet.getRangeByIndex(17, 6).setNumber(49.99);
    sheet.getRangeByIndex(18, 6).setNumber(9.50);
    sheet.getRangeByIndex(19, 6).setNumber(175.49);
    sheet.getRangeByIndex(20, 6).setNumber(34.99);
    sheet.getRangeByIndex(15, 7).setText('Total');
    sheet.getRangeByIndex(16, 7).setFormula('=E16*F16+(E16*F16)');
    sheet.getRangeByIndex(17, 7).setFormula('=E17*F17+(E17*F17)');
    sheet.getRangeByIndex(18, 7).setFormula('=E18*F18+(E18*F18)');
    sheet.getRangeByIndex(19, 7).setFormula('=E19*F19+(E19*F19)');
    sheet.getRangeByIndex(20, 7).setFormula('=E20*F20+(E20*F20)');
    sheet.getRangeByIndex(15, 6, 20, 7).numberFormat = '\$#,##0.00';
    sheet.getRangeByName('E15:G15').cellStyle.hAlign = HAlignType.right;
    sheet.getRangeByName('B15:G15').cellStyle.fontSize = 10;
    sheet.getRangeByName('B15:G15').cellStyle.bold = true;
    sheet.getRangeByName('B16:G20').cellStyle.fontSize = 9;
    sheet.getRangeByName('E22:G22').merge();
    sheet.getRangeByName('E22:G22').cellStyle.hAlign = HAlignType.right;
    sheet.getRangeByName('E23:G24').merge();
    final Range range7 = sheet.getRangeByName('E22');
    final Range range8 = sheet.getRangeByName('E23');
    range7.setText('TOTAL');
    range7.cellStyle.fontSize = 8;
    range8.setFormula('=SUM(G16:G20)');
    range8.numberFormat = '\$#,##0.00';
    range8.cellStyle.fontSize = 24;
    range8.cellStyle.hAlign = HAlignType.right;
    range8.cellStyle.bold = true;
    sheet.getRangeByIndex(26, 1).text =
    '800 Interchange Blvd, Suite 2501, Austin, TX 78721 | support@adventure-works.com';
    //sheet.getRangeByIndex(26, 1).cellStyle.fontSize = 8;
    final Range range9 = sheet.getRangeByName('A26:H27');
    range9.cellStyle.backColor = '#ACB9CA';
    range9.merge();
    range9.cellStyle.hAlign = HAlignType.center;
    range9.cellStyle.vAlign = VAlignType.center;
    //Save and launch the excel.
    final List<int> bytes = workbook.saveAsStream();
    //Dispose the document.
   // workbook.dispose();
    //Save and launch the file.
  }*/
}

/*
 var existIndex =
    archiveItems.indexWhere((element) => element.noOfPatient == index);
    if (!(existIndex != null)) {
      archiveItems
          .add(patients.firstWhere((element) => element.noOfPatient == index));
      archiveItems.add(index);
      patients.removeAt(existIndex);
      patients.remove(index);
    }
    ScaffoldMessenger.of(ctx).showSnackBar(
      SnackBar(
        content: Text(
          "تم اضافة العنصر الى الارشيف بنجاح",
          textDirection: TextDirection.rtl,
        ),
        action: SnackBarAction(
          label: "ارجاع العنصر",
          onPressed: () {
            patients
                .add(patients.firstWhere((element) => element.noOfPatient == index));
            patients.add(index);
            archiveItems.removeAt(existIndex);
            archiveItems.remove(index);
            notifyListeners();
          },
        ),
      ),
    );*/

/*final item = patients[index];
    patients.removeAt(index);
    ScaffoldMessenger.of(ctx).showSnackBar(
      SnackBar(
        content: Text(
          "تم حذف العنصر بنجاح",
          textDirection: TextDirection.rtl,
        ),
        action: SnackBarAction(
          label: "ارجاع العنصر",
          onPressed: () {
            patients.insert(index, item);
            notifyListeners();
          },
        ),
      ),
    );*/

/*final item = patients[index];
    patients.removeAt(index);
    ScaffoldMessenger.of(ctx).showSnackBar(
      SnackBar(
          content: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
        textDirection: TextDirection.rtl,
        children: [
          Text(
            "تم حذف العنصر بنجاح",
            textDirection: TextDirection.rtl,
          ),
          TextButton(
            child: Text("ارجاع العنصر",style: TextStyle(color: Colors.blue),),
            onPressed: (){
              patients.insert(index, item);
              notifyListeners();
            },
          )
        ],
      )),
    );*/

/* ScaffoldMessenger.of(ctx).showSnackBar(
          SnackBar(
            content: Text(
              "تم حذف العنصر بنجاح",
              textDirection: TextDirection.rtl,
            ),
            action: SnackBarAction(
              label: "ارجاع العنصر",
              onPressed: () async{
                patients.insert(index, item);
                url = Uri.parse(
                    'https://doctor-782d8-default-rtdb.firebaseio.com/clients.json');
                res = await http.post(url,body: json.encode({
                    'name': patientItem.name,
                    'gender': patientItem.gender,
                    'age': patientItem.age,
                    'adress': patientItem.adress,
                    'phhoneNum': patientItem.phhoneNum,
                    'bookType': patientItem.bookType,
                    'branch': patientItem.branch,
                    'appointment':
                    "${patientItem.appointment}",
                    'noOfPatient': patientItem.noOfPatient,
                  })
                );
                if(res.statusCode >= 400){
                  patients.removeAt(patientIndex);
                  notifyListeners();
                  print("could not add");
                }else{
                  //patientItem = null;
                  print("item add76ed");
                }
                notifyListeners();
              },
            ),
          ),*/

/*ScaffoldMessenger.of(ctx).showSnackBar(SnackBar(
        duration: Duration(seconds: 2),
        content: Text(
          "تم اضافة العنصر الى الارشيف بنجاح",
          textDirection: TextDirection.rtl,
        ),
        action: SnackBarAction(
          label: "ارجاع العنصر",
          onPressed: () {
            archiveItems.remove(p);
            patients.add(p);
            notifyListeners();
          },
        ),
      ));*/