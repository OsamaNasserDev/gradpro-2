import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:gradpro/presentation/resources/assets_manager.dart';
import 'package:gradpro/presentation/resources/color_manager.dart';
import 'package:gradpro/presentation/resources/inputValidator.dart';
import 'package:gradpro/presentation/resources/routes_manger.dart';
import 'package:gradpro/presentation/resources/strings_manager.dart';
import 'package:gradpro/presentation/resources/values_manager.dart';

import '../../component/defaultTextFormField.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final signInEmailController = TextEditingController();
  final signInPassController = TextEditingController();

  var formKey = GlobalKey<FormState>();

  // defaultTextFormField
  bool showPass = true;

  ChangeSufixIcon() {
    showPass = !showPass;
    setState(() {});
  }

//   //
//   setUser(value){
//     isUserStudent = value ;
// setState(() {
//
// });  }
//   bool? isUserStudent = true ;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.background,
      body: SafeArea(
        child: ListView(
          shrinkWrap: true,
          reverse: true,
          children: [
            Form(
              key: formKey,
              child: Padding(
                padding: const EdgeInsets.all(AppPadding.p20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(ImageAssets.logo,
                        height: AppSize.s250, width: AppSize.s250,),

                    Row(
                      children: [
                        AnimatedTextKit(
                          animatedTexts: [
                            TypewriterAnimatedText(AppStrings.welcome,
                                textStyle: Theme.of(context)
                                    .textTheme
                                    .headlineLarge,
                                speed: const Duration(
                                  milliseconds: 200,
                                )),
                          ],
                          isRepeatingAnimation: true,
                          totalRepeatCount: 2,
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: AppSize.s8,
                    ),
                    defaultTextFormField(
                      text: "User Name",
                      controllerText: signInEmailController,
                      icon:
                          Icon(Icons.email, color: ColorManager.mixDark),
                      validatorType: InputValidator.isUserNameValid,
                    ),
                    const SizedBox(
                      height: AppSize.s12,
                    ),
                    defaultTextFormField(
                        ChangeSufixIcon: ChangeSufixIcon,
                        showPass: showPass,
                        suffixIcon: true,
                        isPass: true,
                        text: AppStrings.password,
                        controllerText: signInPassController,
                        icon:
                            Icon(Icons.lock, color: ColorManager.mixDark),
                        validatorType: InputValidator.isPasswordValid),

                    // Row(
                    //   children: [
                    //     Expanded(
                    //       child: ListTile(
                    //         title: const Text('Student',style: TextStyle(color: Color(0xFF1A132F))),
                    //         leading: Radio(
                    //           activeColor: Color(0xFF1A132F),
                    //           value: true,
                    //           groupValue: isUserStudent,
                    //           onChanged: ( value) async{
                    //             await setUser(value );
                    //
                    //           },
                    //         ),
                    //       ),
                    //     ),
                    //     Expanded(
                    //       child: ListTile(
                    //         title: const Text('Doctor',style: TextStyle(color: Color(0xFF1A132F))),
                    //         leading: Radio(
                    //           activeColor: Color(0xFF1A132F),
                    //           value: false,
                    //           groupValue: isUserStudent,
                    //           onChanged: ( value) async{
                    //             await setUser(value);
                    //             //controller.chooseUser = value as String;
                    //
                    //           },
                    //         ),
                    //       ),
                    //     ),
                    //   ],
                    // ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextButton(onPressed: (){}, child:Text(
                          "forget password",style: Theme.of(context).textTheme.bodyMedium,
                        )),
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: ElevatedButton(
                              onPressed: () {
                                FocusScope.of(context).unfocus();
                                if (formKey.currentState!.validate()) {
                                  // todo : Sing In Method ********************************
                                  Navigator.pushNamed(
                                      context, Routes.bottomNavBarRoute);
                                }
                              },
                              child: const Padding(
                                padding: EdgeInsets.all(AppPadding.p12),
                                child: Text(AppStrings.signIn),
                              )),
                        ),
                      ],
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [

                        TextButton(onPressed: (){
                          Navigator.pushNamed(
                              context, Routes.addPhotoScreen);
                        }, child:Text(
                          " Create a new acount ",
                        )),

                      ],
                    )
                  ],
                ),
              ),
            ),
          ].reversed.toList(),
        ),
      ),
    );
  }
}
