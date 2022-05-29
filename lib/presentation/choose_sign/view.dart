import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:gradpro/presentation/resources/color_manager.dart';
import 'package:gradpro/presentation/resources/routes_manger.dart';
import 'package:gradpro/presentation/resources/strings_manager.dart';
import 'package:gradpro/presentation/resources/values_manager.dart';

import '../resources/assets_manager.dart';

class ChooseSignScreen extends StatelessWidget {
  const ChooseSignScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:  ColorManager.background,
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(AppPadding.p20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(ImageAssets.graduationHat,
                    height: AppSize.s120, width: AppSize.s120),
                const Text(AppStrings.gradPro),
                const SizedBox(
                  height: AppSize.s40,
                ),
                AnimatedTextKit(
                  animatedTexts: [
                    TypewriterAnimatedText(AppStrings.chooseSign,
                        textStyle: Theme.of(context).textTheme.headlineLarge,
                        speed: const Duration(
                          milliseconds: 200,
                        )),
                  ],
                  isRepeatingAnimation: true,
                  totalRepeatCount: 2,

                ),
                const SizedBox(
                  height: AppSize.s40,
                ),
                ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, Routes.loginRoute);
                    },
                    child: const Padding(
                      padding: EdgeInsets.all(AppPadding.p12),
                      child: Text(AppStrings.joinAsStudent),
                    )),
                const SizedBox(
                  height: AppSize.s8,
                ),
                ElevatedButton(
                    onPressed: () {

                    },
                    child: const Padding(
                      padding: EdgeInsets.all(AppPadding.p12),
                      child: Text(AppStrings.joinAsDoctor),
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
