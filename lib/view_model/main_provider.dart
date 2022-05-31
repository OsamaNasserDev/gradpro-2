import 'dart:convert';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gradpro/model/user.dart';
import 'package:image_picker/image_picker.dart';

import '../component/drop_down_numbers.dart';
import '../model/project.dart';
import 'package:http/http.dart' as http;

import '../presentation/resources/routes_manger.dart';

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
  List selectedLanguages = [];
  List selectedTools = [];
  List selectedOthers = [];
  List selectedSkills = [];

  multiSelectLanguages(values) {
    selectedLanguages = values;
    print("this is v type ${selectedLanguages.runtimeType}");
    notifyListeners();
  }

  multiSelectTools(values) {
    selectedTools = values;
    notifyListeners();
  }

  multiSelectOthers(values) {
    selectedOthers = values;
    notifyListeners();
  }

  multiSelectSoftSkills(values) {
    selectedSkills = values;
    notifyListeners();
  }

  /// auth methods
  String? imageUrl;

  Future signUp({
    required String name,
    required String email,
    required String password,
    String? bio,
  }) async {
    /// todo: upload image and get link in imageUrl
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
        'name': name.trim(),
        'bio': bio?.trim(),
        'image': imageUrl??"https://firebasestorage.googleapis.com/v0/b/gradpro-apppump.appspot.com/o/user.png?alt=media&token=3c63b31e-d3ed-4cf2-8942-8d3f29ac6d61",
        'email': res.user!.email,
        'role': 1,
        'projectsIds': null,
        'skills': selectedSkills,
        'others': selectedOthers,
        'tools': selectedTools,
        'languages': selectedLanguages,
        "teamId": null, // get all team from it
      });
    });
  }
  // get profile image
  File? pickedImage;

  pickProfileImage({source = ImageSource.gallery}) async {
    var image = await ImagePicker.platform.pickImage(source: source);
    if (image != null) {
      pickedImage = File(image.path);
      notifyListeners();
      print("Success picked");
    } else {
      // todo //////////////////////////
      //toast
      // print no image selected
    }
  }

  Future signIn(BuildContext context ,{required String email, required String password}) async {
    await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email.trim(), password: password).then((value) => Navigator.pushNamed(
        context, Routes.bottomNavBarRoute));
  }

  final User? userAuthData = FirebaseAuth.instance.currentUser;
  UserModel? userAllData;

  Future getUserData() async {
    final User? userAuthData = FirebaseAuth.instance.currentUser;
    if (userAuthData != null) {
      await FirebaseFirestore.instance
          .collection('users')
          .doc(userAuthData.uid)
          .get()
          .then((res) {
        print("this is get user data res id ${res.id}");
        final Map<String, dynamic>? result = res.data();
        if (result != null) {
          //final extractedData = json.decode(result) as Map<String, dynamic>;

          print("this is get user data res id ${result}");
          userAllData = UserModel.fromJson(result);

          print("this is user model name ${userAllData!.name}");
        }
      });
    }
  }

  Future signOut() async {
    await FirebaseAuth.instance.signOut();
  }

  /// request methods
  sendRequest() async {
    //await signIn(email: "osama@gmail.com", password: "password");
    await getUserData();
    if (userAllData != null) {
      Uri url = Uri.parse(
          "https://gradpro-apppump-default-rtdb.firebaseio.com/team.json");

      await http
          .post(url,
              body: json.encode([
                {
                  'name': userAllData!.name,
                  'id': userAllData!.id,
                  'image': userAllData!.image,
                  'bio': userAllData!.bio,
                  'role': userAllData!.role,
                  'status': 2,
                }
              ]))
          .then((res) async {
        final result1 = json.decode(res.body) as Map<String, dynamic>;

        Uri url = Uri.parse(
            "https://gradpro-apppump-default-rtdb.firebaseio.com/project.json");
        await http
            .post(url,
                body: json.encode({
                  'title': 'title',
                  'description': 'description',
                  'objectives': 'objectives',
                  'others': ['others1', 'others2', 'others3'],
                  'tools': ['tools1', 'tools2', 'tools3'],
                  'languages': ['languages1', 'languages2', 'languages3'],
                  'students': [
                    {'name': userAllData!.name, 'id': userAllData!.id}
                  ],
                  'team_id': result1['name'],
                  'doctor': {'name': 'null', 'id': 'null'},
                  'year': DateTime.now().year.toString(),
                  'progress': {
                    'main_percent': 80,
                    'file_word': 'file word link',
                    'power_point': 'file pdf link',
                    'chapters': [
                      {
                        'percent': 100,
                        'introduction': {
                          "link": "pdf link",
                          "last_update": DateTime.now().toString(),
                          "chat": [
                            {
                              "feedback": "feedback body",
                              "type": 0, // like role
                              'send_at': DateTime.now().toString()
                            },
                          ],
                        },
                        'problem_statement': {
                          "link": "pdf link",
                          "last_update": DateTime.now().toString(),
                          "chat": [
                            {
                              "feedback": "feedback body",
                              "type": 0, // like role
                              'send_at': DateTime.now().toString()
                            },
                          ],
                        },
                        'objectives': {
                          "link": "pdf link",
                          "last_update": DateTime.now().toString(),
                          "chat": [
                            {
                              "feedback": "feedback body",
                              "type": 0, // like role
                              'send_at': DateTime.now().toString()
                            },
                          ],
                        },
                        'users': {
                          "link": "pdf link",
                          "last_update": DateTime.now().toString(),
                          "chat": [
                            {
                              "feedback": "feedback body",
                              "type": 0, // like role
                              'send_at': DateTime.now().toString()
                            },
                          ],
                        },
                        'tools': {
                          "link": "pdf link",
                          "last_update": DateTime.now().toString(),
                          "chat": [
                            {
                              "feedback": "feedback body",
                              "type": 0, // like role
                              'send_at': DateTime.now().toString()
                            },
                          ],
                        },
                        'inputs_outputs': {
                          "link": "pdf link",
                          "last_update": DateTime.now().toString(),
                          "chat": [
                            {
                              "feedback": "feedback body",
                              "type": 0, // like role
                              'send_at': DateTime.now().toString()
                            },
                          ],
                        },
                        'context_diagram': {
                          "link": "pdf link",
                          "last_update": DateTime.now().toString(),
                          "chat": [
                            {
                              "feedback": "feedback body",
                              "type": 0, // like role
                              'send_at': DateTime.now().toString()
                            },
                          ],
                        },
                      },
                      {
                        'percent': 100,
                        'literature_review': {
                          "link": "pdf link",
                          "last_update": DateTime.now().toString(),
                          "chat": [
                            {
                              "feedback": "feedback body",
                              "type": 0, // like role
                              'send_at': DateTime.now().toString()
                            },
                          ],
                        },
                        'analysis': {
                          "link": "pdf link",
                          "last_update": DateTime.now().toString(),
                          "chat": [
                            {
                              "feedback": "feedback body",
                              "type": 0, // like role
                              'send_at': DateTime.now().toString()
                            },
                          ],
                        },
                      },
                      {
                        'percent': 100,
                        'introduction': {
                          "link": "pdf link",
                          "last_update": DateTime.now().toString(),
                          "chat": [
                            {
                              "feedback": "feedback body",
                              "type": 0, // like role
                              'send_at': DateTime.now().toString()
                            },
                          ],
                        },
                        'interface_design': {
                          "link": "pdf link",
                          "last_update": DateTime.now().toString(),
                          "chat": [
                            {
                              "feedback": "feedback body",
                              "type": 0, // like role
                              'send_at': DateTime.now().toString()
                            },
                          ],
                        },
                        'database_design': {
                          "link": "pdf link",
                          "last_update": DateTime.now().toString(),
                          "chat": [
                            {
                              "feedback": "feedback body",
                              "type": 0, // like role
                              'send_at': DateTime.now().toString()
                            },
                          ],
                        },
                      },
                      {
                        'percent': 100,
                        'introduction': {
                          "link": "pdf link",
                          "last_update": DateTime.now().toString(),
                          "chat": [
                            {
                              "feedback": "feedback body",
                              "type": 0, // like role
                              'send_at': DateTime.now().toString()
                            },
                          ],
                        },
                        'implementation': {
                          "link": "pdf link",
                          "last_update": DateTime.now().toString(),
                          "chat": [
                            {
                              "feedback": "feedback body",
                              "type": 0, // like role
                              'send_at': DateTime.now().toString()
                            },
                          ],
                        },
                        'testing': {
                          "link": "pdf link",
                          "last_update": DateTime.now().toString(),
                          "chat": [
                            {
                              "feedback": "feedback body",
                              "type": 0, // like role
                              'send_at': DateTime.now().toString()
                            },
                          ],
                        },
                        'matrix_working_process': {
                          "link": "pdf link",
                          "last_update": DateTime.now().toString(),
                          "chat": [
                            {
                              "feedback": "feedback body",
                              "type": 0 // like role,
                            },
                          ],
                        },
                      },
                      {
                        'percent': 100,
                        'introduction': {
                          "link": "pdf link",
                          "last_update": DateTime.now().toString(),
                          "chat": [
                            {
                              "feedback": "feedback body",
                              "type": 0, // like role
                            },
                          ],
                        },
                        'conclusion': {
                          "link": "pdf link",
                          "last_update": DateTime.now().toString(),
                          "chat": [
                            {
                              "feedback": "feedback body",
                              "type": 0, // like role
                              'send_at': DateTime.now().toString()
                            },
                          ],
                        },
                        'future_work': {
                          "link": "pdf link",
                          "last_update": DateTime.now().toString(),
                          "chat": [
                            {
                              "feedback": "feedback body",
                              "type": 0, // like role
                              'send_at': DateTime.now().toString()
                            },
                          ],
                        },
                      },
                    ]
                  },
                  'type': 1,
                  'status': 0
                }))
            .then((res) async {
          final result2 = json.decode(res.body) as Map<String, dynamic>;
          await FirebaseFirestore.instance
              .collection('users')
              .doc(userAllData!.id)
              .update(
            {
              'role': 2,
              'team_id': result1['name'],
              'projectsIds': [result2['name']],
            },
          );
        });

        print("this is create team res ${result1['name']}");
      });
    }
  }

  List<Project> availableProjects = [];
  List<Project> completedProjects = [];

  List<Project> mobileProjects = [];
  List<Project> desktopProjects = [];
  List<Project> webProjects = [];

  late Project project;

  var text = ' ';

  getAllProjects() async {
    Uri url = Uri.parse(
        "https://gradpro-apppump-default-rtdb.firebaseio.com/project.json");
    await http.get(url).then((res) {
      print("this is th http re ${res.body}");
      final result = json.decode(res.body) as Map<String, dynamic>;

      result.forEach((id, element) {
        if (element["status"] != 0) {
          if (element["type"] == 0) {
            mobileProjects.add(Project.fromJson(element, id));
          } else if (element["type"] == 1) {
            desktopProjects.add(Project.fromJson(element, id));
          } else if (element["type"] == 2) {
            webProjects.add(Project.fromJson(element, id));
          }

          if (element["status"] == 1) {
            availableProjects.add(Project.fromJson(element, id));
          } else if (element["status"] == 2) {
            completedProjects.add(Project.fromJson(element, id));
          }
        }
      });
      notifyListeners();
    });
  }

  List<Project> waitingProjects = [];

  Future getWaitingRequests() async {
    Uri url = Uri.parse(
        "https://gradpro-apppump-default-rtdb.firebaseio.com/project.json");
    await http.get(url).then((res) {
      print("this is th http re ${res.body}");
      final result = json.decode(res.body) as Map<String, dynamic>;

      result.forEach((id, element) {
        if (element["status"] == 0) {
          waitingProjects.add(Project.fromJson(element, id));
        }
      });
      notifyListeners();
    });
  }

  approveProjectRequest(int index) async {
    await getWaitingRequests();
    await getUserData();

    Uri url = Uri.parse(
        "https://gradpro-apppump-default-rtdb.firebaseio.com/project/${waitingProjects[0].id}.json");

    await http
        .patch(url,
            body: json.encode({
              'status': 4,
              'doctor': {'name': userAllData!.name, 'id': userAllData!.id}
            }))
        .then((res) {
      print("this is path status res ${res.body}");
    });
  }

  joinTeam(int index) async {
    Uri url = Uri.parse(
        "https://gradpro-apppump-default-rtdb.firebaseio.com/team/${availableProjects[index].teamId}.json");

    await http.post(url,
        body: json.encode({
          'name': userAllData!.name,
          'id': userAllData!.id,
          'image': userAllData!.image,
          'bio': userAllData!.bio,
          'role': userAllData!.role,
          'status': 0,
        }));
  }
}
