import 'package:flutter/material.dart';
import 'package:gradpro/component/defaultTextFormField.dart';
import 'package:gradpro/data/data_manager.dart';
import 'package:gradpro/presentation/resources/assets_manager.dart';
import 'package:gradpro/presentation/resources/color_manager.dart';
import 'package:gradpro/presentation/resources/inputValidator.dart';
import 'package:gradpro/presentation/resources/routes_manger.dart';
import 'package:gradpro/presentation/resources/values_manager.dart';
import 'package:multi_select_flutter/dialog/multi_select_dialog_field.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';
import 'package:provider/provider.dart';

import '../../view_model/main_provider.dart';

class MultiSelect extends StatefulWidget {
  const MultiSelect({Key? key}) : super(key: key);

  @override
  State<MultiSelect> createState() => _MultiSelectState();
}

class _MultiSelectState extends State<MultiSelect> {

  final nameController = TextEditingController();
  final bioController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final mainProvider = Provider.of<MainProvider>(context);
    final mainProviderForMethods = Provider.of<MainProvider>(context,listen: false);

    return Scaffold(

      backgroundColor: ColorManager.background,
      appBar: AppBar(leading: IconButton(
        onPressed: (){
          Navigator.pop(context);
        },
        icon: Icon(Icons.arrow_back,color: Colors.black),
      ),toolbarHeight: 80,title:    Image.asset(ImageAssets.logo,
          height: AppSize.s120, width: AppSize.s120),backgroundColor: ColorManager.background,elevation: 0,),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Form(
            key: formKey,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [


                  defaultTextFormField(text: "name", controllerText: nameController,icon: Icon(Icons.person)),
                  defaultTextFormField(text: "bio", controllerText: bioController,icon: Icon(Icons.details)),
                  defaultTextFormField(text: "email", controllerText: emailController,icon: Icon(Icons.email),validatorType: InputValidator.isEmailValid),
                  defaultTextFormField(text: "password", controllerText: passwordController,icon: Icon(Icons.remove_red_eye),validatorType: InputValidator.isPasswordValid),
                  defaultTextFormField(text: "confirm password", controllerText: confirmPasswordController,icon: Icon(Icons.remove_red_eye),validatorType: InputValidator.isPasswordValid),

                  SizedBox(
                    height: 20,
                  ),
                  MultiSelectDialogField(
                    items: DataManager.fildesOfInterst.map((e) => MultiSelectItem(e, e)).toList(),
                    listType: MultiSelectListType.CHIP,
                    onConfirm: mainProviderForMethods.multiSelectOthers,
                    buttonText: const Text("Select fildes of interst"),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  MultiSelectDialogField(
                    items: DataManager.softSkills.map((e) => MultiSelectItem(e, e)).toList(),
                    listType: MultiSelectListType.CHIP,
                    onConfirm: mainProviderForMethods.multiSelectSoftSkills,
                    buttonText: const Text("Select soft Skills"),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  MultiSelectDialogField(
                    items: DataManager.tools.map((e) => MultiSelectItem(e, e)).toList(),
                    listType: MultiSelectListType.CHIP,
                    onConfirm: mainProviderForMethods.multiSelectTools,
                    buttonText: const Text("Select tools"),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  MultiSelectDialogField(
                    items: DataManager.languages.map((e) => MultiSelectItem(e, e)).toList(),
                    listType: MultiSelectListType.CHIP,
                    onConfirm: mainProviderForMethods.multiSelectLanguages,
                    buttonText: const Text("Select languages"),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: ElevatedButton(
                            onPressed: () async{
                                if (formKey.currentState!.validate()) {
                                  // todo : Sing up Method ********************************
                                await mainProviderForMethods.signUp(
                                  name: nameController.text,
                                  email: emailController.text,
                                  password: passwordController.text,
                                  bio: bioController.text,
                                );
                                Navigator.pushNamed(
                                      context, Routes.bottomNavBarRoute);
                                }
                            },
                            child: const Padding(
                              padding: EdgeInsets.all(AppPadding.p12),
                              child: Text("Done"),
                            )),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
// class SelectDataModel {
//   final int id;
//   final String name;
//
//   SelectDataModel({
//     required this.id,
//     required this.name,
//   });
// }
