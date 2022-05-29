// import 'dart:convert';
// import 'dart:io';
//
// import 'package:device_info_plus/device_info_plus.dart';
// import 'package:file_picker/file_picker.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_messaging/firebase_messaging.dart';
//
// //import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter/widgets.dart';
// import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
// import 'package:flutter_rating_bar/flutter_rating_bar.dart';
//
// //import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
// import 'package:get_storage/get_storage.dart';
// import 'package:google_sign_in/google_sign_in.dart';
//
// //import 'package:google_sign_in/google_sign_in.dart';
// import 'package:http/http.dart' as http;
// import 'package:image_cropper/image_cropper.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:internet_connection_checker/internet_connection_checker.dart';
// import 'package:overlay_support/overlay_support.dart';
// import 'package:package_info_plus/package_info_plus.dart';
// import 'package:restart_app/restart_app.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:tutors/model/age_group.dart';
// import 'package:tutors/model/city.dart';
// import 'package:tutors/model/comment_reply.dart';
// import 'package:tutors/model/country.dart';
// import 'package:tutors/model/currency.dart';
// import 'package:tutors/model/learner.dart';
// import 'package:tutors/model/message.dart';
// import 'package:tutors/model/rating.dart';
// import 'package:tutors/model/skill.dart';
// import 'package:tutors/model/tutor_plan.dart';
// import 'package:tutors/model/user_notification.dart';
// import 'package:tutors/model/plan.dart';
// import 'package:tutors/model/tutor.dart';
// import 'package:tutors/model/conversation.dart';
// import 'package:tutors/service/dio_helper.dart';
// import 'package:tutors/service/size_config.dart';
// import 'package:tutors/service/themes.dart';
// import 'package:tutors/view/home_screen.dart';
// import 'package:tutors/view/no_internet_connection_screen.dart';
// import 'package:tutors/view/not_found_screen.dart';
// import 'package:tutors/widget/elevated_button.dart';
// import 'package:tutors/widget/input_field.dart';
// import 'package:video_player/video_player.dart';
//
// import 'package:web_socket_channel/io.dart';
// import 'package:web_socket_channel/status.dart' as status;
//
// import 'package:flutter_gen/gen_l10n/app_localizations.dart';
// import 'package:flutter_localizations/flutter_localizations.dart';
// import 'package:google_sign_in/google_sign_in.dart';
//
// import '../view/conversation_room_screen.dart';
//
// class AuthProvider with ChangeNotifier {
//
//   int navIndex = 0;
//   whichNavIndex (int index){
//     navIndex = index;
//     notifyListeners();
//   }
//
//
//
//   final GetStorage _lanBox = GetStorage();
//   final String _lankey = 'en';
//   Locale? languageGroupValue;
//   //final String _lastMassagesKey = 'lastMassagesKey';
//   //final String _notificationNumKey = 'notificationNumKey';
//   //final String _lastMassagesNumKey = "lastMassagesNumKey";
//
//   _saveLanguageToBox(bool isEnglish) => _lanBox.write(_lankey, isEnglish);
//
//   bool _loadLanguageFromBox() => _lanBox.read(_lankey) ?? false;
//
//   Locale get language =>
//       _loadLanguageFromBox() ? const Locale('ar') : const Locale('en');
//
//   String get languageText => _loadLanguageFromBox() ? "ar" : "en";
//
//   void selectLanguage(newValue, context) {
//     languageGroupValue = newValue;
//     if (languageGroupValue == const Locale('ar')) {
//       _saveLanguageToBox(true);
//     } else {
//       _saveLanguageToBox(false);
//     }
//     //notifyListeners();
//     Future.delayed(const Duration(milliseconds: 300),()=>Restart.restartApp());
//   }
//
//   final GetStorage _box = GetStorage();
//
//   //final String _key2 = 'isFirst';
//   final String _keyRole = 'role';
//   final String _keyRememberBool = 'bool';
//   final String _keyEmail = 'email';
//   final String _keyRememberPassWord = 'password';
//   final String _tokenKey = "token";
//   final String _userIdKey = "user_id";
//   final String _keyEmailVerified = 'email_verified';
//
//   saveEmailVerified(bool saveEmailVerified) =>
//       _box.write(_keyEmailVerified, saveEmailVerified);
//
//   bool get loadEmailVerifiedFromBox => _box.read(_keyEmailVerified) ?? false;
//
//   //saveFirstTime(bool isFirstTime) => _box.write(_key2, isFirstTime);
//   // bool get loadIsFirstFromBox => _box.read(_key2)?? true;
//
//   ///
//   /// save user Id
//   saveUserId(int userId) => _box.write(_userIdKey, userId);
//
//   int get loadUserIdBox => _box.read(_userIdKey) ?? 0;
//
//   /// save user Role
//   saveRole(String role) => _box.write(_keyRole, role);
//
//   String get loadRoleFromBox => _box.read(_keyRole) ?? '';
//
//
//
//
// ///////////////////////////////////////////////////////////////////////////////////////////////////////
// //   /// save chat unread num
// //   saveChatUnreadNum(int num) => _box.write(_lastMassagesNumKey, num);
// //
// //   int get loadChatUnreadNumBox => _box.read(_lastMassagesNumKey) ?? 0;
// //
//
//   // /// save notification unread num
//   // saveNotificationUnreadNum(int num) => _box.write(_notificationNumKey, num);
//   //
//   // int get loadNotificationUnreadNumBox => _box.read(_notificationNumKey) ?? 0;
//   //
//   //
//
// /*
//
//   final String _notificationNumKey = 'notificationNumKey';
//   final String _notificationIdsKey = 'notificationIdsKey';
//
//
//   saveNotificationUnreadNum(int num) => _box.write(_notificationNumKey, num);
//   int get loadNotificationUnreadNumBox => _box.read(_notificationNumKey) ?? 0;
//
//   saveNotificationUnreadIds(List<int> ids) => _box.write(_notificationIdsKey, ids);
//   List<int> get loadNotificationUnreadIdsBox => _box.read(_notificationIdsKey) ?? <int>[];
//
//
//   notificationCountFunction({required String isOnMessage}*/
//
// /*{required Map<String, dynamic> totalResult}*//*
// ) {
//     /// save notification unread num
//     int i = loadNotificationUnreadNumBox;
//     i++;
//     saveNotificationUnreadNum(i);
//     print("loadNotificationUnreadNumBox() from provider ${loadNotificationUnreadNumBox}");
//     if(isOnMessage == "yes"){
//       notifyListeners();
//     }
//     //
//     // print("int.parse(totalResult['conversation_id'].toString()) ${int.parse(totalResult['notification_id'].toString())}");
//     // var notificationDetails = json.decode(totalResult["0"]) as Map<String, dynamic>;
//     // List allIds = loadNotificationUnreadIdsBox;
//     // allIds.add(int.parse(totalResult['conversation_id'].toString()));
//     // saveChatUnreadMessagesIds(allIds);
//     // print("loadNotificationUnreadIdsBox() ${loadNotificationUnreadIdsBox}");
//   }
//
//   clearNotificationUnreadNumBox(){
//     _box.remove(_notificationNumKey);
//     print("clearChatUnreadNumBox loadChatUnreadNumBox: ${loadChatUnreadNumBox}");
//   }
//
//
//
//   final String _lastMassagesNumKey = "lastMassagesNumKey";
//   final String _lastMessagesIdsKey = 'lastMessagesIdsKey';
//
//   saveChatUnreadNum(int num) => _box.write(_lastMassagesNumKey, num);
//   int get loadChatUnreadNumBox => _box.read(_lastMassagesNumKey) ?? 0;
//
//   saveChatUnreadMessagesIds(List ids) => _box.write(_lastMessagesIdsKey, ids);
//   List get loadChatUnreadMessagesIdsBox => _box.read(_lastMessagesIdsKey) ?? [];
//
//   chatCountFunction({required Map<String, dynamic> totalResult*/
// /*,required String isOnMessage*//*
// }) {
//     /// save chat unread num
//     int i = loadChatUnreadNumBox;
//     i++;
//     saveChatUnreadNum(i);
//     print("loadChatUnreadNumBox() ${loadChatUnreadNumBox}");
//
//     /// save chat unread id
//     //if(totalResult != null){}
//       print("int.parse(totalResult['conversation_id'].toString()) ${int.parse(totalResult['conversation_id'].toString())}");
//       var messageDetails = json.decode(totalResult["0"]) as Map<String, dynamic>;
//       List allIds = loadChatUnreadMessagesIdsBox;
//       allIds.add(int.parse(totalResult['conversation_id'].toString()));
//       saveChatUnreadMessagesIds(allIds);
//       print("loadChatUnreadMessagesIdsBox() ${loadChatUnreadMessagesIdsBox}");
//
//     // if(isOnMessage == "yes"){
//     //   notifyListeners();
//     // }
//
//   }
//
//   clearChatUnreadNumBox(){
//     _box.remove(_lastMassagesNumKey);
//     print("clearChatUnreadNumBox loadChatUnreadNumBox: ${loadChatUnreadNumBox}");
//   }
//   clearChatUnreadIdBox(){
//     List allIds = loadChatUnreadMessagesIdsBox;
//     if(allIds.contains(userConversations[conversationIndex!].id)){
//       for (int i = 0; i < allIds.length; i++) {
//         if(allIds[i].toString() == userConversations[conversationIndex!].id.toString()){
//           allIds.remove(allIds[i]);
//         }
//       }
//       saveChatUnreadMessagesIds(allIds);
//     }
//
//     //_box.remove(_lastMessagesIdsKey);
//
//     print("clearChatUnreadIdBox loadChatUnreadMessagesIdsBox: ${loadChatUnreadMessagesIdsBox}");
//   }
// */
//
//
// //   /// save last conversation message
// //   saveLastMassages(List<Map<String,String>> lastMassages) => _box.write(_lastMassagesKey, lastMassages);
// //
// //   List<Map<String,String>> get loadLastMassagesFromBox => _box.read(_lastMassagesKey) ?? [];
// //
// //
// //
// //   /// save notification number
// //   saveNotificationNum(int notificationNum) => _box.write(_notificationNumKey, notificationNum);
// //
// //   int get loadNotificationNumFromBox => _box.read(_notificationNumKey) ?? 0;
//
//   ///////////////////////////////////////////////////////////////////////////////////////////////////////
//
//
//
//
//   /// remember me
//   saveRememberMeBool(bool rememberBool) =>
//       _box.write(_keyRememberBool, rememberBool);
//
//   saveRememberMePassword(String savePassword) =>
//       _box.write(_keyRememberPassWord, savePassword);
//
//   bool get loadRememberMeBoolFromBox => _box.read(_keyRememberBool) ?? true;
//
//   saveEmail(String saveEmail) => _box.write(_keyEmail, saveEmail);
//
//   String get loadEmailFromBox => _box.read(_keyEmail);
//
//   String get loadRememberMePasswordFromBox =>
//       _box.read(_keyRememberPassWord) ?? '';
//
//   bool hasInternet = true;
//   bool internetFirstTime = true;
//
//
//   Future backButton({required BuildContext context}) async{
//     DefaultTabController.of(context)!.animateTo(0);
//     return true;
//   }
//
//   onConnectionChange(String whichFunction, BuildContext context) async {
//     InternetConnectionChecker().onStatusChange.listen((status) {
//       final hasConnected = status == InternetConnectionStatus.connected;
//       hasInternet = hasConnected;
//       if (hasConnected == true && whichFunction == 'home') {
//         internetFirstTime = false;
//         try {
//           conversationError = false;
//           homeError == false;
//           profileError == false;
//           notificationError == false;
//           conversationError == false;
//           Navigator.of(context)
//               .pushNamedAndRemoveUntil('/home', (route) => false);
//         } catch (e) {
//           debugPrint("home page error: $e");
//         }
//
//         // profileInternet = true ;
//         // profileError = false ;
//         // notificationInternet = true;
//         // notificationError = false;
//
//         // switch (whichFunction) {
//         //   case 'home':
//         //     break;
//         //   case 'profile':
//         //
//         //     break;
//         //   default:
//         //     print('no Function');
//         //     break;
//         // }
//       } else if (hasConnected == false &&
//           whichFunction == 'home' &&
//           internetFirstTime == true) {
//         showSimpleNotification(
//             Text(
//               AppLocalizations.of(context)!.internet_connection_has_been_lost,
//               style: Themes.bold15(color: Colors.black),
//               overflow: TextOverflow.ellipsis,
//             ),
//             elevation: 0,
//             background: yellow,
//             //slideDismissDirection: DismissDirection.horizontal,
//             duration: const Duration(seconds: 5));
//       }
//     });
//   }
//
//   /// save user token
//   saveUserToken(String token) => _box.write(_tokenKey, token);
//
//   String get loadUserTokenFromBox => _box.read(_tokenKey) ?? '';
//
//   Future logout(BuildContext context) async {
//     if (hasInternet == true) {
//       try {
//         Uri logoutApi = Uri.parse("${baseApi}api/v1/logout");
//         await http.post(logoutApi, headers: {
//           "Authorization": "Bearer $loadUserTokenFromBox",
//           "lang": languageText,
//         }).then((value) async {
//           saveUserToken('');
//           saveRole('');
//           saveRememberMeBool(false);
//           saveEmail('');
//           saveRememberMePassword('');
//           Restart.restartApp();
//           await FirebaseAuth.instance.signOut();
//           final googleSignIn = GoogleSignIn(scopes: ["email"]);
//           await googleSignIn.signOut();
//           //Navigator.of(context).pushReplacementNamed("/sign");
//         });
//       } catch (error) {
//         showDialogBox(
//             text: AppLocalizations.of(context)!.ok,
//             message: AppLocalizations.of(context)!.some_thing_went_wrong,
//             context: context);
//       }
//     } else {
//       snackBarForNoInternet(context);
//     }
//   }
//
//   bool deleteAccountLoading = false;
//   Future deleteMyAccount(BuildContext context) async {
//     if (hasInternet == true) {
//       try {
//         print("this before method delete");
//         deleteAccountLoading = true;
//         notifyListeners();
//         Uri deleteAccountApi = Uri.parse("${baseApi}api/v1/delete-user");
//         print("this is the user token from d ${loadUserTokenFromBox}");
//         await http.delete(deleteAccountApi, headers: {
//           "Authorization": "Bearer $loadUserTokenFromBox",
//           "lang": languageText,
//         }).then((res) async {
//           print("this is the response of delete account ${res.body}");
//           saveUserToken('');
//           saveRole('');
//           saveRememberMeBool(false);
//           saveEmail('');
//           saveRememberMePassword('');
//           deleteAccountLoading = false;
//           notifyListeners();
//           Restart.restartApp();
//           await FirebaseAuth.instance.signOut();
//           final googleSignIn = GoogleSignIn(scopes: ["email"]);
//           await googleSignIn.signOut();
//
//         });
//       } catch (error) {
//         deleteAccountLoading = false;
//         notifyListeners();
//         showDialogBox(
//             text: AppLocalizations.of(context)!.ok,
//             message: AppLocalizations.of(context)!.some_thing_went_wrong,
//             context: context);
//       }
//     } else {
//       snackBarForNoInternet(context);
//     }
//   }
//
//   void dropdownTutorOrLearner(newValue, context) {
//     selectedRole = newValue;
//     Navigator.of(context)
//         .pushNamed('/sign' /*, arguments: {'selectedRole':selectedRole}*/);
//     //saveRole(selectedRole);
//     notifyListeners();
//   }
//
//   String baseApi = "https://tutor-s.com/y99rnEvOKXPxM9E1Zscd/";
//
//   //String baseApiWithoutKey ="https://tutor-s.com/";
//   //String baseApiForImagesAndVideos = "https://tutor-s.com/";
//   String authMode = 'Login';
//
//   bool isLoading = false;
//
//   String? name, email, password, newPassword, emailToBeVerified, mobile;
//
//   //TextEditingController nameController = TextEditingController(), emailController = TextEditingController(), passwordController = TextEditingController();
//   onSaved(String value, String type) {
//     if (type == 'name') {
//       name = value.trim();
//     } else if (type == 'email') {
//       email = value.trim();
//     } else if (type == 'password') {
//       password = value;
//     } else if (type == "emailToBeVerified") {
//       emailToBeVerified = value.trim();
//     } else if (type == "New Password") {
//       newPassword = value;
//     } else if(type == "mobile"){
//       mobile = value.trim();
//     }
//     notifyListeners();
//   }
//
//   String? editedName, editedAbout, editedPassword, editedHourly, editedHeadline;
//
//   onEditSaved(String value, String type) {
//     if (type == 'name') {
//       editedName = value.trim();
//       notifyListeners();
//     } else if (type == 'about') {
//       editedAbout = value.trim();
//       notifyListeners();
//     } else if (type == 'password') {
//       editedPassword = value;
//       notifyListeners();
//     } else if (type == "hourly") {
//       editedHourly = value;
//       notifyListeners();
//     } else if (type == 'headline') {
//       editedHeadline = value;
//       notifyListeners();
//     }
//   }
//
//   /* Future uploadImageAndGetURL(BuildContext context) async {
//     Uri uploadImageApi = Uri.parse("${baseApi}api/v1/upload-image");
//     if (hasInternet == true) {
//       http.MultipartRequest request =
//           http.MultipartRequest("POST", uploadImageApi);
//       request.fields['directory'] = 'profile_image';
//       http.MultipartFile multipartFile =
//           await http.MultipartFile.fromPath('image', pickedProfileImage!.path);
//       request.files.add(multipartFile);
//       //request.headers['Authorization'] = "bearer $loadUserTokenFromBox";
//       http.StreamedResponse response = await request.send();
//       response.stream.transform(utf8.decoder).listen((res) {
//         final result = json.decode(res) as Map<String, dynamic>;
//         pickedProfileImageUrl = result['data']['image_url'];
//         if (result['is_authorized'] == true) {
//           if (result['status'] == true) {
//             pickedProfileImageUrl = result['data']['image_url'];
//             print(
//                 "pickedProfileImageUrl from uploadImageAndGetURL $pickedProfileImageUrl");
//           }
//         }
//       });
//     } else {
//       snackBarForNoInternet(context);
//     }
//   }
//
//   Future uploadVideoAndGetURL(BuildContext context) async {
//     Uri uploadVideoApi = Uri.parse("${baseApi}api/v1/upload-video");
//     if (hasInternet == true) {
//       http.MultipartRequest request =
//           http.MultipartRequest("POST", uploadVideoApi);
//       request.fields['directory'] = 'profile_video';
//       http.MultipartFile multipartFile =
//           await http.MultipartFile.fromPath('video', pickedProfileVideo!.path);
//       request.files.add(multipartFile);
//       //request.headers['Authorization'] = "bearer $loadUserTokenFromBox";
//       await request.send().then((response) {
//         response.stream.transform(utf8.decoder).listen((res) {
//           debugPrint("This is video response $res");
//           final result = json.decode(res) as Map<String, dynamic>;
//           if (result['is_authorized'] == true) {
//             if (result['status'] == true) {
//               //pickedProfileVideoUrl = result['data']['video_url']; that is right
//               pickedProfileVideoUrl = result['data']['video_url'];
//               debugPrint("This is video response $pickedProfileVideoUrl");
//             }
//           }
//         });
//       });
//     } else {
//       snackBarForNoInternet(context);
//     }
//   }
// */
//
//   /// Radio for learner and tutor
//   String selectedRole = 'tutor';
//
//   radioButtonTutorOrLearner(newValue) {
//     selectedRole = newValue;
//     print("selectedRole : $selectedRole");
//     notifyListeners();
//   }
//
//   deletingPickedVideo() {
//     pickedProfileVideo = null;
//     pickedProfileVideoUrl = null;
//     notifyListeners();
//   }
//
//   deletingPickedImage() {
//     pickedProfileImage = null;
//     pickedProfileImageUrl = null;
//     notifyListeners();
//   }
//
//   double sliderValue = 5.0;
//
//   onSliderValueChanged(val) {
//     sliderValue = val;
//     notifyListeners();
//   }
//
//   bool editingLoading = false;
//
//   editProfileData(BuildContext context) async {
//     if (hasInternet == true) {
//       try {
//         editingLoading = true;
//         notifyListeners();
//         Uri uploadImageApi = Uri.parse("${baseApi}api/v1/upload-image");
//         Uri uploadVideoApi = Uri.parse("${baseApi}api/v1/upload-video");
//
//         if (pickedProfileImage != null && pickedProfileVideo != null) {
//           http.MultipartRequest request =
//               http.MultipartRequest("POST", uploadImageApi);
//           request.fields['directory'] = 'profile_image';
//           http.MultipartFile multipartFile = await http.MultipartFile.fromPath(
//               'image', pickedProfileImage!.path);
//           request.files.add(multipartFile);
//           request.headers['lang'] = languageText;
//           http.StreamedResponse response = await request.send();
//           response.stream.transform(utf8.decoder).listen((res) async {
//             final result = json.decode(res) as Map<String, dynamic>;
//             pickedProfileImageUrl = result['data']['image_url'];
//             if (result['is_authorized'] == true) {
//               if (result['status'] == true) {
//                 pickedProfileImageUrl = result['data']['image_url'];
//
//                 http.MultipartRequest request =
//                     http.MultipartRequest("POST", uploadVideoApi);
//                 request.fields['directory'] = 'profile_video';
//                 http.MultipartFile multipartFile =
//                     await http.MultipartFile.fromPath(
//                         'video', pickedProfileVideo!.path);
//                 request.files.add(multipartFile);
//                 request.headers['lang'] = languageText;
//                 //request.headers['Authorization'] = "bearer $loadUserTokenFromBox";
//                 await request.send().then((response) {
//                   response.stream.transform(utf8.decoder).listen((res) async {
//                     debugPrint("This is video response $res");
//                     final result = json.decode(res) as Map<String, dynamic>;
//                     if (result['is_authorized'] == true) {
//                       if (result['status'] == true) {
//                         //pickedProfileVideoUrl = result['data']['video_url']; that is right
//                         pickedProfileVideoUrl = result['data']['video_url'];
//                         debugPrint(
//                             "This is video response $pickedProfileVideoUrl");
//                         await updateProfile(context);
//                       }
//                     }
//                   });
//                 });
//               }
//             }
//           });
//         } else if (pickedProfileImage != null && pickedProfileVideo == null) {
//
//           http.MultipartRequest request =
//               http.MultipartRequest("POST", uploadImageApi);
//           request.fields['directory'] = 'profile_image';
//           http.MultipartFile multipartFile = await http.MultipartFile.fromPath(
//               'image', pickedProfileImage!.path);
//           request.files.add(multipartFile);
//           request.headers['lang'] = languageText;
//           //request.headers['Authorization'] = "bearer $loadUserTokenFromBox";
//           http.StreamedResponse response = await request.send();
//           response.stream.transform(utf8.decoder).listen((res) async {
//             final result = json.decode(res) as Map<String, dynamic>;
//             pickedProfileImageUrl = result['data']['image_url'];
//             if (result['is_authorized'] == true) {
//               if (result['status'] == true) {
//                 pickedProfileImageUrl = result['data']['image_url'];
//                 await updateProfile(context);
//               }
//             }
//           });
//         } else if (pickedProfileImage == null && pickedProfileVideo != null) {
//           print("i am in pickedProfileImage == null && pickedProfileVideo != null");
//           http.MultipartRequest request =
//               http.MultipartRequest("POST", uploadVideoApi);
//           request.fields['directory'] = 'profile_video';
//           http.MultipartFile multipartFile = await http.MultipartFile.fromPath(
//               'video', pickedProfileVideo!.path);
//           request.files.add(multipartFile);
//           request.headers['lang'] = languageText;
//           //request.headers['Authorization'] = "bearer $loadUserTokenFromBox";
//           await request.send().then((response) {
//             response.stream.transform(utf8.decoder).listen((res) async {
//               debugPrint("This is video response $res");
//               final result = json.decode(res) as Map<String, dynamic>;
//               if (result['is_authorized'] == true) {
//                 if (result['status'] == true) {
//                   //pickedProfileVideoUrl = result['data']['video_url']; that is right
//                   pickedProfileVideoUrl = result['data']['video_url'];
//                   debugPrint("This is video response $pickedProfileVideoUrl");
//
//                   await updateProfile(context);
//                 }
//               }
//             });
//           });
//         } else if (pickedProfileImage == null && pickedProfileVideo == null) {
//           await updateProfile(context);
//         }
//
//         editingLoading = false;
//         } catch (error) {
//         print("editingLoading $error");
//         editingLoading = false;
//         await getCurrentUserData(true, context);
//         Navigator.of(context).pop();
//         notifyListeners();
//       }
//     } else {
//       snackBarForNoInternet(context);
//     }
//     notifyListeners();
//   }
//
//   Future updateProfile(BuildContext context) async {
//     Uri updateApi = Uri.parse("${baseApi}api/v1/profile/update");
//     if (loadRoleFromBox == 'tutor') {
//       print(
//           "pickedProfileImageUrl from editProfileData $pickedProfileImageUrl");
//
//       await http.post(updateApi, body: {
//         if (nameController != null &&
//             nameController!.text.trim() != '' &&
//             currentTutorUserData != null &&
//             nameController!.text != currentTutorUserData!.name)
//           "name": nameController!.text.trim(),
//         if (aboutController != null &&
//             aboutController!.text.trim() != '' &&
//             currentTutorUserData != null &&
//             aboutController!.text != currentTutorUserData!.bio)
//           "bio": aboutController!.text,
//         if (selectedCountryId != 0) "country_id": "$selectedCountryId",
//         if (selectedCurrencyId != 0) "currency_id": "$selectedCurrencyId",
//         "hourly_rate": sliderValue.round(),
//         if (headlineController != null &&
//             headlineController!.text.trim() != '' &&
//             currentTutorUserData != null &&
//             headlineController!.text != currentTutorUserData!.headline)
//           "headline": headlineController!.text,
//         if (selectedCityId != 0) "city_id": "$selectedCityId",
//         //if (selectedCityId == 0) "city_id": json.encode("null"),
//         if (currentTutorUserData != null)
//           "hourly_rate": "${sliderValue.round()}",
//         if (pickedProfileImageUrl != null) "image": pickedProfileImageUrl,
//         if (pickedProfileVideoUrl != null) "video": pickedProfileVideoUrl,
//         if (selectedAgeGroupNames.isNotEmpty)
//           "age_groups": json.encode(selectedAgeGroupNames),
//         if (selectedSkillsNames.isNotEmpty && selectedSkillsNames.length <= 4)
//           "skills": json.encode(selectedSkillsNames),
//       }, headers: {
//         "Authorization": "Bearer $loadUserTokenFromBox",
//         "lang": languageText,
//       }).then((res) async {
//         final result = json.decode(res.body) as Map<String, dynamic>;
//         if (result['is_authorized'] == true) {
//           if (result['status'] == true) {
//             await getCurrentUserData(true, context);
//             //Navigator.of(context).pushReplacementNamed("/tutor_profile");
//             Navigator.of(context).pop();
//             // getCurrentUserData(true, context);
//           }
//         }
//         showSnackBar(message: result['msg'], context: context);
//       });
//     } else if (loadRoleFromBox == 'learner') {
//       await http.post(updateApi, body: {
//         if (nameController != null &&
//             nameController!.text.trim() != '' &&
//             currentLearnerUserData != null &&
//             nameController!.text != currentLearnerUserData!.name)
//           "name": nameController!.text,
//         if (pickedProfileImageUrl != null) "image": pickedProfileImageUrl,
//       }, headers: {
//         "Authorization": "Bearer $loadUserTokenFromBox",
//         "lang": languageText,
//       }).then((res) async {
//         final result = json.decode(res.body) as Map<String, dynamic>;
//         if (result['is_authorized'] == true) {
//           if (result['status'] == true) {
//             await getCurrentUserData(true, context);
//             // Navigator.of(context).pushReplacementNamed("/learner_profile");
//             Navigator.of(context).pop();
//             // getCurrentUserData(true, context);
//           }
//         }
//         showSnackBar(message: result['msg'], context: context);
//       });
//     }
//   }
//
// ///////////////////////////////////////////////////////////////////////////// time slots
//
//   String endTime = '';
//   String startTime = '';
//   DateTime selectedDate = DateTime.now().add(const Duration(days: 1));
//
//   //List<TimeSlot> timeSlotsForProfile = [];
//
//   getDateFromUser(BuildContext ctx) async {
//     DateTime? _pickedDate = await showDatePicker(
//       context: ctx,
//       initialDate: DateTime.now(),
//       firstDate: DateTime(2022),
//       lastDate: DateTime(2025),
//     );
//     if (_pickedDate != null) {
//       selectedDate = _pickedDate;
//       notifyListeners();
//     } else {
//       print('selectedDate Is Null Or Something Wrong');
//     }
//   }
//
//   _showTimePicker(BuildContext ctx) {
//     return showTimePicker(
//         context: ctx,
//         initialTime: TimeOfDay(
//             hour: TimeOfDay.now().hour , minute: TimeOfDay.now().minute),
//         initialEntryMode: TimePickerEntryMode.input);
//   }
//
//   getTimeFromUser(
//       {required bool isStartTime, required BuildContext ctx}) async {
//     try {
//       var _pickedTime = await _showTimePicker(ctx);
//       if (_pickedTime != null) {
//         String _formattedTime = _pickedTime.format(ctx);
//         print("  _formattedTime :$_formattedTime");
//
//         if (_pickedTime == null) {
//           print('Time Canceled');
//         } else if (isStartTime) {
//           startTime = _formattedTime;
//           notifyListeners();
//           print(" start Time : $startTime");
//         } else {
//           endTime = _formattedTime;
//           notifyListeners();
//           print(" end Time : $endTime");
//         }
//       } else {
//         return;
//       }
//     } catch (error) {
//       showDialogBox(
//           text: AppLocalizations.of(ctx)!.ok,
//           message: AppLocalizations.of(ctx)!.some_thing_went_wrong,
//           context: ctx);
//     }
//   }
//
//   bool isTimeSlotLoading = false;
//
//   addTimeSlot(innerContext) async {
//     if (hasInternet == true) {
//       try {
//         isTimeSlotLoading = true;
//         notifyListeners();
//         Uri addTimeSlotApi = Uri.parse("${baseApi}api/v1/timeslots/add");
//         await http.post(addTimeSlotApi, headers: {
//           "Authorization": "Bearer $loadUserTokenFromBox",
//           "lang": languageText,
//         }, body: {
//           "start_time": startTime,
//           "end_time": endTime,
//           "date": selectedDate.toString()
//         }).then((res) {
//           print("time Slot Added");
//           final result = json.decode(res.body) as Map<String, dynamic>;
//           Navigator.of(innerContext).pop();
//           showSnackBar(message: result['msg'], context: innerContext);
//           isTimeSlotLoading = false;
//           notifyListeners();
//           //showSnackBar(message: "Time slot added", context: context);
//         });
//       } catch (error) {
//         showDialogBox(
//             text: AppLocalizations.of(innerContext)!.ok,
//             message: AppLocalizations.of(innerContext)!.some_thing_went_wrong,
//             context: innerContext);
//       }
//     } else {
//       snackBarForNoInternet(innerContext);
//     }
//   }
//
//   bool isDeletingTimeSlotLoading = false;
//
//   Future deleteTimeSlot(BuildContext context, int timeSlotIndex) async {
//     if (hasInternet == true) {
//       try {
//         isDeletingTimeSlotLoading = true;
//         notifyListeners();
//         Uri deleteTimeSlotApi = Uri.parse(
//             "${baseApi}api/v1/timeslots/delete/${currentTutorUserData!.timeSlots![timeSlotIndex].id}");
//         await http.post(deleteTimeSlotApi, headers: {
//           "Authorization": "Bearer $loadUserTokenFromBox",
//           "lang": languageText,
//         }).then((res) {
//           debugPrint("time Slot deleted");
//           currentTutorUserData!.timeSlots!.removeAt(timeSlotIndex);
//           final result = json.decode(res.body) as Map<String, dynamic>;
//           showSnackBar(message: result['msg'], context: context);
//           isDeletingTimeSlotLoading = false;
//           notifyListeners();
//         });
//       } catch (error) {
//         showDialogBox(
//             text: AppLocalizations.of(context)!.ok,
//             message: AppLocalizations.of(context)!.some_thing_went_wrong,
//             context: context);
//       }
//     } else {
//       snackBarForNoInternet(context);
//     }
//   }
//
//   /// countries attributes
//   List<Country> countries = [];
//   late List<String> countriesNames;
//   List<int> countriesIds = [0];
//
//   /// cities attributes
//   List<City> cities = [];
//   late List<String> citiesNames;
//   List<int> citiesIds = [0];
//
//   bool loadingCountryCitySkillsGroupsHourly = true;
//
//   /// skills
//   List<Skill> skills = [];
//   late List<String> skillsNames;
//
//   //List<int> skillsIds = [0];
//
//   /// age groups
//   List<AgeGroup> ageGroups = [];
//   late List<String> ageGroupsNames;
//
//   /// selected items
//   late String selectedCountry,
//       selectedCity,
//       selectedSkill,
//       selectedHourlyRate,
//       selectedCurrency;
//
//   List<Currency> currencies = [];
//   late List<String> currenciesNames;
//
//   List<int> currenciesIds = [0];
//
//   List<String> selectedAgeGroupNames = [],
//       //selectedAgeGroupIds = [],
//       selectedSkillsNames = [];
//
//   //selectedSkillsIds = [];
//
//   int selectedCountryId = 0, selectedCityId = 0, selectedCurrencyId = 0;
//
//   // getAllCountries() async {
//   //
//   // }
//   // getAllAgeGroups() async {
//   //
//   // }
//   // getAllCurrencies() async {
//   //
//   // }
//   // getAllSkills() async {
//   //
//   // }
//
//   initializingSomeVariables(context) {
//     print("languageText ====== $languageText");
//     currenciesNames = [languageText == "en" ? "select a currency" : "حدد عملة"];
//     selectedCountry = languageText == "en" ? "select a country" : "حدد بلدًا";
//     selectedCity = languageText == "en" ? "select a city" : "حدد مدينة";
//     selectedSkill =
//         languageText == "en" ? "select a specialization" : "حدد التخصص";
//     selectedHourlyRate =
//         languageText == "en" ? "Low To High" : "من الأقل إلى الأعلى";
//     selectedCurrency = languageText == "en" ? "select a currency" : "حدد عملة";
//     ageGroupsNames = [
//       languageText == "en"
//           ? "select an age group"
//           : "الفئات العمرية المفضلة لدي:"
//     ];
//     skillsNames = [
//       languageText == "en" ? "select a specialization" : "حدد التخصص"
//     ];
//     citiesNames = [languageText == "en" ? "select a city" : "حدد مدينة"];
//     countriesNames = [languageText == "en" ? "select a country" : "حدد بلدًا"];
//   }
// bool loadingCity = false;
//   Future getCountryCitySkillsGroupsHourly(type, context) async {
//     if (hasInternet == true) {
//       try {
//         loadingCountryCitySkillsGroupsHourly = true;
//         notifyListeners();
//         if(type == "find"){
//           findScreenDispose(context);
//         }
//         // /// countries
//         // selectedCountry = AppLocalizations.of(context)!.select_a_country;
//         // selectedCountryId = 0;
//         //
//         // /// cities
//         // selectedCity = AppLocalizations.of(context)!.select_a_city;
//         // selectedCityId = 0;
//         //
//         // /// specializations for find a tutor
//         // skillsNames = type == 'edit'
//         //     ? []
//         //     : [AppLocalizations.of(context)!.select_a_specialization];
//         // //skillsIds = [0];
//         // selectedSkill = AppLocalizations.of(context)!.select_a_specialization;
//         //
//         // /// hourly rate
//         // selectedHourlyRate = AppLocalizations.of(context)!.low_to_high;
//         // if (type == 'find') {
//         //   dropScreenDispose('find', context);
//         // }
//         //dropScreenDispose(type, context);
//         Uri countriesApi = Uri.parse("${baseApi}api/v1/countries");
//         await http.get(countriesApi, headers: {
//           "lang": languageText,
//         }).then((res) {
//           final countriesResult = json.decode(res.body) as Map<String, dynamic>;
//           print("countriesResult $countriesResult");
//           if (countriesResult['is_authorized'] == true) {
//             if (countriesResult['status'] == true) {
//               final List countriesList = countriesResult['data'];
//               for (var element in countriesList) {
//                 int isExist =
//                     countries.indexWhere((e) => e.id == element["id"]);
//                 if (isExist < 0) {
//                   countries.add(Country.fromJson(element));
//                   countriesNames.add(element['name']);
//                   countriesIds.add(element['id']);
//                 }
//               }
//             }
//           }
//         });
//
//         Uri skillsApi = Uri.parse("${baseApi}api/v1/skills");
//         await http.get(skillsApi, headers: {
//           "lang": languageText,
//         }).then((res) {
//           final skillsResult = json.decode(res.body) as Map<String, dynamic>;
//           if (skillsResult['is_authorized'] == true) {
//             if (skillsResult['status'] == true) {
//               final List specializationsList = skillsResult['data'];
//               for (var element in specializationsList) {
//                 int isExist = skills.indexWhere((e) => e.id == element["id"]);
//                 if (isExist < 0) {
//                   skills.add(Skill.fromJson(element));
//                   skillsNames.add(element['title']);
//                 }
//               }
//             }
//           }
//         });
//
//         if (type == "edit") {
//           Uri currenciesApi = Uri.parse("${baseApi}api/v1/currencies");
//           await http.get(currenciesApi, headers: {
//             "lang": languageText,
//           }).then((res) {
//             final currenciesResult =
//                 json.decode(res.body) as Map<String, dynamic>;
//             if (currenciesResult['is_authorized'] == true) {
//               if (currenciesResult['status'] == true) {
//                 final List allCurrencies = currenciesResult["data"];
//                 for (var element in allCurrencies) {
//                   int isExist =
//                       currencies.indexWhere((e) => e.id == element["id"]);
//                   if (isExist < 0) {
//                     currencies.add(Currency.fromJson(element));
//                     currenciesNames.add(element["symbol"]);
//                     currenciesIds.add(element["id"]);
//                   }
//                 }
//               }
//             }
//           });
//
//           print(currencies[0]);
//
//           Uri ageGroupApi = Uri.parse("${baseApi}api/v1/age-groups");
//           await http.get(ageGroupApi).catchError((e) {
//             showSnackBar(message: "$e", context: context);
//           }).then((res) {
//             final ageGroupResult =
//                 json.decode(res.body) as Map<String, dynamic>;
//             if (ageGroupResult['is_authorized'] == true) {
//               if (ageGroupResult['status'] == true) {
//                 final List ageGroupList = ageGroupResult['data'];
//                 for (var element in ageGroupList) {
//                   int isExist =
//                       ageGroups.indexWhere((e) => e.id == element["id"]);
//                   if (isExist < 0) {
//                     ageGroups.add(AgeGroup.fromJson(element));
//                     ageGroupsNames.add(element['title']);
//                   }
//                 }
//                 notifyListeners();
//               }
//             }
//           });
//         }
//
//       } catch (error) {
//         showDialogBox(
//             text: AppLocalizations.of(context)!.ok,
//             message: AppLocalizations.of(context)!.some_thing_went_wrong,
//             context: context);
//       } finally {
//         loadingCountryCitySkillsGroupsHourly = false;
//         if(type == "find"){
//           notifyListeners();
//         }
//         print("loadingCountryCitySkillsGroupsHourly $loadingCountryCitySkillsGroupsHourly");
//       }
//     } else {
//       snackBarForNoInternet(context);
//     }
//   }
//
//   void dropdownForSpecialization(newValue) {
//     selectedSkill = newValue;
//     notifyListeners();
//   }
//
//   void dropdownForCurrency(newValue) {
//     selectedCurrency = newValue;
//     editCurrency = newValue;
//     selectedCurrencyId =
//         currenciesIds.elementAt(currenciesNames.indexOf(selectedCurrency));
//     notifyListeners();
//
//     // cities.indexWhere((element) {
//     //   if(element.name == selectedCity){
//     //     selectedCityId = element.id;
//     //     return true;
//     //   }else{
//     //     return false;
//     //   }
//     // });
//   }
//
//   void onConfirmMulti(values, type) {
//     if (type == 'age') {
//       selectedAgeGroupNames = [];
//       selectedAgeGroupNames = List<String>.from(values);
//       notifyListeners();
//     } else if (type == 'skills') {
//       selectedSkillsNames = [];
//       selectedSkillsNames = List<String>.from(values);
//       notifyListeners();
//     }
//   }
//
//   Future getCitiesOfCountry(int id, BuildContext context) async {
//     if (hasInternet == true) {
//       try {
//         loadingCity = true;
//         notifyListeners();
//         await http
//             .get(Uri.parse("${baseApi}api/v1/country/$id/cities"), headers: {
//           "lang": languageText,
//         }).then((res) {
//           final result = json.decode(res.body) as Map<String, dynamic>;
//           if (result['is_authorized'] == true) {
//             if (result['status'] == true) {
//               final List citiesList = result['data'];
//               for (var element in citiesList) {
//                 int isExist = cities.indexWhere((e) => e.id == element["id"]);
//                 if (isExist < 0) {
//                   cities.add(City.fromJson(element));
//                   citiesNames.add(element['name']);
//                   citiesIds.add(element['id']);
//                 }
//               }
//               loadingCity = false;
//               notifyListeners();
//             }
//           }
//         });
//       } catch (error) {
//         loadingCity = false;
//         notifyListeners();
//         showDialogBox(
//             text: AppLocalizations.of(context)!.ok,
//             message: AppLocalizations.of(context)!.some_thing_went_wrong,
//             context: context);
//       }
//     } else {
//       snackBarForNoInternet(context);
//     }
//   }
//
//   Future dropdownForCountry({ newValue, context}) async {
//     /// 5 attributes clear for city
//     cities = [];
//     citiesNames = [AppLocalizations.of(context)!.select_a_city];
//     citiesIds = [0];
//     selectedCity = AppLocalizations.of(context)!.select_a_city;
//     editCity = AppLocalizations.of(context)!.select_a_city;
//     selectedCityId = 0;
//
//     selectedCountry = newValue;
//     if (selectedCountry == AppLocalizations.of(context)!.select_a_country) {
//       /// 5 attributes clear for city
//       cities = [];
//       citiesNames = [AppLocalizations.of(context)!.select_a_city];
//       citiesIds = [0];
//       selectedCity = AppLocalizations.of(context)!.select_a_city;
//       selectedCityId = 0;
//
//     } else {
//       /// 5 attributes clear for city
//       cities = [];
//       citiesNames = [AppLocalizations.of(context)!.select_a_city];
//       citiesIds = [0];
//       selectedCity = AppLocalizations.of(context)!.select_a_city;
//       selectedCityId = 0;
//
//
//       selectedCountryId =
//           countriesIds.elementAt(countriesNames.indexOf(selectedCountry));
//       // countries.indexWhere((element) {
//       //   if(element.name == selectedCountry){
//       //     selectedCountryId == element.id;
//       //     return true;
//       //   }else{
//       //     return false;
//       //   }
//       // });
//       print("selectedCountryId ${selectedCountryId}");
//
//       await getCitiesOfCountry(selectedCountryId, context);
//     }
//
//     notifyListeners();
//   }
//   Future dropdownForCountryEdit({ newValue, context}) async {
//     /// 5 attributes clear for city
//     cities = [];
//     citiesNames = [AppLocalizations.of(context)!.select_a_city];
//     citiesIds = [0];
//     selectedCity = AppLocalizations.of(context)!.select_a_city;
//     editCity = AppLocalizations.of(context)!.select_a_city;
//     selectedCityId = 0;
//
//     selectedCountry = newValue;
//     editCountry = newValue;
//     if (editCountry == AppLocalizations.of(context)!.select_a_country) {
//       /// 5 attributes clear for city
//       cities = [];
//       citiesNames = [AppLocalizations.of(context)!.select_a_city];
//       citiesIds = [0];
//       selectedCity = AppLocalizations.of(context)!.select_a_city;
//       selectedCityId = 0;
//       editCity = AppLocalizations.of(context)!.select_a_city;
//     } else {
//       /// 5 attributes clear for city
//       cities = [];
//       citiesNames = [AppLocalizations.of(context)!.select_a_city];
//       citiesIds = [0];
//       selectedCity = AppLocalizations.of(context)!.select_a_city;
//       editCity = AppLocalizations.of(context)!.select_a_city;
//       selectedCityId = 0;
//
//       selectedCountryId =
//           countriesIds.elementAt(countriesNames.indexOf(selectedCountry));
//       // countries.indexWhere((element) {
//       //   if(element.name == selectedCountry){
//       //     selectedCountryId == element.id;
//       //     return true;
//       //   }else{
//       //     return false;
//       //   }
//       // });
//       print("selectedCountryId ${selectedCountryId}");
//
//       await getCitiesOfCountry(selectedCountryId, context);
//     }
//   }
//
//   /*void dropScreenDispose(type, context) {
//     ///currencies
//
//     if (type == 'edit') {
//       //currencies = [];
//       selectedCurrency = AppLocalizations.of(context)!.select_a_currency;
//       selectedCurrencyId = 0;
//     }
//
//     /// countries
//     selectedCountry = AppLocalizations.of(context)!.select_a_country;
//     selectedCountryId = 0;
//
//     /// cities
//     selectedCity = AppLocalizations.of(context)!.select_a_city;
//     selectedCityId = 0;
//
//     /// specializations for find a tutor
//     skillsNames = type == 'edit'
//         ? []
//         : [AppLocalizations.of(context)!.select_a_specialization];
//     //skillsIds = [0];
//     selectedSkill = AppLocalizations.of(context)!.select_a_specialization;
//
//     /// hourly rate
//     selectedHourlyRate = AppLocalizations.of(context)!.low_to_high;
//     print("function dispose edit and find");
//   }*/
//   void findScreenDispose(context){
//     /// countries
//     selectedCountry = AppLocalizations.of(context)!.select_a_country;
//     selectedCountryId = 0;
//
//     /// cities
//     selectedCity = AppLocalizations.of(context)!.select_a_city;
//     selectedCityId = 0;
//
//     /// specializations for find a tutor
//     skillsNames = [AppLocalizations.of(context)!.select_a_specialization];
//     //skillsIds = [0];
//     selectedSkill = AppLocalizations.of(context)!.select_a_specialization;
//
//     /// hourly rate
//     selectedHourlyRate = AppLocalizations.of(context)!.low_to_high;
//     print("function dispose edit and find");
//   }
//   void editScreenDispose(context){
//     /// video
//     pickedProfileVideo = null;
//     pickedProfileVideoUrl = null;
//
//     ///currencies
//     selectedCurrency = AppLocalizations.of(context)!.select_a_currency;
//     selectedCurrencyId = 0;
//     currencies = [];
//     currenciesNames = [AppLocalizations.of(context)!.select_a_currency];
//     editCurrency = null;
//
//     /// age group
//     ageGroupsNames = [];
//     ageGroups = [];
//     selectedAgeGroupNames = [];
//
//     /// countries
//     selectedCountry = AppLocalizations.of(context)!.select_a_country;
//     selectedCountryId = 0;
//     // selectedCountry = AppLocalizations.of(context)!.select_a_country;
//     // selectedCountryId = 0;
//     editCountry = null;
//
//
//     /// cities
//     selectedCity = AppLocalizations.of(context)!.select_a_city;
//     selectedCityId = 0;
//     // selectedCity = AppLocalizations.of(context)!.select_a_city;
//     // selectedCityId = 0;
//     editCity = null;
//
//     /// specializations for find a tutor
//     skillsNames =[];
//
//     //skillsIds = [0];
//     selectedSkill = AppLocalizations.of(context)!.select_a_specialization;
//     skillsNames = [];
//     skills = [];
//     selectedSkillsNames = [];
//   }
//
//   void dropdownForCity(newValue) {
//     selectedCity = newValue;
//     selectedCityId = citiesIds.elementAt(citiesNames.indexOf(selectedCity));
//
//     // cities.indexWhere((element) {
//     //   if(element.name == selectedCity){
//     //     selectedCityId = element.id;
//     //     return true;
//     //   }else{
//     //     return false;
//     //   }
//     // });
//
//     notifyListeners();
//   }
//   void dropdownForCityEdit(newValue) {
//     selectedCity = newValue;
//     editCity = newValue;
//     selectedCityId = citiesIds.elementAt(citiesNames.indexOf(selectedCity));
//
//     // cities.indexWhere((element) {
//     //   if(element.name == selectedCity){
//     //     selectedCityId = element.id;
//     //     return true;
//     //   }else{
//     //     return false;
//     //   }
//     // });
//
//     notifyListeners();
//   }
//
// /////////////////////////////////////////////////////
//
//   void dropdownForHourlyRate(newValue) {
//     selectedHourlyRate = newValue;
//     notifyListeners();
//   }
//
//   String? pickedProfileImageUrl;
//   String? pickedProfileVideoUrl;
//   bool rememberMeCheck = true;
//   bool isTerms = true;
//
//   void rememberCheck(bool newValue) {
//     rememberMeCheck = newValue;
//     saveRememberMeBool(rememberMeCheck);
//     notifyListeners();
//   }
//
//   void termsCheck(bool newValue) {
//     isTerms = newValue;
//     //saveRememberMeBool(rememberMeCheck);
//     notifyListeners();
//   }
//  //
//  // final String _dateOfPlanKey = "dateOfPlaneKey";
//  //
//  //  saveDateOfPlan(DateTime date) => _box.write(_dateOfPlanKey, date);
//  //
//  //  DateTime? get loadDateOfPlanFromBox => _box.read(_dateOfPlanKey);
//  //
//
//   bool isLoad = false;
//
//   Future authenticateWithEmailAndPassword(
//       {required String sign, required BuildContext context}) async {
//     if (hasInternet == true) {
//       try {
//         isLoad = true;
//         notifyListeners();
//         await getAllDeviceData(context);
//         if (loadRememberMeBoolFromBox && loadUserTokenFromBox != "") {
//           Navigator.of(context).pushNamed('/home');
//           isLoad = false;
//         } else {
//           if (rememberMeCheck && email != null && password != null) {
//             saveRememberMeBool(rememberMeCheck);
//             saveEmail(email!);
//             saveRememberMePassword(password!);
//           }
//           if (sign == 'Login') {
//             print("sign in ..... email $email ,,, password $password ");
//             Uri loginApi = Uri.parse("${baseApi}api/v1/login");
//             await http.post(loginApi, body: {
//               "email": email,
//               "password": password,
//               "notification_token": deviceData['notification_token'],
//               "android_version": deviceData['android_version'],
//               "sdk_num": deviceData['sdk_num'].toString(),
//               "manufacturer": deviceData['manufacturer'],
//               "model": deviceData['model'],
//               "app_version": deviceData['app_version'],
//             }, headers: {
//               "lang": languageText,
//             }).then((res) {
//               print('this is login res ${res.body}');
//               final result = json.decode(res.body) as Map<String, dynamic>;
//               if (result['is_authorized'] == true) {
//                 if (result['status'] == true) {
//                   saveUserToken(result['data']['token']);
//                   saveRole(result['data']['role']);
//                   saveUserId(result['data']['user_id']);
//                   saveEmailVerified(result['data']['email_verified']);
//                   saveEmail(email!);
//                   print("This is the User Token ${result['data']['token']}");
//                   print(
//                       "This is the User Token ${result['data']['email_verified']}");
//
//                   Navigator.of(context).pushReplacementNamed('/home');
//                   isLoad = false;
//                 } else {
//                   isLoad = false;
//                   showSnackBar(
//                       message: result['msg']['error'], context: context);
//                   notifyListeners();
//                 }
//               } else {
//                 isLoad = false;
//                 showSnackBar(message: result['msg']['error'], context: context);
//                 notifyListeners();
//               }
//             });
//           } else {
//             print(
//                 "sign up ..... name $name ,,, email $email ,,, password $password ,,, selectedRole $selectedRole");
//
//             if(pickedProfileImage != null){
//               Uri uploadImageApi = Uri.parse("${baseApi}api/v1/upload-image");
//               http.MultipartRequest request =
//               http.MultipartRequest("POST", uploadImageApi);
//               request.fields['directory'] = 'profile_image';
//               http.MultipartFile multipartFile =
//               await http.MultipartFile.fromPath(
//                   'image', pickedProfileImage!.path);
//               request.files.add(multipartFile);
//               //request.headers['Authorization'] = "bearer $loadUserTokenFromBox";
//               http.StreamedResponse response = await request.send();
//               response.stream.transform(utf8.decoder).listen((res) async {
//                 print("This is very important $res");
//                 final result = json.decode(res) as Map<String, dynamic>;
//                 if (result['is_authorized'] == true) {
//                   if (result['status'] == true) {
//                     pickedProfileImageUrl = result['data']['image_url'];
//                     print(
//                         "This is very result['data']['image_url'] $pickedProfileImageUrl");
//                     if (pickedProfileImageUrl != null &&
//                         pickedProfileImageUrl != '') {
//                       await signUPMethod(context);
//                     } else {
//                       isLoad = false;
//                       showSnackBar(message: result['msg'], context: context);
//                       notifyListeners();
//                     }
//                   } else {
//                     isLoad = false;
//                     showSnackBar(message: result['msg'], context: context);
//                     notifyListeners();
//                   }
//                 } else {
//                   isLoad = false;
//                   showSnackBar(message: result['msg'], context: context);
//                   notifyListeners();
//                 }
//               });
//             }else{
//               await signUPMethod(context);
//             }
//           }
//         }
//       } catch (error) {
//         isLoad = false;
//         notifyListeners();
//         showDialogBox(
//             text: AppLocalizations.of(context)!.ok,
//             message: AppLocalizations.of(context)!.some_thing_went_wrong,
//             context: context);
//       }
//     } else {
//       snackBarForNoInternet(context);
//     }
//   }
//
//   Future<void> signUPMethod(BuildContext context) async {
//     Uri signUpApi = Uri.parse("${baseApi}api/v1/register");
//     await http.post(signUpApi, body: {
//       "name": name,
//       "email": email,
//       "password": password,
//       "password_confirmation": password,
//       "image": pickedProfileImageUrl ?? "p9BY2gmfzZa6RgU2RuV8/uploaded/hello/tMTeybQYz7G4kzGtE1NK.png",
//       "type": selectedRole,
//       'notification_token': deviceData['notification_token'],
//       'android_version': deviceData['android_version'],
//       'sdk_num': deviceData['sdk_num'].toString(),
//       'manufacturer': deviceData['manufacturer'],
//       'model': deviceData['model'],
//       'app_version': deviceData['app_version'],
//     }, headers: {
//       "lang": languageText,
//     }).then((res) {
//       print(res.body);
//       final result =
//           json.decode(res.body) as Map<String, dynamic>;
//       if (result['is_authorized'] == true) {
//         if (result['status'] == true) {
//           saveUserToken(result['data']['token']);
//           saveRole(result['data']['role']);
//           saveUserId(result['data']['user_id']);
//           saveEmailVerified(result['data']['email_verified']);
//           saveEmail(email!);
//           print("This is the User Token ${result['data']['token']}");
//           emailToBeVerified = null;
//           /// this is the true but commented for develop mode
//           Navigator.of(context).pushReplacementNamed('/verify');
//           // Navigator.of(context).pushReplacementNamed('/home');
//
//
//         } else {
//           isLoad = false;
//           showSnackBar(
//               message: result['msg'], context: context);
//           notifyListeners();
//         }
//       } else {
//         isLoad = false;
//         showSnackBar(message: result['msg'], context: context);
//         notifyListeners();
//       }
//     });
//   }
//
//   Future sendVerifyCode({required BuildContext context}) async {
//     if (hasInternet == true) {
//       try {
//         Uri sendCodeVerifyApi =
//             Uri.parse("${baseApi}api/v1/send-verification-code");
//         await http.post(
//           sendCodeVerifyApi,
//           body: {"email": loadEmailFromBox},
//         ).then((res) {
//           final result = json.decode(res.body) as Map<String, dynamic>;
//           showSnackBar(message: "${result["msg"]}", context: context);
//         });
//       } catch (error) {
//         print("error errorerrorerrorerror : $error");
//         showDialogBox(
//             text: AppLocalizations.of(context)!.ok,
//             message: AppLocalizations.of(context)!.some_thing_went_wrong,
//             context: context);
//       }
//     } else {
//       snackBarForNoInternet(context);
//     }
//   }
//
//   Future codeVerify(
//       {required String code, required BuildContext context}) async {
//     if (hasInternet == true) {
//       try {
//         Uri codeVerifyApi =
//             Uri.parse("${baseApi}api/v1/check-verification-code");
//         await http.post(codeVerifyApi, body: {
//           "code": code
//         }, headers: {
//           "Authorization": "bearer $loadUserTokenFromBox",
//           "lang": languageText,
//         }).then((res) {
//           final result = json.decode(res.body) as Map<String, dynamic>;
//           if (result['is_authorized'] == true) {
//             if (result['status'] == true) {
//               Navigator.of(context).pushReplacementNamed('/home');
//               showSimpleNotification(
//                   Text("${AppLocalizations.of(context)!.hi}${name != null?" $name":","} ${AppLocalizations.of(context)!.welcome_to_tutors}",
//                     style: Themes.bold15(color: Colors.black),
//                     overflow: TextOverflow.ellipsis,
//                   ),
//                   elevation: 0,
//                   subtitle: loadRoleFromBox == 'tutor'
//                       ? Text(
//                     AppLocalizations.of(context)!
//                         .complete_your_profile_English_learners_are_looking_for_you,
//                     style: Themes.medium13(color: Colors.black),
//                     overflow: TextOverflow.ellipsis,
//                   )
//                       : Text(
//                     AppLocalizations.of(context)!
//                         .find_your_best_English_tutor_and_arrange_a_free_chat_meeting,
//                     style: Themes.medium13(color: Colors.black),
//                     overflow: TextOverflow.ellipsis,),
//                   background: yellow,
//                   duration:const Duration(seconds: 30),
//                   slideDismissDirection: DismissDirection.horizontal);
//               saveEmailVerified(true);
//
//               notifyListeners();
//             } else {
//               showSnackBar(message: result['msg'], context: context);
//             }
//           }
//         });
//       } catch (error) {
//         print("this is verify error : $error");
//         showDialogBox(
//             text: AppLocalizations.of(context)!.ok,
//             message: AppLocalizations.of(context)!.some_thing_went_wrong,
//             context: context);
//       }
//     } else {
//       snackBarForNoInternet(context);
//     }
//   }
//
//  // final GlobalKey<FormState> _formKey2 = GlobalKey();
//
//   bool isForgetPasswordLoading = false;
//
//   Future forgetPassword({required BuildContext context}) async {
//     if (hasInternet == true) {
//       try {
//         isForgetPasswordLoading = true;
//         notifyListeners();
//         Uri sendCodeVerifyApi =
//         Uri.parse("${baseApi}api/v1/forget-password");
//         await http.post(
//           sendCodeVerifyApi,
//           body: {"email": emailToBeVerified},
//           headers: {
//             "lang": languageText,
//           },
//         ).then((res) {
//           final result =
//           json.decode(res.body) as Map<String, dynamic>;
//           if (result['is_authorized'] == true) {
//             if (result['status'] == true) {
//               Navigator.of(context).pushReplacementNamed("/verify");
//             }
//           }
//           isForgetPasswordLoading = false;
//           notifyListeners();
//           showSnackBar(
//               message: "${result["msg"]}", context: context);
//         });
//       } catch (error) {
//         isForgetPasswordLoading = false;
//         notifyListeners();
//         showSnackBar(
//             message: AppLocalizations.of(context)!
//                 .some_thing_went_wrong,
//             context: context);
//       }
//     } else {
//       snackBarForNoInternet(context);
//     }
//   }
//
//   Future codeVerifyForgetPassword(
//       {required String code, required BuildContext context}) async {
//     if (hasInternet == true) {
//       try {
//         Uri codeVerifyForgetPasswordApi =
//             Uri.parse("${baseApi}api/v1/check-forgot-password-code");
//         await http.post(
//           codeVerifyForgetPasswordApi,
//           body: {
//             "email": emailToBeVerified,
//             "code": code,
//           },
//           headers: {
//             "lang": languageText,
//           },
//         ).then((res) {
//           final result = json.decode(res.body) as Map<String, dynamic>;
//           if (result['is_authorized'] == true) {
//             if (result['status'] == true) {
//               Navigator.of(context).pushReplacementNamed('/newPassword');
//               notifyListeners();
//             } else {
//               showSnackBar(message: result['msg'], context: context);
//             }
//           }
//         });
//       } catch (error) {
//         showDialogBox(
//             text: AppLocalizations.of(context)!.ok,
//             message: AppLocalizations.of(context)!.some_thing_went_wrong,
//             context: context);
//       }
//     } else {
//       snackBarForNoInternet(context);
//     }
//   }
//
//   bool isSetNewPasswordLoading = false;
//
//   Future setNewPassword({required BuildContext context}) async {
//     if (hasInternet == true) {
//       try {
//         isSetNewPasswordLoading = true;
//         notifyListeners();
//         Uri setNewPasswordApi = Uri.parse("${baseApi}api/v1/set-new-password");
//         await http.post(
//           setNewPasswordApi,
//           body: {
//             "email": emailToBeVerified,
//             "password": newPassword,
//             "password_confirmation": newPassword,
//           },
//           headers: {
//             "lang": languageText,
//           },
//         ).then((res) {
//           final result = json.decode(res.body) as Map<String, dynamic>;
//           if (result['is_authorized'] == true) {
//             if (result['status'] == true) {
//               Navigator.of(context).pushReplacementNamed('/sign');
//               notifyListeners();
//             }
//             isSetNewPasswordLoading = false;
//             notifyListeners();
//             showSnackBar(message: result['msg'], context: context);
//           }
//         });
//       } catch (error) {
//         isSetNewPasswordLoading = false;
//         notifyListeners();
//         showDialogBox(
//             text: AppLocalizations.of(context)!.ok,
//             message: AppLocalizations.of(context)!.some_thing_went_wrong,
//             context: context);
//       }
//     } else {
//       snackBarForNoInternet(context);
//     }
//   }
//
// ///////////////////////////////////////////////////////////////////////// get users data all methods
//   Tutor? currentTutorUserData;
//   Learner? currentLearnerUserData;
//
//   //List<Review> tutorReviewsForProfile = [] ;
//
//   TextEditingController? nameController, headlineController, aboutController;
//
//   //hourlyRateController
//   List<String?> initialSkills = [];
//   List<String?> initialAges = [];
//
//   // List<String> currenciesNames = [];
//   // List<int> currenciesIds = [];
//
//   String? editCountry;
//   String? editCity;
//   String? editCurrency;
//
//   forEditScreen(context) async{
//
//       /// profile image
//       pickedProfileImage = null;
//       pickedProfileImageUrl = null;
//
//       if(currentTutorUserData == null && currentLearnerUserData == null){
//         await getCurrentUserData(false, context);
//       }
//       if (loadRoleFromBox == "tutor"){
//         editScreenDispose(context);
//       }
//
//     //  if (loadRoleFromBox == "tutor") {
//         // /// currencies
//         // currencies = [];
//         // currenciesNames = [AppLocalizations.of(context)!.select_a_currency];
//         // editCurrency = null;
//         //
//         //
//         //
//         //
//         // /// age group
//         // ageGroupsNames = [];
//         // ageGroups = [];
//         // selectedAgeGroupNames = [];
//
//         // /// skills for edit (Multi select)
//         // skillsNames = [];
//         // skills = [];
//         // selectedSkillsNames = [];
//
//         // /// countries
//         // selectedCountry = AppLocalizations.of(context)!.select_a_country;
//         // selectedCountryId = 0;
//         // editCountry = null;
//         //
//         // /// cities
//         // selectedCity = AppLocalizations.of(context)!.select_a_city;
//         // selectedCityId = 0;
//         // editCity = null;
//       //}
//
//       if (loadRoleFromBox == 'tutor' && currentTutorUserData != null) {
//         nameController = TextEditingController();
//         headlineController = TextEditingController();
//         aboutController = TextEditingController();
// /*
//       hourlyRateController = TextEditingController();
// */
//         if (nameController != null &&
//             headlineController != null &&
//             aboutController != null /*hourlyRateController != null*/) {
//           nameController!.text = currentTutorUserData!.name;
//           if (currentTutorUserData!.headline != null) {
//             headlineController!.text = currentTutorUserData!.headline!;
//           }
//           if (currentTutorUserData!.bio != null) {
//             aboutController!.text = currentTutorUserData!.bio!;
//           }
//           if (currentTutorUserData!.hourlyRate != 'null') {
//             sliderValue = double.parse(currentTutorUserData!.hourlyRate!.toString());
//             // currentTutorUserData!.hourlyRate!.contains("U")?
//             // double.parse(currentTutorUserData!.hourlyRate!.split("U")[0].toString()):
//             // currentTutorUserData!.hourlyRate!.contains("E")?
//             // double.parse(currentTutorUserData!.hourlyRate!.split("E")[0].toString()):
//             // currentTutorUserData!.hourlyRate!.contains("ج")?
//             // double.parse(currentTutorUserData!.hourlyRate!.split("ج")[0].toString()):
//             // currentTutorUserData!.hourlyRate!.contains("د")?
//             // double.parse(currentTutorUserData!.hourlyRate!.split("د")[0].toString()):
//             // currentTutorUserData!.hourlyRate!.contains(" ")?
//             // double.parse(currentTutorUserData!.hourlyRate!.split(" ")[0].toString()):double.parse(currentTutorUserData!.hourlyRate!.toString())
//             //hourlyRateController!.text = currentTutorUserData!.hourlyRate!;
//           }
//         }
//
//         if (currentTutorUserData!.skills != null) {
//           for (var element in currentTutorUserData!.skills!) {
//             int isExist = initialSkills
//                 .indexWhere((e) => e.toString() == element.toString());
//             if (isExist < 0) {
//               initialSkills.add(element);
//             }
//           }
//         }
//
//         if (currentTutorUserData!.ageGroups != null) {
//           for (var element in currentTutorUserData!.ageGroups!) {
//             int isExist =
//             initialAges.indexWhere((e) => e.toString() == element.toString());
//             if (isExist < 0) {
//               initialAges.add(element);
//             }
//           }
//         }
//
//         if (currentTutorUserData!.country != null &&
//             currentTutorUserData!.countryId != null) {
//           editCountry = currentTutorUserData!.country!;
//         }
//
//         if (currentTutorUserData!.city != null &&
//             currentTutorUserData!.cityId != null) {
//           editCity = currentTutorUserData!.city!;
//         }
//
//         if (currentTutorUserData!.currencySymbol != null &&
//             currentTutorUserData!.currencyId != null) {
//           editCurrency = currentTutorUserData!.currencySymbol!;
//         }
//
//       } else if (loadRoleFromBox == 'learner' &&
//           currentLearnerUserData != null) {
//         nameController = TextEditingController();
//         if (nameController != null) {
//           nameController!.text = currentLearnerUserData!.name;
//         }
//       }
//
//       await getCountryCitySkillsGroupsHourly('edit',context).then((value) => notifyListeners());
//
//       try { } catch (error) {
//       showDialogBox(
//           text: AppLocalizations.of(context)!.ok,
//           message: AppLocalizations.of(context)!.some_thing_went_wrong,
//           context: context);
//     }
//   }
//
// forFindScreen(context){
//
// }
//
//
//   bool loadProfile = false;
//   bool isLikedLocal = false;
//
//   bool profileInternet = true;
//
//   bool profileError = false;
//
//   Future getCurrentUserData(bool isRefresh, context) async {
//     if (hasInternet == true) {
//       try {
//         profileInternet = true;
//         profileError = false;
//         Uri currentUserApi = Uri.parse("${baseApi}api/v1/user-profile");
//         if (!isRefresh) loadProfile = true;
//         if ((currentTutorUserData != null || currentLearnerUserData != null) &&
//             !isRefresh) {
//           loadProfile = false;
//         } else {
//           await http.get(currentUserApi, headers: {
//             "Authorization": "Bearer $loadUserTokenFromBox",
//             "lang": languageText,
//           }).then((res) {
//             final result = json.decode(res.body) as Map<String, dynamic>;
//             if (result['is_authorized'] == true) {
//               if (result['status'] == true) {
//                 debugPrint("loadUserTokenFromBox, $loadUserTokenFromBox");
//                 if (loadRoleFromBox == 'tutor') {
//                   currentTutorUserData = Tutor.fromJson(result['data'], true);
//
//                   print("loadUserTokenFromBox  $loadUserTokenFromBox");
//                 } else if (loadRoleFromBox == 'learner') {
//                   print("loadUserTokenFromBox  $loadUserTokenFromBox");
//                   currentLearnerUserData = Learner.fromJson(result['data']);
//                 }
//                 loadProfile = false;
//                 notifyListeners();
//               }
//             }
//           });
//         }
//       }catch(e){}
//     } else {
//       profileError = true;
//       profileInternet = false;
//     }
//   }
//
//   /// for main screen
//   List<Tutor> allMainTutors = [];
//   List<Tutor> onlyVerifiedTutors = [];
//   Tutor? tutorFromMainData;
//
//   int currentMainListPage = 1;
//   int? totalMainListPages;
//
//   int currentVerifiedListPage = 1;
//   int? totalVerifiedListPages;
//
//   bool isTopMainList = true;
//
//   int unreadNotification = 0 ;
//   int unreadConversation = 0 ;
//
//   Future getAllMainTutors(BuildContext context, {bool isFirst = false}) async {
//     if (hasInternet == true) {
//       try {
//         homeError = false;
//         homeInternet = true;
//         if (isFirst) {
//           isLoad = true;
//           allMainTutors = [];
//           currentMainListPage = 1;
//         } else {
//           currentMainListPage++;
//           if (totalMainListPages != null &&
//               currentMainListPage > totalMainListPages!) {
//             isTopMainList = true;
//             print("this is the end");
//             return false;
//           }
//         }
//         Uri allMainTutorsApi =
//             Uri.parse("${baseApi}api/v1/tutors?page=$currentMainListPage");
//         await http.get(
//           allMainTutorsApi,
//           headers: {
//             "lang": languageText,
//             //'Content-Type': 'application/json',
//           },
//         ).then((res) async{
//           final result = json.decode(res.body) as Map<String, dynamic>;
//           if (result['is_authorized'] == true) {
//             if (result['status'] == true) {
//               final List allMainTutorsAsMap = result['data']['data'];
//               totalMainListPages = result['data']['pagination']['total_pages'];
//               for (var element in allMainTutorsAsMap) {
//                 int isExist = allMainTutors.indexWhere((x) => x.tutorId == element["tutor_id"]);
//                 if(isExist < 0){
//                   allMainTutors.add(Tutor.fromJson(element, false));
//                 }
//               }
//               print("allMainTutors ${allMainTutors.length}");
//               isLoad = false;
//               notifyListeners();
//               return true;
//             } else {
//               return false;
//             }
//           } else {
//             return false;
//           }
//         });
//         } catch (error) {
//         print("this is error from main home function $error");
//         //homeError = true;
//        // homeInternet = false;
//         notifyListeners();
//       }
//     } else {
//       homeError = false;
//       homeInternet = false;
//     }
//   }
// Future getNotificationAndChatNum() async{
//   if (hasInternet == true && loadUserTokenFromBox != "") {
//     try{
//       Uri getUnreadNotifications =
//       Uri.parse("${baseApi}api/v1/unread-notifications");
//
//       await http.get(
//         getUnreadNotifications,
//         headers: {
//           "Authorization": "bearer $loadUserTokenFromBox",
//          // 'Content-Type': 'application/json',
//           //"X-Requested-With": "XMLHttpRequest",
//             "lang": languageText,
//         },
//       ).then((res) {
//         print("getUnreadNotifications res.statusCode ${res.statusCode}");
//         final result = json.decode(res.body) as Map<String, dynamic>;
//         if (result['status'] == true) {
//           print(" result['status'] : ${result['status']}");
//           unreadNotification = result['data']["count"];
//           print(" unreadNotification : $unreadNotification");
//         }
//
//         print("getNotificationAndChatNum done successfully $result");
//       });
//
//       Uri getUnreadConversation =
//       Uri.parse("${baseApi}api/v1/unread-conversations");
//
//       // DioHelper.getData(url: "api/v1/unread-conversations",lang: languageText,token: loadUserTokenFromBox).then((res) {
//       //   print("getUnreadConversation res.statusCode ${res.statusCode}");
//       //
//       //   //print(" converstain num get successfully ${json.decode(res.body)}");
//       //   final result = res.data;
//       //   if (result['status'] == true) { //
//       //     print(" result['status'] : ${result['status']}");
//       //     unreadConversation = result["data"]["count"];
//       //     print(" unreadConversation : $unreadConversation");
//       //
//       //     // notifyListeners();
//       //   }
//       //   print("getNotificationAndChatNum   conversations  done successfully $result");
//       //
//       // });
//
//       await http.get(
//         getUnreadConversation,
//         headers: {
//           "Authorization": "bearer $loadUserTokenFromBox",
//           //'Content-Type': 'application/json',
//           //"X-Requested-With": "XMLHttpRequest",
//           "lang": languageText,
//         },
//       ).then((res) {
//         print("getUnreadConversation res.statusCode ${res.statusCode}");
//
//         //print(" converstain num get successfully ${json.decode(res.body)}");
//         final result = json.decode(res.body) as Map<String, dynamic>;
//         if (result['status'] == true) { //
//           print(" result['status'] : ${result['status']}");
//           unreadConversation = result["data"]["count"];
//           print(" unreadConversation : $unreadConversation");
//
//          // notifyListeners();
//         }
//         print("getNotificationAndChatNum done successfully $result");
//
//       });
//       }catch(e){
//       print("chat notification nums error: $e");
//     }
//   }
// }
//
// TutorPlan? tutorPlanInfo ;
//
// Future renewApi() async{
//   if(loadRoleFromBox == "tutor"){
//     try{
//       print("iiiiiiiiiiii $loadUserIdBox");
//       await http.post(Uri.parse("http://tutor-s.com:5895/tutor-plan/$loadUserIdBox")).then((res){
//         final result = json.decode(res.body) as Map<String, dynamic>;
//         if(result['done'] == true){
//           final tutorInfo = result['tutor_info'] as Map<String, dynamic>;
//           tutorPlanInfo =  TutorPlan.fromJson(tutorInfo);
//           print(tutorPlanInfo!.name);
//           print(tutorPlanInfo!.days);
//           print(tutorPlanInfo!.planMonths);
//         }
//         notifyListeners();
//       });
//     }catch(_){}
//   }
// }
//   listenMainListScrolling(context, controller) {
//     if (controller != null) {
//       controller.addListener(() {
//         if (controller.position.atEdge) {
//           final isTop = controller.position.pixels == 0;
//           if (!isTop) {
//             isTopMainList == true;
//             getAllMainTutors(context, isFirst: false);
//             isTopMainList = false;
//           }
//           notifyListeners();
//         }
//       });
//     }
//   }
//
//   bool isTopVerifiedList = true;
//
//   bool homeInternet = true;
//
//   bool homeError = false;
//
//   /// add page number
//   Future getVerifiedTutors(BuildContext context, {bool isFirst = false}) async {
//     if (hasInternet == true) {
//       try {
//         homeInternet = true;
//         homeError = false;
//         if (isFirst) {
//           onlyVerifiedTutors = [];
//           currentVerifiedListPage = 1;
//         } else {
//           currentVerifiedListPage++;
//           if (totalVerifiedListPages != null &&
//               currentVerifiedListPage > totalVerifiedListPages!) {
//             isTopVerifiedList = true;
//             return false;
//           }
//         }
//         Uri onlyVerifiedTutorsApi = Uri.parse(
//             "${baseApi}api/v1/tutors/verified?page=$currentVerifiedListPage");
//
//         await http.get(onlyVerifiedTutorsApi, headers: {
//           "lang": languageText,
//         }).then((res) {
//           final result = json.decode(res.body) as Map<String, dynamic>;
//           if (result['is_authorized'] == true) {
//             if (result['status'] == true) {
//               final List allMainTutorsAsMap = result['data']['data'];
//               totalVerifiedListPages =
//                   result['data']['pagination']['total_pages'];
//               for (var element in allMainTutorsAsMap) {
//                 onlyVerifiedTutors.add(Tutor.fromJson(element, false));
//               }
//               notifyListeners();
//               return true;
//             } else {
//               return false;
//             }
//           } else {
//             return false;
//           }
//         });
//       } catch (error) {
//         //homeError = true;
//         //notifyListeners();
//       }
//     } else {
//       homeError = true;
//       homeInternet = false;
//     }
//   }
//
//   listenOnlyVerifiedScrolling(context, controller) {
//     if (controller != null) {
//       controller.addListener(() {
//         if (controller.position.atEdge) {
//           final isTop = controller.position.pixels == 0;
//           if (!isTop) {
//             isTopVerifiedList == true;
//             getVerifiedTutors(context, isFirst: false);
//             isTopVerifiedList = false;
//           }
//           notifyListeners();
//         }
//       });
//     }
//   }
//
//   bool isLoadFromMainData = false;
//
//   Future goToTutorFromMainScreen(tutorId, ctx) async {
//     if (hasInternet == true) {
//       try {
//         isLoadFromMainData = true;
//         tutorFromMainData = null;
//         Navigator.of(ctx).pushNamed('/tutor_from_main');
//
//         Uri tutorFromMainApi = Uri.parse("${baseApi}api/v1/tutors/$tutorId");
//         await http.get(tutorFromMainApi, headers: loadUserTokenFromBox != "" ? {
//           "Authorization": "bearer $loadUserTokenFromBox",
//           "lang": languageText,
//         }:{
//           "lang": languageText,
//         }).then((res) {
//           final result = json.decode(res.body) as Map<String, dynamic>;
//           if (result['is_authorized'] == true) {
//             if (result['status'] == true) {
//               tutorFromMainData = Tutor.fromJson(result['data'], true);
//               isLoadFromMainData = false;
//               notifyListeners();
//             }
//           }
//         }).then((value) {
//           if (tutorFromMainData == null) {
//             Navigator.of(ctx).pop();
//
//           }
//         });
//       } catch (error) {
//         showDialogBox(
//             text: AppLocalizations.of(ctx)!.ok,
//             message: AppLocalizations.of(ctx)!.some_thing_went_wrong,
//             context: ctx);
//       }
//     } else {
//       snackBarForNoInternet(ctx);
//     }
//   }
//
//   bool isBookLoading = false;
//
//   Future bookTimeSlot(index, context) async {
//     if (hasInternet == true) {
//       if(loadEmailVerifiedFromBox  == true){
//         try {
//           if (loadRoleFromBox == 'learner') {
//             isBookLoading = true;
//             notifyListeners();
//             Uri bookTimeSlotApi = Uri.parse(
//                 "${baseApi}api/v1/message-request/${tutorFromMainData!.userId}");
//             await http.post(bookTimeSlotApi, headers: {
//               "Authorization": "bearer $loadUserTokenFromBox",
//               "lang": languageText,
//             }, body: {
//               "time_slot_id": tutorFromMainData!.timeSlots![index].id.toString(),
//             }).then((res) {
//               isBookLoading = false;
//               notifyListeners();
//               final result = json.decode(res.body) as Map<String, dynamic>;
//               showDialogBox(
//                   text: AppLocalizations.of(context)!.ok,
//                   message: result['msg'],
//                   context: context);
//             });
//           } else {
//             showDialogBox(
//                 text: AppLocalizations.of(context)!.cancel,
//                 message: AppLocalizations.of(context)!.you_must_sign_up_first,
//                 buttonWidget: ElevatedButtonWidget(
//                   radius: 7.0,
//                   text: AppLocalizations.of(context)!.sign_up,
//                   //textStyle: Themes.normal20(color: Colors.white),
//                   onPressed: () {
//                     Navigator.of(context)
//                         .pushNamedAndRemoveUntil('/sign', (route) => false);
//                   },
//                 ),
//                 context: context);
//           }
//         } catch (error) {
//           isBookLoading = false;
//           notifyListeners();
//           showDialogBox(
//               text: AppLocalizations.of(context)!.ok,
//               message: AppLocalizations.of(context)!.some_thing_went_wrong,
//               context: context);
//         }
//        }else{
//         showDialogToVerify(context);
//       }
//     } else {
//       snackBarForNoInternet(context);
//     }
//   }
//
// /////////////////////////////////////////////////////// add a review
//   String review = '';
//   double reviewRate = 5;
//   bool reviewLoading = false;
//   int? reviewId;
//   int? tutorIdToReviewFromChatRoom;
//   Future getTutorIdFromUserId() async {
//       Uri getTutorIdApi = Uri.parse("${baseApi}api/v1/user-tutor");
//
//       await http.post(getTutorIdApi,body:{
//         "user_id": userConversations[
//         conversationIndex!]
//             .recipientId.toString(),
//       }, headers: {
//         "Authorization":
//         "Bearer $loadUserTokenFromBox",
//         "lang": languageText,
//       }).then((res) {
//         final result = json.decode(res.body) as Map<String, dynamic>;
//           if (result['status'] == true) {
//             print("this is the tutor Id ${result['data']["tutor_id"]}");
//             tutorIdToReviewFromChatRoom = result['data']["tutor_id"];
//           }
//       });
// }
//
//   Future goToTutorFromChatRoom(context) async {
//     await getTutorIdFromUserId();
//     if(tutorIdToReviewFromChatRoom !=null)
//     goToTutorFromMainScreen(tutorIdToReviewFromChatRoom, context);
//   }
//
//
//   Future addReview({required BuildContext context, int? type}) async {
//     if (hasInternet == true) {
//       Uri addReviewApi = Uri.parse("${baseApi}api/v1/add-rating");
//       showDialog(
//           context: context,
//           builder: (BuildContext innerContext) {
//             return reviewLoading
//                 ? const Center(
//                     child: CircularProgressIndicator(color: Colors.white))
//                 : AlertDialog(
//                     // title: const Text("Make a review"),
//                     actions: [
//                       Center(
//                         child: RatingBar.builder(
//                           itemSize: 40,
//                           initialRating: reviewRate,
//                           unratedColor: grey.withOpacity(0.5),
//                           minRating: 1,
//                           direction: Axis.horizontal,
//                           allowHalfRating: false,
//                           itemCount: 5,
//                           ignoreGestures: reviewLoading,
//                           itemPadding:
//                               const EdgeInsets.only(top: 5, bottom: 15),
//                           itemBuilder: (context, _) => const Icon(
//                             Icons.star,
//                             color: yellow,
//                           ),
//                           onRatingUpdate: (rate) {
//                             reviewRate = rate;
//                           },
//                         ),
//                       ),
//                       Container(
//                         margin: EdgeInsets.symmetric(
//                             horizontal:
//                                 SizeConfig.getProportionateScreenWidth(15)),
//                         child: InputField(
//                           maxLength: 220,
//                           enabled: !reviewLoading,
//                           hint: AppLocalizations.of(context)!
//                               .write_your_review_here,
//                           keyboardType: TextInputType.text,
//                           validate: (value) {},
//                           onSaved: (value) {
//                             review = value;
//                           },
//                           textKey: "review",
//                           maxLines: 3,
//                         ),
//                       ),
//                       SizedBox(
//                           height: SizeConfig.getProportionateScreenHeight(10)),
//                       Container(
//                         margin: EdgeInsets.symmetric(
//                             horizontal:
//                                 SizeConfig.getProportionateScreenWidth(15)),
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [
//                             Expanded(
//                               child: ElevatedButtonWidget(
//                                 text: AppLocalizations.of(context)!.submit,
//                                 onPressed: () async {
//                                   if (hasInternet == true) {
//
//                                       reviewLoading = true;
//                                       notifyListeners();
//                                       if(type == 1) await getTutorIdFromUserId();
//
//                                       print("this is tutor id after method get tutorId ${tutorIdToReviewFromChatRoom}");
//                                       if(tutorIdToReviewFromChatRoom != null || type == null){
//                                         await http.post(addReviewApi, body: {
//                                           "rating": reviewRate.floor().toString(),
//                                           "comment": review,
//                                           if (type == null)
//                                             "tutor_id": tutorFromMainData!.tutorId
//                                                 .toString(),
//                                           if (type == 1)
//                                             "tutor_id": tutorIdToReviewFromChatRoom.toString(),
//                                         }, headers: {
//                                           "Authorization":
//                                           "Bearer $loadUserTokenFromBox",
//                                           "lang": languageText,
//                                         }).then((res) {
//                                           print("this is say addReviewApi in then");
//                                           final result = json.decode(res.body)
//                                           as Map<String, dynamic>;
//                                           Navigator.of(innerContext).pop();
//                                           showSnackBar(
//                                               message: result['msg'],
//                                               context: context);
//                                           reviewLoading = false;
//                                           notifyListeners();
//                                         });
//                                       }
//                                       try {} catch (error) {
//                                       reviewLoading = false;
//                                       notifyListeners();
//                                       throw error;
//                                       print(
//                                           "this is the review error : $error");
//                                       showDialogBox(
//                                           text:
//                                               AppLocalizations.of(context)!.ok,
//                                           message: AppLocalizations.of(context)!
//                                               .some_thing_went_wrong,
//                                           context: context);
//                                     }
//                                   } else {
//                                     snackBarForNoInternet(innerContext);
//                                   }
//                                 },
//                                 radius: 5.0,
//                               ),
//                             ),
//                             SizedBox(
//                                 width:
//                                     SizeConfig.getProportionateScreenWidth(15)),
//                             Expanded(
//                               child: ElevatedButtonWidget(
//                                 text: AppLocalizations.of(context)!.cancel,
//                                 onPressed: () =>
//                                     Navigator.of(innerContext).pop(),
//                                 radius: 5.0,
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                       SizedBox(
//                           height: SizeConfig.getProportionateScreenHeight(25))
//                     ],
//                   );
//           });
//     } else {
//       snackBarForNoInternet(context);
//     }
//   }
//
//   Future likeReview(
//       {required BuildContext context, required Rating rate}) async {
//     if (hasInternet == true) {
//       if (rate.liked == false) {
//         rate.liked = true;
//         notifyListeners();
//         try {
//           Uri likeApi = Uri.parse("${baseApi}api/v1/rating/${rate.id}/like");
//           await http.post(likeApi, headers: {
//             "Authorization": "Bearer $loadUserTokenFromBox",
//             "lang": languageText,
//           }).then((res) {
//             final result = json.decode(res.body) as Map<String, dynamic>;
//             if (result['is_authorized'] == false || result['status'] == false) {
//               rate.liked = false;
//               notifyListeners();
//             }
//           });
//         } catch (e) {
//           rate.liked = false;
//           notifyListeners();
//         }
//       } else if (rate.liked == true) {
//         rate.liked = false;
//         notifyListeners();
//         try {
//           Uri likeApi = Uri.parse("${baseApi}api/v1/rating/${rate.id}/like");
//           await http.post(likeApi, headers: {
//             "Authorization": "Bearer $loadUserTokenFromBox",
//             "lang": languageText,
//           }).then((res) {
//             final result = json.decode(res.body) as Map<String, dynamic>;
//             if (result['is_authorized'] == false || result['status'] == false) {
//               rate.liked = true;
//               notifyListeners();
//             }
//           });
//         } catch (e) {
//           rate.liked = true;
//           notifyListeners();
//         }
//       }
//     } else {
//       snackBarForNoInternet(context);
//     }
//   }
//
//   List<CommentReply> commentsOnReview = [];
//
//   String goToCommentsType = "";
//
//   commentOnAReview(
//       {required BuildContext context,
//       required int index,
//       required String type}) async {
//     try {
//       goToCommentsType = type;
//       if (type == 'fromMain' &&
//           tutorFromMainData!.ratings![index].commentReplies != null) {
//         commentsOnReview = [];
//         reviewId = tutorFromMainData!.ratings![index].id;
//         commentsOnReview = tutorFromMainData!.ratings![index].commentReplies!;
//         /*for(var element in tutorFromMainData!.ratings![index].commentReplies!){
//         commentsOnReview.add(element);
//       }*/
//       } else if (type == 'forProfile' &&
//           currentTutorUserData!.ratings![index].commentReplies != null) {
//         commentsOnReview = [];
//         reviewId = currentTutorUserData!.ratings![index].id;
//         commentsOnReview =
//             currentTutorUserData!.ratings![index].commentReplies!;
//       }
//       Navigator.of(context).pushNamed('/comments');
//     } catch (error) {
//       showDialogBox(
//           text: AppLocalizations.of(context)!.ok,
//           message: AppLocalizations.of(context)!.some_thing_went_wrong,
//           context: context);
//     }
//   }
//
//   bool sendCommentLoading = false;
//
//   Future sendComment(
//       TextEditingController sendCommentController, context) async {
//     if (hasInternet == true) {
//       try {
//         if (sendCommentController.text.trim() != '' && reviewId != null) {
//           sendCommentLoading = true;
//           notifyListeners();
//           Uri sendCommentApi =
//               Uri.parse("${baseApi}api/v1/rating/$reviewId/reply");
//
//           await http.post(sendCommentApi, body: {
//             "body": sendCommentController.text.trim(),
//           }, headers: {
//             "Authorization": "Bearer $loadUserTokenFromBox",
//             "lang": languageText,
//           }).then((res) {
//             final result = json.decode(res.body) as Map<String, dynamic>;
//             if (result['is_authorized'] == true) {
//               if (result['status'] == true) {
//                 commentsOnReview.add(CommentReply(
//                   image: currentTutorUserData!.image,
//                   reply: sendCommentController.text,
//                 ));
//                 sendCommentController.text = '';
//               }
//             }
//             sendCommentLoading = false;
//             notifyListeners();
//           });
//         }
//       } catch (e) {
//         showDialogBox(
//             text: AppLocalizations.of(context)!.ok,
//             message: AppLocalizations.of(context)!.some_thing_went_wrong,
//             context: context);
//         sendCommentLoading = false;
//         notifyListeners();
//       }
//     } else {
//       snackBarForNoInternet(context);
//     }
//   }
//
// ////////////////////////////////////////////////////// notifications
//   bool notificationLoading = false;
//
//   int? totalNotificationListPages;
//
//   List<UserNotification> userNotifications = [];
//   int currentNotificationListPage = 1;
//
//   bool notificationInternet = true;
//
//   bool notificationError = false;
//
//   Future getAllNotifications(context, {required bool isFirst}) async {
//     if (hasInternet == true) {
//       try {
//         notificationInternet = true;
//         notificationError = false;
//         if (isFirst &&
//             userNotifications != [] &&
//             userNotifications.isNotEmpty) {
//           notificationLoading = false;
//           //notificationLoading = true;
//           //currentNotificationListPage = 1;
//           //notifyListeners();
//         } else if (isFirst) {
//           notificationLoading = true;
//           currentNotificationListPage = 1;
//           unreadNotification = 0;
//         } else {
//           notificationLoading = false;
//           currentNotificationListPage++;
//           if (totalNotificationListPages != null &&
//               currentNotificationListPage > totalNotificationListPages!) {
//             isTopList = true;
//             notifyListeners();
//             print("this is the end");
//             return false;
//           }
//         }
//
//         Uri notificationApi = Uri.parse(
//             "${baseApi}api/v1/notifications?page=$currentNotificationListPage");
//         await http.get(notificationApi, headers: {
//           "Authorization": "bearer $loadUserTokenFromBox",
//           "lang": languageText,
//         }).then((res) {
//           final result = json.decode(res.body) as Map<String, dynamic>;
//           if (result['is_authorized'] == true) {
//             if (result['status'] == true) {
//               final List allNotificationsAsMap = result['data']['data'];
//               totalNotificationListPages =
//                   result['data']['pagination']['total_pages'];
//               for (var element in allNotificationsAsMap) {
//                 int isExist = userNotifications.indexWhere(
//                     (notification) => element['id'] == notification.id);
//                 if (isExist < 0) {
//                   userNotifications.add(UserNotification.fromJson(element));
//                 } else {
//                   for (var elementOfNotification in userNotifications) {
//                     if (element["id"] == elementOfNotification.id) {
//                       //elementOfNotification = element;
//                       if (element["buttons"] == null) {
//                         elementOfNotification.buttons = null;
//                       }
//                       elementOfNotification.createdAt = element["created_at"];
//                     }
//                   }
//                 }
//               }
//               unreadNotification = 0;
//               notificationLoading = false;
//               notifyListeners();
//             }
//           }
//         });
//         } catch (error) {
//         notificationError = true;
//         notifyListeners();
//         //showDialogBox(message: AppLocalizations.of(context)!.some_thing_went_wrong, context: context);
//       }
//     } else {
//       notificationError = true;
//       notificationInternet = false;
//     }
//   }
//
//   Future approve(context, index) async {
//     if (hasInternet == true) {
//       if (loadEmailVerifiedFromBox == true) {
//         try {
//           if (userNotifications != [] && userNotifications.isNotEmpty) {
//             if (tutorPlanInfo == null){
//               await renewApi();
//             }
//             if (tutorPlanInfo != null &&
//                 tutorPlanInfo!.days > 0 &&
//                 tutorPlanInfo!.remainingRequests > 0) {
//               Uri approveApi = Uri.parse(
//                   "${baseApi}api/v1/approve-message-request/${userNotifications[index].id}");
//               await http.post(approveApi, headers: {
//                 "Authorization": "bearer $loadUserTokenFromBox",
//                 "lang": languageText,
//               }).then((res) {
//                 final result = json.decode(res.body) as Map<String, dynamic>;
//                 if (result['is_authorized'] == true) {
//                   if (result['status'] == true) {
//                     userNotifications[index].buttons = null;
//                     notifyListeners();
//                     showDialogBox(
//                         text: AppLocalizations.of(context)!.start_chat_now,
//                         function: () =>
//                             DefaultTabController.of(context)!.animateTo(4),
//                         message: result['msg'],
//                         context: context);
//                   }
//                 }
//               });
//             } else if (tutorPlanInfo != null &&
//                 tutorPlanInfo!.days > 0 &&
//                 tutorPlanInfo!.remainingRequests <= 0) {
//               showDialogToRenew(
//                   context: context,
//                   text: AppLocalizations.of(context)!
//                       .you_have_reached_your_max_request_limit_upgrade_to_bigger_plan_to_continue);
//             } else if (tutorPlanInfo != null && tutorPlanInfo!.days <= 0) {
//               showDialogToRenew(
//                   context: context,
//                   text: AppLocalizations.of(context)!
//                       .your_trial_ended_please_subscribe_to_any_plan);
//             }
//           }
//         } catch (error) {
//           showDialogBox(
//               text: AppLocalizations.of(context)!.ok,
//               message: AppLocalizations.of(context)!.some_thing_went_wrong,
//               context: context);
//         }
//       } else {
//         showDialogToVerify(context);
//       }
//     } else {
//       snackBarForNoInternet(context);
//     }
//   }
//
//   Future decline(context, index) async {
//     if (hasInternet == true) {
//       if (loadEmailVerifiedFromBox == true) {
//         try {
//           if (userNotifications != [] && userNotifications.isNotEmpty) {
//             if (tutorPlanInfo == null){
//               await renewApi();
//             }
//             if (tutorPlanInfo != null &&
//                 tutorPlanInfo!.days > 0 &&
//                 tutorPlanInfo!.remainingRequests > 0) {
//               Uri approveApi = Uri.parse(
//                   "${baseApi}api/v1/decline-message-request/${userNotifications[index].id}");
//               await http.post(approveApi, headers: {
//                 "Authorization": "bearer $loadUserTokenFromBox",
//                 "lang": languageText,
//               }).then((res) {
//                 final result = json.decode(res.body) as Map<String, dynamic>;
//                 if (result['is_authorized'] == true) {
//                   if (result['status'] == true) {
//                     userNotifications[index].buttons = null;
//                     notifyListeners();
//                     showDialogBox(
//                         text: AppLocalizations.of(context)!.ok,
//                         message: result['msg'],
//                         context: context);
//                   }
//                 }
//               });
//             } else if (tutorPlanInfo != null &&
//                 tutorPlanInfo!.days > 0 &&
//                 tutorPlanInfo!.remainingRequests <= 0) {
//               showDialogToRenew(
//                   context: context,
//                   text: AppLocalizations.of(context)!
//                       .you_have_reached_your_max_request_limit_upgrade_to_bigger_plan_to_continue);
//             } else if (tutorPlanInfo != null && tutorPlanInfo!.days <= 0) {
//               showDialogToRenew(
//                   context: context,
//                   text: AppLocalizations.of(context)!
//                       .your_trial_ended_please_subscribe_to_any_plan);
//             }
//           }
//         } catch (error) {
//           showDialogBox(
//               text: AppLocalizations.of(context)!.ok,
//               message: AppLocalizations.of(context)!.some_thing_went_wrong,
//               context: context);
//         }
//       } else {
//         showDialogToVerify(context);
//       }
//
//
//     } else {
//       snackBarForNoInternet(context);
//     }
//   }
//
// //////////////////////////////////////////////////////////// chat
//
//   int? totalConversationListPages;
//
//   List<Conversation> userConversations = [];
//   int currentConversationListPage = 1;
//
//   bool getAllConversationLoading = false;
//
//   bool conversationInternet = true;
//
//   bool conversationError = false;
//   List<Map<String,String>> lastMassagesForBox = [];
//   /*late SharedPreferences prefs;
//   initPrefs() async{
//      prefs = await SharedPreferences.getInstance();
//   }*/
//   Future getAllConversations(context, {bool isFirst = true}) async {
//     if (hasInternet == true) {
//       try {
//         //isInChatScreen = true;
//         conversationInternet = true;
//         conversationError = false;
//         if (isFirst &&
//             userConversations != [] &&
//             userConversations.isNotEmpty) {
//           getAllConversationLoading = false;
//           //currentConversationListPage = 1;
//         } else if (isFirst) {
//           getAllConversationLoading = true;
//           currentConversationListPage = 1;
//         } else {
//           currentConversationListPage++;
//           if (totalConversationListPages != null &&
//               currentConversationListPage > totalConversationListPages!) {
//             isTopList = true;
//             notifyListeners();
//             print("this is the end");
//           }
//         }
//
//         Uri conversationApi = Uri.parse(
//             "${baseApi}api/v1/conversations?page=$currentConversationListPage");
//         await http.get(conversationApi, headers: {
//           "Authorization": "bearer $loadUserTokenFromBox",
//           "lang": languageText,
//         }).then((res) {
//           final result = json.decode(res.body) as Map<String, dynamic>;
//           if (result['is_authorized'] == true) {
//             if (result['status'] == true) {
//               final List allConversationsAsMap = result['data']['data'];
//               totalConversationListPages = result['data']['total'];
//               for (var element in allConversationsAsMap) {
//                 var isExist = userConversations.indexWhere(
//                     (conversation) => element['id'] == conversation.id);
//                 if (isExist < 0) {
//                   userConversations.add(Conversation.fromJson(element));
//                   lastMassagesForBox.add({
//                     "id":element["id"].toString(),
//                     "last_message":element["last_message"]
//                   });
//
//                 } else {
//                   for (var elementOfConversation in userConversations) {
//                     if (element["id"] == elementOfConversation.id) {
//                       //elementOfConversation = element;  not working like class Conversation = Map<S,d>
//                       print(
//                           'elementOfConversation.lastMessageDate ${elementOfConversation.lastMessageDate}');
//                       elementOfConversation.lastMessageDate =
//                           element["last_message_date"];
//                       print(
//                           'element["last_message_date"] ${elementOfConversation.lastMessageDate}');
//                     }
//                   }
//                 }
//               }
//               // saveLastMassages(lastMassagesForBox);
//               //
//               // for(var element in loadLastMassagesFromBox){
//               //   print("this is while allConversationsAsMap saveLastMassages $element");
//               //
//               // }
//               unreadConversation = 0;
//               getAllConversationLoading = false;
//               notifyListeners();
//             }
//           }
//         });
//         } catch (error) {
//         //throw error;
//         conversationError = true;
//         notifyListeners();
//       }
//     } else {
//       conversationError = true;
//       conversationInternet = false;
//     }
//   }
//
//
// /// not used
// /*
// saveLastMessageRoomDispose({required Message lastUserMessages, required int index}){
//     print("This is last user masseges when room dispose userMessages[0].message: ${lastUserMessages.message} ,,, userConversations[conversationIndex!].id: ${userConversations[index].id}");
//
//     for (var one in userConversations) {
//       if(loadLastMassagesFromBox.contains({
//         "id" : one.id.toString(),
//         "last_message": one.lastMessage
//       })){
//
//         List<Map<String,String>> allMassages = loadLastMassagesFromBox;
//         if(allMassages.elementAt(allMassages.indexOf({
//           "id" : one.id.toString(),
//           "last_message": one.lastMessage
//         }))["last_message"] !=  lastUserMessages.message){
//           allMassages.elementAt(allMassages.indexOf({
//             "id" : one.id.toString(),
//             "last_message": one.lastMessage
//           }))["last_message"] =  lastUserMessages.message;
//           saveLastMassages(allMassages);
//         }
//
//         int isExist = loadLastMassagesFromBox.indexWhere((element) {
//           bool isExist =
//               element["id"].toString() == one.id.toString();
//           if(isExist){
//
//           }else{
//             List<Map<String,String>> allMassages = loadLastMassagesFromBox;
//             allMassages.add(element);
//             saveLastMassages(allMassages);
//           }
//
//           return isExist;
//         });
//       }
//
//
//     }
//
//
//
//   }
// */
//
//
//  // chatNowButton(int index){
//  //   if (userNotifications[index].buttons != null &&
//  //        userNotifications[index]
//  //            .buttons![0]
//  //            .endpoint
//  //            .contains("conversation")) {
//  //
//  //    String conversationId = userNotifications[index].buttons![0].endpoint.split("conversation/")[1];
//  //    conversationId = conversationId.split("/messages")[0];
//  //    print ("this is conversationId $conversationId");
//  //   }
//  //  }
//
//
//   int? conversationIndex;
//
//   goingToRoom(context, index) async{
//     if(loadRoleFromBox == "tutor"){
//       try {
//           if (tutorPlanInfo == null){
//             await renewApi();
//           }
//           if (tutorPlanInfo != null &&
//               tutorPlanInfo!.days > 0 &&
//               tutorPlanInfo!.remainingRequests > 0) {
//
//             conversationIndex = index;
//             sendMessageLoading = false;
//             // if(userMessages.isNotEmpty){
//             //   saveLastMessageRoomDispose(index:index,lastUserMessages:userMessages[0]);
//             // }
//             userMessages = [];
//             currentMessagesListPage = 1;
//             Navigator.of(context).push(MaterialPageRoute(builder: (ctx)=> ConversationRoomScreen()));
//             getAllConversationMessages(index, context);
//
//
//           } else if (tutorPlanInfo != null &&
//               tutorPlanInfo!.days > 0 &&
//               tutorPlanInfo!.remainingRequests <= 0) {
//             showDialogToRenew(
//                 context: context,
//                 text: AppLocalizations.of(context)!
//                     .you_have_reached_your_max_request_limit_upgrade_to_bigger_plan_to_continue);
//           } else if (tutorPlanInfo != null && tutorPlanInfo!.days <= 0) {
//             showDialogToRenew(
//                 context: context,
//                 text: AppLocalizations.of(context)!
//                     .your_trial_ended_please_subscribe_to_any_plan);
//           }
//       } catch (error) {
//         showDialogBox(
//             text: AppLocalizations.of(context)!.ok,
//             message: AppLocalizations.of(context)!.some_thing_went_wrong,
//             context: context);
//       }
//
//     } else{
//       conversationIndex = index;
//       sendMessageLoading = false;
//       // if(userMessages.isNotEmpty){
//       //   saveLastMessageRoomDispose(index:index,lastUserMessages:userMessages[0]);
//       // }
//       userMessages = [];
//       currentMessagesListPage = 1;
//       Navigator.of(context).push(MaterialPageRoute(builder: (ctx)=> ConversationRoomScreen()));
//       getAllConversationMessages(index, context);
//     }
//     // if(userConversations[index].recipientId != null && userConversations[index].conversationId != null){  }
//   }
//   bool isInChatScreen = false;
//
//   int newMessages = 0;
//   int newNotifications = 0;
//
//   getAMessage(Map<String, dynamic> totalResult) {
//     var messageDetails = json.decode(totalResult["0"]) as Map<String, dynamic>;
//     print("before if (userConversations != [] && userConversations.isNotEmpty) ");
//     if (userConversations != [] && userConversations.isNotEmpty) {
//       print("after if (userConversations != [] && userConversations.isNotEmpty) ");
//
//       for (var element in userConversations) {
//         if (element.id ==
//             int.parse(totalResult['conversation_id'].toString())) {
//           element.lastMessage = messageDetails['message'];
//           element.lastMessageDate = messageDetails['sent_at'];
//           element.isSeen = 0;
//           int index = userConversations.indexOf(element);
//           if (userMessages != [] &&
//               userConversations[index].id ==
//                   int.parse(totalResult['conversation_id'].toString())) {
//             userMessages.insert(0, Message.fromJson(messageDetails));
//           }
//           for (var i = index; i > 0; i--) {
//             var x = userConversations[i];
//             userConversations[i] = userConversations[i - 1];
//             userConversations[i - 1] = x;
//           }
//         }
//       }
//     }
//     unreadConversation += 1;
//     notifyListeners();
//     //if(isInChatScreen){print("isInChatScreen $isInChatScreen");}
//   }
//   getANotificationCountUp(){
//     unreadNotification += 1;
//     notifyListeners();
//   }
//
//   bool sendMessageLoading = false;
//
//   Future sendMessage(
//       TextEditingController sendMessageController, context) async {
//     if (hasInternet == true) {
//       if (sendMessageController.text.trim() != '') {
//         sendMessageLoading = true;
//         sendMessageController.buildTextSpan(context: context, withComposing: true);
//         notifyListeners();
//         Uri sendMessageApi = Uri.parse(
//             "${baseApi}api/v1/send-message/${userConversations[conversationIndex!].recipientId}");
//         await http.post(sendMessageApi, body: {
//           "content": sendMessageController.text,
//           "conversation_id":
//               userConversations[conversationIndex!].id.toString(),
//         }, headers: {
//           "Authorization": "bearer $loadUserTokenFromBox",
//           "lang": languageText,
//         }).then((res) {
//           final result = json.decode(res.body) as Map<String, dynamic>;
//           if (result['is_authorized'] == true) {
//             if (result['status'] == true) {
//               sendMessageController.text = '';
//
//               userMessages.insert(0, Message.fromJson(result['data']));
//               userConversations[conversationIndex!].lastMessage =
//                   result['data']['message'];
//               userConversations[conversationIndex!].lastMessageDate =
//                   result['data']['sent_at'];
//
//               for (var i = conversationIndex!; i > 0; i--) {
//                 print("conversationIndex $conversationIndex");
//                 var x = userConversations[i];
//                 userConversations[i] = userConversations[i - 1];
//                 userConversations[i - 1] = x;
//               }
//               conversationIndex = 0;
//
//             }
//           }
//           sendMessageLoading = false;
//           notifyListeners();
//           print(
//               "final result = json.decode(res.body) as Map<String, dynamic>; $result");
//         });
//       }
//     } else {
//       snackBarForNoInternet(context);
//     }
//   }
//
//   int? totalMessagesListPages;
//
//   List<Message> userMessages = [];
//   int currentMessagesListPage = 1;
//
//   bool getMassagesLoading = false;
//
//   getAllConversationMessages(index, context, {bool isFirst = true}) async {
//     if (hasInternet == true) {
//       try {
//         if (isFirst) {
//           getMassagesLoading = true;
//           notifyListeners();
//           currentMessagesListPage = 1;
//         } else {
//           getMassagesLoading = false;
//           currentMessagesListPage++;
//           if (totalMessagesListPages != null &&
//               currentMessagesListPage > totalMessagesListPages!) {
//             isTopList = true;
//             notifyListeners();
//             print("this is the end");
//             return false;
//           }
//         }
//         Uri conversationApi = Uri.parse(
//             "${baseApi}api/v1/conversation/${userConversations[index].id}/messages?page=$currentMessagesListPage");
//         await http.get(conversationApi, headers: {
//           "Authorization": "bearer $loadUserTokenFromBox",
//           "lang": languageText,
//         }).then((res) {
//           final result = json.decode(res.body) as Map<String, dynamic>;
//           if (result['is_authorized'] == true) {
//             if (result['status'] == true) {
//               final List allMessagesAsMap = result['data']['data'];
//               totalMessagesListPages = result['data']['total'];
//               for (var element in allMessagesAsMap) {
//                 var isExist = userMessages
//                     .indexWhere((message) => element['id'] == message.id);
//                 if (isExist < 0) {
//                   userMessages.add(Message.fromJson(element));
//                 }
//               }
//               userConversations[index].isSeen = 1;
//               getMassagesLoading = false;
//               notifyListeners();
//             }
//           }
//         });
//       } catch (error) {
//         showDialogBox(
//             text: AppLocalizations.of(context)!.ok,
//             message: AppLocalizations.of(context)!.some_thing_went_wrong,
//             context: context);
//       }
//     } else {
//       Navigator.of(context).pop();
//     }
//   }
//
//   Future panUser(BuildContext context) async {
//     if (hasInternet == true) {
//       try {
//         Uri panApi = Uri.parse(
//             "${baseApi}api/v1/report-conversation/$conversationIndex");
//         await http.post(panApi, headers: {
//           "Authorization": "Bearer $loadUserTokenFromBox",
//           "lang": languageText,
//         }, body: {
//           "report_type": "verbal abuse"
//         }).then((res) {
//           final result = json.decode(res.body) as Map<String, dynamic>;
//           showSnackBar(message: result['msg'], context: context);
//         });
//       } catch (error) {
//         debugPrint("this is the error : $error");
//         showDialogBox(
//             text: AppLocalizations.of(context)!.ok,
//             message: AppLocalizations.of(context)!.some_thing_went_wrong,
//             context: context);
//       }
//     } else {
//       snackBarForNoInternet(context);
//     }
//   }
//
//   ///////////////////////////////////////////////////////////////////////// searching
//   bool searchLoading = false;
//   String searchWord = '';
//   String commentWord = '';
//
//   onSavedSearch({newValue, type}) {
//     if (type == 'search') {
//       searchWord = newValue;
//       notifyListeners();
//     } else if (type == 'comments') {
//       commentWord = newValue;
//     }
//     /*if (type == "summit") {
//       searchWord = newValue;
//       print("searchWord $searchWord");
//       search(context, true);
//     } else if (type == "change") {
//       searchWord = newValue;
//       print("searchWord $searchWord");
//     }*/
//   }
//
//   List<Tutor> searchList = [];
//   int currentSearchListPage = 1;
//   int? totalSearchListPages;
//
// // onClearSearch(){
// //   searchList = null;
// //   filterLoading = false;
// // }
//   bool isTopList = true;
//
//   listenScrolling(context, controller, type) {
//     searchWord = '';
//     if (controller != null) {
//       controller.addListener(() {
//         if (controller.position.atEdge) {
//           final isTop = controller.position.pixels == 0;
//           if (!isTop) {
//             isTopList = true;
//             if (type == 'search') {
//               search(context, false);
//             } else if (type == 'notification') {
//               getAllNotifications(context, isFirst: false);
//             } else if (type == 'chat') {
//               getAllConversations(context, isFirst: false);
//             } else if (type == 'room') {
//               getAllConversationMessages(conversationIndex, context,
//                   isFirst: false);
//             } else if (type == 'comments') {
//               ///
//             }
//             isTopList = false;
//           }
//           notifyListeners();
//         }
//       });
//     }
//   }
//
//   String wordNotFound = '';
//
//   bool isSearchPressed = false;
//
//   Future search(context, isFirst) async {
//     if (hasInternet == true) {
//       searchLoading = true;
//       isSearchPressed = true;
//       if (isFirst) {
//         searchList = [];
//         currentSearchListPage = 1;
//         isTopList = false;
//       } else {
//         searchLoading = false;
//         currentSearchListPage++;
//         isTopList = false;
//         if (totalSearchListPages != null &&
//             currentSearchListPage > totalSearchListPages!) {
//           isTopList = true;
//           print("this is the end");
//           return false;
//         }
//       }
//       Uri searchApi = Uri.parse(
//           "${baseApi}api/v1/search-tutors?page=$currentSearchListPage");
//       if (searchWord.trim() != '') {
//         try {
//           wordNotFound = searchWord;
//           await http.post(searchApi, body: {
//             "search_query": searchWord
//           }, headers: {
//             "lang": languageText,
//           }).then((res) {
//             final result = json.decode(res.body) as Map<String, dynamic>;
//             if (result['is_authorized'] == true) {
//               if (result['status'] == true) {
//                 final List allSearchAsMap = result['data']['data'];
//                 totalSearchListPages =
//                     result['data']['pagination']['total_pages'];
//                 print(allSearchAsMap);
//
//                 if (allSearchAsMap.isNotEmpty) {
//                   isSearchPressed = false;
//                   //notifyListeners();
//                 }
//                 for (var element in allSearchAsMap) {
//                   searchList.add(Tutor.fromJson(element, false));
//                   print("searchList ${searchList.length}");
//                 }
//               }
//             }
//           });
//           searchLoading = false;
//         } catch (error) {
//           showDialogBox(
//               text: AppLocalizations.of(context)!.ok,
//               message: AppLocalizations.of(context)!.some_thing_went_wrong,
//               context: context);
//         }
//       } else {
//         showSnackBar(
//             message:
//                 AppLocalizations.of(context)!.write_something_in_the_search_box,
//             context: context);
//       }
//     } else {
//       snackBarForNoInternet(context);
//     }
//     notifyListeners();
//   }
//
//   bool filterLoading = false;
//   bool isFiltered = false;
//   List<Tutor> findATutorList = [];
//
//   goToHome(context) {
//     isFiltered = false;
//     Navigator.of(context).pushNamedAndRemoveUntil('/home', (route) => false);
//   }
//
//   Future filter(context) async {
//     if (hasInternet == true) {
//       filterLoading = true;
//       Uri filterApi = Uri.parse("${baseApi}api/v1/filter-tutors");
//       if (selectedCountryId != 0 ||
//           selectedCityId != 0 ||
//           selectedSkill !=
//               AppLocalizations.of(context)!.select_a_specialization ||
//           selectedHourlyRate == AppLocalizations.of(context)!.low_to_high ||
//           selectedHourlyRate == AppLocalizations.of(context)!.high_to_low) {
//         await http.post(filterApi, body: {
//           if (selectedCountryId != 0) "country_id": "$selectedCountryId",
//           if (selectedCityId != 0) "city_id": "$selectedCityId",
//           if (selectedSkill !=
//               AppLocalizations.of(context)!.select_a_specialization)
//             "skill": selectedSkill,
//           if (selectedHourlyRate == AppLocalizations.of(context)!.low_to_high)
//             "hourly_rate": 'low',
//           if (selectedHourlyRate == AppLocalizations.of(context)!.high_to_low)
//             "hourly_rate": 'high'
//         }, headers: {
//           "lang": languageText,
//         }).then((res) {
//           findATutorList = [];
//           final result = json.decode(res.body) as Map<String, dynamic>;
//           if (result['is_authorized'] == true) {
//             if (result['status'] == true) {
//               final List allMainTutorsAsMap = result['data']['data'];
//               for (var element in allMainTutorsAsMap) {
//                 findATutorList.add(Tutor.fromJson(element, false));
//               }
//               if (findATutorList == [] || findATutorList.isEmpty) {
//                 Navigator.of(context)
//                     .push(MaterialPageRoute(builder: (BuildContext context) {
//                   return Scaffold(
//                     appBar: AppBar(
//                       backgroundColor: Colors.white,
//                       centerTitle: true,
//                       elevation: 5,
//                       title:
//                           Image.asset('assets/images/red logo.png', width: 100),
//                       leading: IconButton(
//                           onPressed: () {
//                             Navigator.of(context).pop();
//                           },
//                           icon: const Icon(
//                             Icons.arrow_back_ios,
//                             color: grey,
//                           )),
//                     ),
//                     body: Container(
//                       alignment: Alignment.center,
//                       child: Column(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           Image.asset("assets/images/no result.png",
//                               width: 136),
//                           SizedBox(height: 50),
//                           Padding(
//                             padding:
//                                 const EdgeInsets.symmetric(horizontal: 20.0),
//                             child: Text(
//                               AppLocalizations.of(context)!
//                                   .we_could_not_find_any_results_matching_this_criteria,
//                               style: Themes.medium22(color: red),
//                               textAlign: TextAlign.center,
//                             ),
//                           )
//                         ],
//                       ),
//                     ),
//                   );
//                 }));
//               } else {
//                 allMainTutors = findATutorList;
//                 isFiltered = true;
//                 notifyListeners();
//                 Navigator.of(context).pushNamed('/main');
//                 //.pushNamedAndRemoveUntil('/main', (route) => false);
//               }
//             }
//           }
//         });
//         filterLoading = false;
//       }
//     } else {
//       snackBarForNoInternet(context);
//     }
//   }
//
//   ////////////////////////////////////////////////////// switchAuthMode ,switchVisibility, imagePick ,Video
//   void switchAuthMode() {
//     if (authMode == 'Login') {
//       authMode = 'Sign Up';
//       notifyListeners();
//     } else {
//       authMode = 'Login';
//       notifyListeners();
//     }
//   }
//
//   bool isVisible = false;
//   bool isSecured = false;
//
//   void switchVisibility() {
//     isVisible = !isVisible;
//     isSecured = !isSecured;
//     print("switchVisibility isVisible: $isVisible ,, isSecured: $isSecured");
//     notifyListeners();
//   }
//
//   File? pickedProfileImage;
//   final ImagePicker _picker = ImagePicker();
//
//   /// to pick single image from gallery
//   Future<File?> imagePick(
//       {required bool isGallery,
//       required Future<File?> Function(File file) cropImage}) async {
//     final XFile? pickedImageFile = isGallery
//         ? await _picker.pickImage(source: ImageSource.gallery,imageQuality: 50)
//         : await _picker.pickImage(source: ImageSource.camera);
//
//     if (pickedImageFile == null) return null;
//
//     // if (cropImage == null) {
//     //   return File(pickedImageFile.path);
//     // } else {}
//     return cropImage(File(pickedImageFile.path));
//   }
//
//   Future onClickToGetImage({required bool isGallery}) async {
//     final file =
//         await imagePick(isGallery: isGallery, cropImage: cropSquareImage);
//     if (file == null) return;
//     pickedProfileImage = file;
//     notifyListeners();
//   }
//
//   Future<File?> cropSquareImage(File imageFile) async {
//     ImageCropper imageCropper = ImageCropper();
//     return await imageCropper.cropImage(
//         sourcePath: imageFile.path,
//         aspectRatio: const CropAspectRatio(ratioX: 1, ratioY: 1),
//         aspectRatioPresets: [CropAspectRatioPreset.square]);
//   }
//
//   VideoPlayerController? videoPlayerController;
//   File? pickedProfileVideo;
//   File? pickedAnotherProfileVideo;
//
//   Future<File?> pickProfileVideoFile() async {
//     final FilePickerResult? pickedVideo =
//         await FilePicker.platform.pickFiles(type: FileType.video);
//     if (pickedVideo == null) return null;
//     print("this is vedio lenth ${pickedVideo.files.length}");
//     //final FlutterFFmpeg _flutterFFmpeg = new FlutterFFmpeg();
//     //_flutterFFmpeg.execute("-ss 00:00:00 -i ${pickedVideo.files.single.path!} -to 00:01:00 -c copy output.mp4").then((rc) => print("FFmpeg process exited with rc $rc"));
//     print("pickedVideo.files.single.size ${pickedVideo.files.single}");
//     return File(pickedVideo.files.single.path!);
//   }
//
//   Future onClickToGetVideo(context) async {
//     final File? file = await pickProfileVideoFile();
//     if (file == null) return;
//     int videoLength = await file.length();
//
//     if (videoLength <= 250000001) {
//       pickedProfileVideo = file;
//     } else {
//       showSnackBar(
//           message:
//               AppLocalizations.of(context)!.your_video_must_be_20MB_maximum,
//           context: context);
//     }
//   }
//
//   ////////////////////////////////////////////////////////////////////////// payment Methods
//   List<Plan> allPlans = [];
//
//   bool isLoadPlan = false;
//
//   bool planInternet = true;
//
//   bool planError = false;
//
//   Future getAllPaymentPlans() async {
//     if (hasInternet == true) {
//       planInternet = true;
//       planError = false;
//
//       isLoadPlan = true;
//       Uri paymentPlansApi = Uri.parse("${baseApi}api/v1/plans");
//       try {
//         await http.get(paymentPlansApi, headers: {
//           "lang": languageText,
//         }).then((res) {
//           final result = json.decode(res.body) as Map<String, dynamic>;
//           print("res.bod ${res.body}");
//           if (result['is_authorized'] == true) {
//             if (result['status'] == true) {
//               final List allPaymentPlansAsMap = result['data'];
//               for (var element in allPaymentPlansAsMap) {
//                 var isExist =
//                     allPlans.indexWhere((plan) => element['id'] == plan.id);
//                 print("this is isExist $isExist");
//                 if (isExist < 0) {
//                   allPlans.add(Plan.fromJson(element));
//                 }
//               }
//               isLoadPlan = false;
//               notifyListeners();
//             }
//           }
//         });
//       } catch (error) {
//         planError = true;
//         notifyListeners();
//       }
//     } else {
//       planError = true;
//       planInternet = false;
//     }
//   }
//
//   int selectedPaymentPlanPageIndex = 1;
//
//   onPaymentPlanChanged({required int index}) {
//     selectedPaymentPlanPageIndex = index;
//     notifyListeners();
//   }
//
//   String? paymentUrl;
//   bool paymentLoading = false;
//   Future onPaymentMethodSelected(
//       {required BuildContext context, required int index}) async {
//     if (hasInternet == true) {
//       Navigator.of(context).pushNamed("/mobile");
//       if (index == 0) {
//         print('Mastercard');
//       } else if (index == 1) {
//         print('fawry');
//       } else if (index == 2) {
//         print('cash');
//       } else if (index == 3) {
//         print('visa');
//       } else if (index == 4) {
//         print('CIB');
//       } else if (index == 5) {
//         print('paypal');
//       }
//     } else {
//       snackBarForNoInternet(context);
//     }
//   }
//
//   Future checkoutMethod({required BuildContext context}) async{
//     if (hasInternet == true) {
//       print("this is the mobile number $mobile");
//       paymentLoading = true;
//     notifyListeners();
//     Uri paymentUrlApi = Uri.parse("${baseApi}api/v1/checkout");
//     await http.post(paymentUrlApi, body: {
//       "plan_id": allPlans[selectedPaymentPlanPageIndex].id.toString(),
//       "mobile": mobile,
//     }, headers: {
//       "Authorization": "Bearer $loadUserTokenFromBox",
//       "lang": languageText,
//     }).then((res) {
//       print("checkoutMethod ${res.body}");
//       final result = json.decode(res.body) as Map<String, dynamic>;
//       if (result['is_authorized'] == true) {
//         if (result['status'] == true) {
//           paymentUrl = result['data'];
//           if (paymentUrl != null && paymentUrl != '') {
//             Navigator.of(context).pushNamed('/web_view');
//           }
//         }
//       }
//     });
//     } else {
//       snackBarForNoInternet(context);
//     }
//   }
//   String paymentDoneMsg = '';
//   bool isPaymentDone = false;
//
//   paymentWebViewInit() {
//     isPaymentDone = false;
//     paymentDoneMsg = '';
//     paymentLoading = false;
//   }
//
//   onlinePayment({required String newUrl, required BuildContext context}) async {
//     isPaymentDone = true;
//     notifyListeners();
//     if (newUrl.split('success=')[1].split('&')[0] == "true") {
//       print(
//           "newUrl.split('merchant_order_id=')[1].split('&')[0]  ${newUrl.split('merchant_order_id=')[1].split('&')[0]}");
//       Uri paymentSucceededApi = Uri.parse("${baseApi}api/v1/payment-succeeded");
//       await http.post(paymentSucceededApi, body: {
//         "merchant_order_id":
//             newUrl.split('customerReference=')[1].split('&')[0],
//       }, headers: {
//         "Authorization": "bearer $loadUserTokenFromBox",
//         "lang": languageText,
//       }).then((res) async{
//         final result = json.decode(res.body) as Map<String, dynamic>;
//         showSimpleNotification(
//             Text(AppLocalizations.of(context)!
//                 .congratulations_you_have_successfully_subscribed_to_the_months_plan(
//                 allPlans[selectedPaymentPlanPageIndex].noOfMonths == 1
//                     ? AppLocalizations.of(context)!.monthly_plan
//                     : allPlans[selectedPaymentPlanPageIndex].noOfMonths == 6
//                     ? AppLocalizations.of(context)!.six_months_Plan:
//                 allPlans[selectedPaymentPlanPageIndex].noOfMonths == 12?
//                 AppLocalizations.of(context)!.annual_plan:
//                 allPlans[selectedPaymentPlanPageIndex].noOfMonths.toString()),
//               style: Themes.medium16(color: Colors.black),
//               overflow: TextOverflow.ellipsis,
//             ),
//             elevation: 0,
//             background: yellow,
//             slideDismissDirection: DismissDirection.horizontal,
//             duration: const Duration(seconds: 30));
//         await renewApi().then((_){
//           if(tutorPlanInfo != null && tutorPlanInfo!.days != 0){
//             Navigator.of(context).pushReplacementNamed("/current_plan");
//           }else{
//             Navigator.of(context).pop();
//           }
//         });
//         paymentDoneMsg = result['msg'];
//         print(" paymentDoneMsg $paymentDoneMsg");
//         notifyListeners();
//       });
//     } else if (newUrl.split('success=')[1].split('&')[0] == "false") {
//       print(
//           "newUrl.split('success=')[1].split('&')[0]  ${newUrl.split('success=')[1].split('&')[0] == "false"}");
//
//       Uri paymentFailedApi = Uri.parse("${baseApi}api/v1/payment-failed");
//       await http.post(paymentFailedApi, headers: {
//         "Authorization": "bearer $loadUserTokenFromBox",
//         "lang": languageText,
//       }).then((res) {
//         final result = json.decode(res.body) as Map<String, dynamic>;
//         Navigator.of(context).pop();
//         paymentDoneMsg = result['msg'];
//         showSimpleNotification(
//             Text(paymentDoneMsg,
//               style: Themes.medium16(color: Colors.black),
//               overflow: TextOverflow.ellipsis,
//             ),
//             elevation: 0,
//             background: yellow,
//             slideDismissDirection: DismissDirection.horizontal,
//             duration: const Duration(seconds: 30));
//         print(" paymentDoneMsg $paymentDoneMsg");
//         notifyListeners();
//       });
//     }
//   }
//
//   //////////////////////////////////////////////////////////////////////////////////
//   bool verifyTutorLoading = false;
//   final String _verificationTutorKey = "verificationTutorKey";
//   saveVerificationTutorToBox(bool isFirstRequest) => _box.write(_verificationTutorKey, isFirstRequest);
//
//   bool loadVerificationTutorFromBox() => _box.read(_verificationTutorKey) ?? false;
//
//   Future verifyTutorFromTutors(BuildContext context) async {
//     if (hasInternet == true) {
//       try {
//         verifyTutorLoading = true;
//         notifyListeners();
//         Uri verifyTutorApi = Uri.parse(
//             "${baseApi}api/v1/verification-request/${currentTutorUserData!.tutorId}");
//         await http.post(verifyTutorApi, headers: {
//           "Authorization": "Bearer $loadUserTokenFromBox",
//           "lang": languageText,
//         }).then((res) {
//           verifyTutorLoading = false;
//           notifyListeners();
//           final result =
//           json.decode(res.body) as Map<String, dynamic>;
//           if(result["status"] == true){
//             saveVerificationTutorToBox(true);
//             showDialog(
//               context: context,
//               barrierDismissible: true,
//               builder: (BuildContext innerContext) {
//                 return AlertDialog(
//                   title: Text(
//                     AppLocalizations.of(context)!.your_request_has_been_received_and_is_being_reviewed_by_our_support_staff_You_will_receive_a_response_from_30_to_45_days,
//                     textAlign: TextAlign.left,
//                     style: Themes.normal16(),
//                   ),
//                   actions: [
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                       children: [
//                         ElevatedButtonWidget(
//                           text: AppLocalizations.of(context)!.ok,
//                           radius: 7,
//                           textStyle: Themes.normal15(),
//                           onPressed: () => Navigator.of(innerContext).pop(),
//                           //{ if(dismiss == false) Navigator.of(context).pop();},
//                         ),
//                       ],
//                     ),
//                   ],
//                 );
//               },
//             );
//           }
//         });
//
//       } catch (error) {
//         verifyTutorLoading = false;
//         notifyListeners();
//         showDialogBox(
//             text: AppLocalizations.of(context)!.ok,
//             message: AppLocalizations.of(context)!.some_thing_went_wrong,
//             context: context);
//       }
//     } else {
//       snackBarForNoInternet(context);
//     }
//   }
//
//   showDialogToVerify(context) {
//     showDialog(
//       context: context,
//       barrierDismissible: true,
//       builder: (BuildContext innerContext) {
//         return AlertDialog(
//           title: Text(
//             AppLocalizations.of(context)!.you_need_to_verify_your_email_first,
//             textAlign: TextAlign.left,
//             style: Themes.normal16(),
//           ),
//           actions: [
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               children: [
//                 ElevatedButtonWidget(
//                   text: AppLocalizations.of(context)!.verify,
//                   radius: 7,
//                   textStyle: Themes.normal15(),
//                   onPressed: () async {
//                     emailToBeVerified = null;
//                     Navigator.of(innerContext).pushReplacementNamed("/verify");
//                   },
//                   //{ if(dismiss == false) Navigator.of(context).pop();},
//                 ),
//                 ElevatedButtonWidget(
//                   text: AppLocalizations.of(context)!.cancel,
//                   radius: 7,
//                   textStyle: Themes.normal15(),
//                   onPressed: () => Navigator.of(innerContext).pop(),
//                   //{ if(dismiss == false) Navigator.of(context).pop();},
//                 ),
//               ],
//             ),
//           ],
//         );
//       },
//     );
//   }
//   showDialogToRenew({context, text}) {
//     showDialog(
//       context: context,
//       barrierDismissible: true,
//       builder: (BuildContext innerContext) {
//         return AlertDialog(
//           title: Text(text,
//             textAlign: TextAlign.left,
//             style: Themes.normal16(),
//           ),
//           actions: [
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               children: [
//                 ElevatedButtonWidget(
//                   text: AppLocalizations.of(context)!.renew_now,
//                   radius: 7,
//                   textStyle: Themes.normal15(),
//                   onPressed: () async {
//                     Navigator.of(innerContext).pushReplacementNamed("/pay");
//                   },
//                   //{ if(dismiss == false) Navigator.of(context).pop();},
//                 ),
//                 ElevatedButtonWidget(
//                   text: AppLocalizations.of(context)!.cancel,
//                   radius: 7,
//                   textStyle: Themes.normal15(),
//                   onPressed: () => Navigator.of(innerContext).pop(),
//                   //{ if(dismiss == false) Navigator.of(context).pop();},
//                 ),
//               ],
//             ),
//           ],
//         );
//       },
//     );
//   }
//   ///////////////////////////////////////////////////////////////// additional providers
//
// /*
//
//   final googleSignIn = GoogleSignIn(scopes: ['email']);
//   GoogleSignInAccount? userGoogleData;
//
//
//   authenticateWithGoogle() async{
//
//     try{
//       final googleUser = await googleSignIn.signIn();
//       if (googleUser == null)return;
//       userGoogleData = googleUser;
//       final googleAuth  =await googleUser.authentication;
//       final credential = GoogleAuthProvider.credential(
//           accessToken: googleAuth.accessToken,
//           idToken: googleAuth.idToken
//       );
//       await FirebaseAuth.instance.signInWithCredential(credential);
//
//       print("${googleUser.email} ||${googleUser.photoUrl} ||${googleUser.displayName} ||${googleUser.id}");
//       notifyListeners();
//     }catch(e){
//       print("proooooblem:$e");
//     }finally{
//       //saveFirstTime(false);
//     }
//
//   }
//
//   Map? userFacebookData;
//   authenticateWithFacebook() async{
//     final result = await FacebookAuth.i.login(
//         permissions: ["public_profile", "email"]
//     );
//     if(result.status == LoginStatus.success){
//       final requestData = await FacebookAuth.i.getUserData(
//           fields: "email, name, picture"
//       );
//       userFacebookData = requestData;
//       notifyListeners();
//     }
//   }
//   logoutFromFacebook() async{
//     await FacebookAuth.i.logOut();
//     userFacebookData= null;
//     notifyListeners();
//   }
// */
//
//   bool socialLoginLoading = false;
//
//   Future authenticateWithFacebook(BuildContext context) async {
//     if (hasInternet == true) {
//       socialLoginLoading = true;
//       notifyListeners();
//       await getAllDeviceData(context);
//       final facebookLoginResult =
//           await FacebookAuth.i.login(permissions: ["public_profile", "email"]);
//       print("facebookLoginResult $facebookLoginResult");
//
//       if (facebookLoginResult.status != LoginStatus.success) {
//         return;
//       } else {
//         final userData = await FacebookAuth.i.getUserData(
//           fields: "name,email",
//         );
//
//         print("this isssssssssssssssssss userData $userData");
//
//         final OAuthCredential facebookAuthCredential = FacebookAuthProvider.credential(
//             facebookLoginResult.accessToken!.token);
//
//         await FirebaseAuth.instance.signInWithCredential(facebookAuthCredential).then((res) async {
//           print("this is the facebookSignIn response ${res}");
//        /* Uri socialApi = Uri.parse("${baseApi}api/v1/social-login");
//         await http.post(socialApi, body: {
//           "email": res.credential.email.toString(),
//           "name": googleSignInAccount.displayName.toString(),
//           "image": googleSignInAccount.photoUrl.toString(),
//           "type": selectedRole,
//           "notification_token": deviceData['notification_token'],
//           "android_version": deviceData['android_version'],
//           "sdk_num": deviceData['sdk_num'].toString(),
//           "manufacturer": deviceData['manufacturer'],
//           "model": deviceData['model'],
//           "app_version": deviceData['app_version'],
//         }, headers: {
//           "lang": languageText,
//         }).then((res) {
//           final result = json.decode(res.body) as Map<String, dynamic>;
//           print("result result $result");
//           if (result['is_authorized'] == true) {
//             if (result['status'] == true) {
//               saveUserToken(result['data']['token']);
//               saveRole(result['data']['role']);
//               //saveRole(selectedRole);
//               saveUserId(result['data']['user_id']);
//               saveEmailVerified(result['data']['email_verified']);
//               print("This is the User Token ${result['data']['token']}");
//               Navigator.of(context).pushReplacementNamed('/home');
//               socialLoginLoading = false;
//             } else {
//               socialLoginLoading = false;
//               notifyListeners();
//               showSnackBar(message: result['msg'], context: context);
//             }
//           } else {
//             socialLoginLoading = false;
//             notifyListeners();
//             showSnackBar(message: result['msg'], context: context);
//           }
//         });*/
//
//         notifyListeners();
//
//         });
//
//       }
//       // try {
//       //
//       // }catch (error) {
//       //   socialLoginLoading = false;
//       //   notifyListeners();
//       //   final googleSignIn = GoogleSignIn(scopes: ["email"]);
//       //
//       //   await googleSignIn.signOut();
//       //   showDialogBox(
//       //       text: AppLocalizations.of(context)!.ok,
//       //       message: AppLocalizations.of(context)!.some_thing_went_wrong,
//       //       context: context);
//       // }finally{
//       //   socialLoginLoading = false;
//       //   notifyListeners();
//       // }
//
//     } else {
//       snackBarForNoInternet(context);
//     }
//   }
//
//   dialogForSocial(
//       {required BuildContext context,
//       required List keys,
//       required String indicator}) {
//     showDialog(
//       context: context,
//       barrierDismissible: true,
//       builder: (BuildContext innerContext) {
//         return AlertDialog(
//           title: Padding(
//             padding: EdgeInsets.symmetric(
//                 horizontal: SizeConfig.getProportionateScreenWidth(15)),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.start,
//               children: [
//                 Text(
//                   AppLocalizations.of(context)!.i_am_a,
//                   style: Themes.normal18(color: Colors.black),
//                 ),
//                 SizedBox(width: SizeConfig.getProportionateScreenWidth(10)),
//                 Row(
//                   children: [
//                     Radio(
//                       value: "tutor",
//                       groupValue: selectedRole,
//                       onChanged: (newValue) =>
//                           radioButtonTutorOrLearner(newValue),
//                     ),
//                     Text(
//                       keys[0],
//                       style: Themes.normal16(color: Colors.black),
//                     ),
//                   ],
//                 ),
//                 SizedBox(width: SizeConfig.getProportionateScreenWidth(5)),
//                 Row(
//                   children: [
//                     Radio(
//                       value: "learner",
//                       groupValue: selectedRole,
//                       onChanged: (newValue) =>
//                           radioButtonTutorOrLearner(newValue),
//                     ),
//                     Text(
//                       keys[1],
//                       style: Themes.normal16(color: Colors.black),
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//           actions: [
//             Center(
//               child: ElevatedButtonWidget(
//                 text: "Continue",
//                 radius: 7,
//                 textStyle: Themes.normal15(),
//                 onPressed: () {
//                   Navigator.of(innerContext).pop();
//                   if (indicator == "google") {
//                     authenticateWithGoogle(context:context,innerContext: innerContext);
//                   } else if (indicator == "facebook") {
//                     authenticateWithFacebook(context);
//                   } else if (indicator == "apple") {}
//                 },
//                 //{ if(dismiss == false) Navigator.of(context).pop();},
//               ),
//             ),
//           ],
//         );
//       },
//     );
//   }
//
//   Future authenticateWithGoogle({BuildContext? innerContext,required BuildContext context}) async {
//     if (hasInternet == true) {
//       try {
//       socialLoginLoading = true;
//       notifyListeners();
//
//         await getAllDeviceData(context);
//
//         final googleSignIn = GoogleSignIn(scopes: ["email"]);
//
//         final googleSignInAccount = await googleSignIn.signIn();
//
//         if (googleSignInAccount == null) {
//           return;
//         } else {
//           final googleSignInAuthentication =
//               await googleSignInAccount.authentication;
//
//           final credential = GoogleAuthProvider.credential(
//             accessToken: googleSignInAuthentication.accessToken,
//             idToken: googleSignInAuthentication.idToken,
//           );
//
//           await FirebaseAuth.instance
//               .signInWithCredential(credential)
//               .then((res) async {
//             print("this is the response ${res}");
//
//             print("googleSignInAccount.email ${googleSignInAccount.email}");
//             print(
//                 "googleSignInAccount.displayName ${googleSignInAccount.displayName}");
//             print(
//                 "googleSignInAccount.photoUrl ${googleSignInAccount.photoUrl}");
//             print("selectedRole $selectedRole");
//             print(
//                 "deviceData['notification_token'] ${deviceData['notification_token']}");
//             print(
//                 "deviceData['android_version'] ${deviceData['android_version']}");
//             print("deviceData['sdk_num'] ${deviceData['sdk_num']}");
//             print(" deviceData['manufacturer'] ${deviceData['manufacturer']}");
//             print("deviceData['model'] ${deviceData['model']}");
//             print("deviceData['app_version'] ${deviceData['app_version']}");
//
//             Uri socialApi = Uri.parse("${baseApi}api/v1/social-login");
//             await http.post(socialApi, body: {
//               "email": googleSignInAccount.email.toString(),
//               "name": googleSignInAccount.displayName.toString(),
//               "image": googleSignInAccount.photoUrl.toString(),
//               "role": selectedRole,
//               "notification_token": deviceData['notification_token'],
//               "android_version": deviceData['android_version'],
//               "sdk_num": deviceData['sdk_num'].toString(),
//               "manufacturer": deviceData['manufacturer'],
//               "model": deviceData['model'],
//               "app_version": deviceData['app_version'],
//             }, headers: {
//               "lang": languageText,
//             }).then((res) {
//               final result = json.decode(res.body) as Map<String, dynamic>;
//               print("result result $result");
//               if (result['is_authorized'] == true) {
//                 if (result['status'] == true) {
//                   saveUserToken(result['data']['token']);
//                   saveRole(result['data']['role']);
//                   saveUserId(result['data']['user_id']);
//                   saveEmailVerified(result['data']['email_verified']);
//                   print("This is the User Token ${result['data']['token']}");
//                   Navigator.of(context).pushReplacementNamed('/home');
//                   socialLoginLoading = false;
//                 } else {
//                   socialLoginLoading = false;
//                   notifyListeners();
//                   showSnackBar(message: result['msg'], context: context);
//                 }
//               } else {
//                 socialLoginLoading = false;
//                 notifyListeners();
//                 showSnackBar(message: result['msg'], context: context);
//               }
//             });
//
//             notifyListeners();
//           });
//
//           print(
//               "googleSignInAccount.displayName  ${googleSignInAccount.displayName}");
//           print("googleSignInAccount.email  ${googleSignInAccount.email}");
//           print(
//               "googleSignInAccount.photoUrl  ${googleSignInAccount.photoUrl}");
//         }
//       } catch (error) {
//         socialLoginLoading = false;
//         notifyListeners();
//           final googleSignIn = GoogleSignIn(scopes: ["email"]);
//           await googleSignIn.signOut();
//           showDialogBox(
//               text: AppLocalizations.of(context)!.ok,
//               message: AppLocalizations.of(context)!.some_thing_went_wrong,
//               context: context);
//       } finally {
//         socialLoginLoading = false;
//         notifyListeners();
//
//       }
//     } else {
//       snackBarForNoInternet(context);
//     }
//   }
//
//
//   //////////////////////////////////////////////////////////// some helpful
//   void showSnackBar(
//       {required String message,
//       required BuildContext context,
//       int duration = 3000}) {
//     final snackBar = SnackBar(
//       duration: Duration(milliseconds: duration),
//       content: Container(
//         height: 35.0,
//         alignment: Alignment.centerLeft,
//         child: Text(
//           message,
//           style: Themes.normal16(color: Colors.white),
//         ),
//       ),
//       backgroundColor: red,
//     );
//
//     ScaffoldMessenger.of(context).showSnackBar(snackBar);
//   }
//
//   snackBarForNoInternet(context) {
//     final snackBar = SnackBar(
//       duration: const Duration(milliseconds: 2000),
//       content: Container(
//         height: 35.0,
//         alignment: AppLocalizations.of(context)!.language == "English"
//             ? Alignment.centerLeft
//             : Alignment.centerRight,
//         child: Text(
//           AppLocalizations.of(context)!.no_internet_connection,
//           style: Themes.normal16(color: Colors.white),
//         ),
//       ),
//       backgroundColor: red,
//     );
//
//     ScaffoldMessenger.of(context).showSnackBar(snackBar);
//   }
//
//   showDialogBox(
//       {String? message,
//       required BuildContext context,
//       int duration = 3000,
//       bool dismiss = true,
//       mainWidget = null,
//       buttonWidget = null,
//         Function? function = null,
//       required String text}) {
//     showDialog(
//       context: context,
//       barrierDismissible: dismiss,
//       builder: (BuildContext innerContext) {
//         return AlertDialog(
//           title: message != null
//               ? Text(
//                   message,
//                   textAlign: TextAlign.start,
//                   style: Themes.normal16(),
//                 )
//               : Container(),
//           actions: [
//             if (mainWidget != null) mainWidget,
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               children: [
//                 if (buttonWidget != null) buttonWidget,
//                 ElevatedButtonWidget(
//                   text: text,
//                   radius: 7,
//                   textStyle: Themes.normal15(),
//                   onPressed: () {
//                     Navigator.of(innerContext).pop();
//                     if(function != null) function();
//                     },
//                   //{ if(dismiss == false) Navigator.of(context).pop();},
//                 ),
//               ],
//             ),
//           ],
//         );
//       },
//     );
//   }
//
//   //////////////////////////////////////////////////// all about device
//
//   static final DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();
//   static Map<String, dynamic> deviceData = <String, dynamic>{};
//   String? notificationToken;
//
//   Future<void> getAllDeviceData(BuildContext context) async {
//     final PackageInfo packageInfo = await PackageInfo.fromPlatform();
//     notificationToken = await FirebaseMessaging.instance.getToken();
//     try {
//       if (Platform.isAndroid) {
//         deviceData = _readAndroidBuildData(
//             await deviceInfoPlugin.androidInfo, packageInfo);
//         print("deviceData ${deviceData}");
//       } else if (Platform.isIOS) {
//         deviceData =
//             _readIosDeviceInfo(await deviceInfoPlugin.iosInfo, packageInfo);
//       }
//     } catch (e) {
//       showDialogBox(
//           text: AppLocalizations.of(context)!.ok,
//           message: AppLocalizations.of(context)!.some_thing_went_wrong,
//           context: context);
//     }
//   }
//
//   Map<String, dynamic> _readAndroidBuildData(
//       AndroidDeviceInfo build, packageInfo) {
//     return <String, dynamic>{
//       'android_version': build.version.release,
//       'manufacturer': build.manufacturer,
//       'model': build.model,
//       'sdk_num': build.version.sdkInt,
//       if (notificationToken != null) 'notification_token': notificationToken,
//       if (packageInfo != null) 'app_version': packageInfo!.version,
//     };
//   }
//
//   Map<String, dynamic> _readIosDeviceInfo(IosDeviceInfo data, packageInfo) {
//     return <String, dynamic>{
//       'android_version': data.systemName,
//       'manufacturer': data.name,
//       'model': data.model,
//       'sdk_num': data.systemVersion,
//       if (notificationToken != null) 'notification_token': notificationToken,
//       if (packageInfo != null) 'app_version': packageInfo!.version,
//     };
//   }
//
//   ////////////////////////////////////////////////////
//
//   /*uploadImage(BuildContext context) async {
//     if (hasInternet == true) {
//       print("this is file path ${pickedProfileImage!.path}");
//       Uri uploadImageApi = Uri.parse("$baseApi/api/v1/upload-image");
//       http.MultipartRequest request =
//           http.MultipartRequest("POST", uploadImageApi);
//       request.fields['directory'] = 'aasaaa';
//       http.MultipartFile multipartFile =
//           await http.MultipartFile.fromPath('image', pickedProfileImage!.path);
//       request.files.add(multipartFile);
//       //request.headers['Authorization'] = "bearer $loadUserTokenFromBox";
//       http.StreamedResponse response = await request.send();
//       response.stream.transform(utf8.decoder).listen((res) {
//         print("This is very important $res");
//         final result = json.decode(res) as Map<String, dynamic>;
//         if (result['is_authorized'] == true) {
//           if (result['status'] == true) {
//             pickedProfileImageUrl = result['data']['image_url'];
//             print(
//                 "This is very result['data']['image_url'] $pickedProfileImageUrl");
//           }
//         } else {
//           showSnackBar(message: "${result["msg"]}", context: context);
//         }
//       });
//     } else {
//       snackBarForNoInternet(context);
//     }
//   }*/
//
//   // Future goToPosition(VideoPlayerController controller,
//   //     Duration Function(Duration currentPosition) builder) async {
//   //   final currentPosition = await controller.position;
//   //   if (currentPosition != null) {
//   //     final newPosition = builder(currentPosition);
//   //
//   //     await controller.seekTo(newPosition);
//   //   }
//   // }
//   //
//   // Future rewind5Seconds(VideoPlayerController controller) async {
//   //   goToPosition(controller,
//   //       (currentPosition) => currentPosition - Duration(seconds: 5));
//   // }
//   //
//   // Future forward5Seconds(VideoPlayerController controller) async {
//   //   goToPosition(controller,
//   //       (currentPosition) => currentPosition + Duration(seconds: 5));
//   // }
//
//   Future setLandScape() async {
//     await SystemChrome.setPreferredOrientations([
//       DeviceOrientation.landscapeLeft,
//       DeviceOrientation.landscapeRight,
//     ]);
//   }
// }
//
// /*
//             Conversation? editedTimeConversation ;
//             var isExist2 = userConversations
//                 .indexWhere((conversation) {
//                   if(element['last_message_date'] == conversation.lastMessageDate){
//                     editedTimeConversation = json.decode(element);
//                     return true;
//                   }
//                   return false;
//             } );
//             if (isExist2 < 0 && editedTimeConversation != null) {
//               int index = userConversations.indexOf(conversation);
//               userConversations[index].lastMessageDate = element['last_message_date'];
//             }*/
//
// /*  Future<void> firebaseMessagingBackgroundHandler(
//       RemoteMessage message) async {
//     final result = message.data;
//     print(result);
//     if(result.length>2){
//       userMessages.insert(0, Message.fromJson(result['data']));
//       //notifyListeners();
//       print(message.notification!.title);
//       print(message.notification!.titleLocArgs.toList());
//     }
//   }*/
// /*
//   getAllTimeSlotsForProfile(){
//     Uri addTimeSlotApi = Uri.parse("${baseApi}api/v1/timeslots/add");
//     http.post(addTimeSlotApi,
//     headers: {"Authorization": "bearer $loadUserTokenFromBox"}).then((res) {
//       final result = json.decode(res.body) as Map<String, dynamic>;
//       if (result['is_authorized'] == true) {
//         if (result['status'] == true) {
//           final slots = result['data'];
//           for (var element in slots) {
//             timeSlotsForProfile.add(TimeSlot(
//               timeSlotId: element['id'],
//               startTime: element['start_time'],
//               endTime: element['end_time'],
//               date: element['date'],
//             ));
//           }
//         }
//       }
//     });
//   }
// */
//
// /*
// /// the channel
// var channel = IOWebSocketChannel.connect("ws://tutor-s.com:6001", headers: {
//   "hostname": "tutor-s.com",
//   "port": "6001",
//   "cluster": "anyCluster",
//   "key": "anyKey",
//   "channel": 5,
//   "event": "App\\Events\\PrivateChatEvent"
// });*/
