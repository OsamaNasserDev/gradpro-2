import 'dart:io';
import 'package:flutter/material.dart';
import 'package:gradpro/presentation/resources/color_manager.dart';
import 'package:gradpro/presentation/resources/routes_manger.dart';
import 'package:gradpro/presentation/resources/values_manager.dart';
import 'package:image_picker/image_picker.dart';

class AddPhotoScreen extends StatefulWidget {
  const AddPhotoScreen({Key? key}) : super(key: key);

  @override
  State<AddPhotoScreen> createState() => _AddPhotoScreenState();
}

class _AddPhotoScreenState extends State<AddPhotoScreen> {



  @override
  Widget build(BuildContext context) {

    // get profile image
   File? profileImage;
    pickProfileImage({source = ImageSource.gallery}) async {
      var pickedImage = await ImagePicker.platform.pickImage(source: source);
      if (pickedImage != null) {
        profileImage = File(pickedImage.path);
        setState(() {});
        print("Success picked");
      } else {
        // todo //////////////////////////
        //toast
        // print no image selected
      }
    }
    return Scaffold(
      backgroundColor: ColorManager.background,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text("Now, add a photo",style: Theme.of(context).textTheme.displayLarge),
              const SizedBox(
                height: AppSize.s12,
              ),
              Text("That way, Your Collage will recognize you.",style: Theme.of(context).textTheme.headlineLarge,),
              const SizedBox(
                height: AppSize.s24,
              ),
              Stack(
                alignment: Alignment.bottomRight,
                children: [
                  CircleAvatar(
                    radius: 64,
                    backgroundColor: ColorManager.grey2,
                    child: profileImage == null
                        ? CircleAvatar(
                            radius: 60.0,
                            backgroundColor: Colors.grey,
                            child: Icon(Icons.person,size: 70,color: ColorManager.mixDark),
                          )
                        : CircleAvatar(
                            radius: 60.0,
                            backgroundImage: FileImage(profileImage!),
                          ),
                  ),
                  CircleAvatar(
                      radius: 16,
                      child: IconButton(
                          onPressed: () {
                            pickProfileImage();
                          },
                          icon: Icon(
                            Icons.camera_alt_outlined,
                            size: 16,
                          ))),
                ],
              ),
              const SizedBox(
                height: AppSize.s12,
              ),
              Text("Username",style: Theme.of(context).textTheme.displayLarge),
              const SizedBox(
                height: AppSize.s8,
              ),
              Text("Perfect programming experience. ,I learned the importance of applying agile methodology",style: Theme.of(context).textTheme.headlineMedium),
              const SizedBox(
                height: AppSize.s60,
              ),const SizedBox(
                height: AppSize.s60,
              ),const SizedBox(
                height: AppSize.s60,
              ),const SizedBox(
                height: AppSize.s60,
              ),
              if(profileImage != null )Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                        onPressed: () {

                        },
                        child:  Padding(
                          padding: EdgeInsets.all(AppPadding.p12),
                          child:  Text("Next"),
                        )),
                  ),
                ],
              ),
              const SizedBox(
                height: AppSize.s4,
              ),
              Row(
                children: [
                  Expanded(
                    child: OutlinedButton(
                        onPressed: () {
                          Navigator.pushNamed(context, Routes.multiSelectScreen);

                        },
                        child: const Padding(
                          padding: EdgeInsets.all(AppPadding.p12),
                          child: Text("Skip"),
                        )),
                  ),
                ],
              ),
              TextButton(onPressed: (){
                Navigator.pop(context);
              }, child: Text(
                "have an account? SignIn",style: Theme.of(context).textTheme.headlineLarge,
              )),
            ],
          ),
        ),
      ),
    );
  }
}
