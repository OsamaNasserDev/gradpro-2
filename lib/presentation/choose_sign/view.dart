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
                Image.asset(ImageAssets.logo,
                    height: AppSize.s250, width: AppSize.s250),
                const SizedBox(
                  height: AppSize.s40,
                ),
                AnimatedTextKit(
                  animatedTexts: [
                    TypewriterAnimatedText(AppStrings.chooseSign,
                        textStyle: TextStyle(fontSize: 20),
                        speed: const Duration(
                          milliseconds: 100,
                        )),
                  ],
                  isRepeatingAnimation: true,
                  totalRepeatCount: 2,

                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
