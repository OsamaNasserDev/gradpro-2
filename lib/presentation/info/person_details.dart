import 'package:flutter/material.dart';
import 'package:gradpro/presentation/component/defaultTextFormField.dart';
import 'package:gradpro/presentation/resources/assets_manager.dart';
import 'package:gradpro/presentation/resources/color_manager.dart';
import 'package:gradpro/presentation/resources/routes_manger.dart';
import 'package:gradpro/presentation/resources/strings_manager.dart';
import 'package:gradpro/presentation/resources/values_manager.dart';

class AddPersonDetails extends StatelessWidget {
  AddPersonDetails({Key? key}) : super(key: key);
  final nameController = TextEditingController();
  final bioController = TextEditingController();
  final emailController = TextEditingController();
  final coursesController = TextEditingController();
  final skillsController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.background,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                Image.asset(ImageAssets.graduationHat,
                    height: AppSize.s120, width: AppSize.s120),
                const Text(AppStrings.gradPro),
                const SizedBox(
                  height: AppSize.s20,
                ),
                defaultTextFormField(text: "name", controllerText: nameController),
                defaultTextFormField(text: "bio", controllerText: bioController),
                defaultTextFormField(text: "email", controllerText: emailController),
                defaultTextFormField(text: "courses", controllerText: coursesController),
                defaultTextFormField(text: "skills", controllerText: skillsController),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                          onPressed: () {
                            Navigator.pushNamed(context, Routes.multiSelectScreen);
                          },
                          child: const Padding(
                            padding: EdgeInsets.all(AppPadding.p12),
                            child: Text("Next"),
                          )),
                    ),
                  ],
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
