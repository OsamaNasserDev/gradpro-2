import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gradpro/presentation/resources/values_manager.dart';
import 'package:gradpro/presentation/signup_view/multi_select_intersts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';
import 'package:provider/provider.dart';

import '../../component/defaultTextFormField.dart';
import '../../data/data_manager.dart';
import '../../view_model/main_provider.dart';

class UpdateProfileScreen extends StatefulWidget {
  const UpdateProfileScreen({Key? key}) : super(key: key);

  @override
  State<UpdateProfileScreen> createState() => _UpdateProfileScreenState();
}

class _UpdateProfileScreenState extends State<UpdateProfileScreen> {
  // for edit profile screen

  final editNameController = TextEditingController();
  final editBioController = TextEditingController();
  final editEmailController = TextEditingController();

  // get profile image
  File? profileImage;
  pickProfileImage({source = ImageSource.gallery}) async {
    var pickedImage = await ImagePicker.platform.pickImage(source: source);
    if (pickedImage != null) {
      profileImage = File(pickedImage.path);
setState(() {

});    } else {
      //toast
      // print no image selected
    }
  }




  @override
  Widget build(BuildContext context) {

    final mainProvider = Provider.of<MainProvider>(context);
    final mainProviderForMethods = Provider.of<MainProvider>(context,listen: false);
    return Scaffold(
      appBar: AppBar(
        title: Text("Edit Profile"),

      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              SizedBox(
                height: 150,
                child: Stack(
                  alignment: Alignment.bottomRight,
                  children: [
                    CircleAvatar(
                      radius: 64,
                      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                      child:profileImage == null ?  CircleAvatar(
                        radius: 60.0,
                        child:  Icon(Icons.person,size: 50), // todo : show network image
                      ): CircleAvatar(
                        radius: 60.0,
                        backgroundImage:  FileImage(profileImage!),
                      ),
                    ) ,
                    CircleAvatar(radius: 16 ,child: IconButton(onPressed: (){
                      pickProfileImage();
                    }, icon: Icon(Icons.camera_alt_outlined,size: 16,))),
                  ],
                ),
              ),
              const SizedBox(height: 25,),
              defaultTextFormField(text: "name", controllerText: editNameController,),
              defaultTextFormField(text: "bio", controllerText: editBioController,),
              defaultTextFormField(text: "Email", controllerText:editEmailController,),
              const SizedBox(height: 5,),
              MultiSelectDialogField(
                items: DataManager.fildesOfInterst.map((e) => MultiSelectItem(e, e.name)).toList(),
                listType: MultiSelectListType.CHIP,
                onConfirm: (values) {
                  mainProvider.selectedOthers = values;
                },
                buttonText: const Text("Select fildes of interst"),
              ),
              SizedBox(
                height: 20,
              ),
              MultiSelectDialogField(
                items: DataManager.softSkills.map((e) => MultiSelectItem(e, e.name)).toList(),
                listType: MultiSelectListType.CHIP,
                onConfirm: (values) {
                  mainProvider.selectedSkills = values;
                },
                buttonText: const Text("Select soft Skills"),
              ),
              SizedBox(
                height: 20,
              ),
              const SizedBox(height: 10,),

              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                        onPressed: () {
                        },
                        child: const Padding(
                          padding: EdgeInsets.all(AppPadding.p12),
                          child: Text("Update"),
                        )),
                  ),
                ],
              ),
            ],
          ),
        ),
      )
    );
  }
}
