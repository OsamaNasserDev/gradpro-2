import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gradpro/presentation/component/defaultTextFormField.dart';
import 'package:gradpro/presentation/info/multi_select_intersts.dart';
import 'package:gradpro/presentation/resources/values_manager.dart';
import 'package:image_picker/image_picker.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';

class UpdateProfileScreen extends StatefulWidget {
  const UpdateProfileScreen({Key? key}) : super(key: key);

  @override
  State<UpdateProfileScreen> createState() => _UpdateProfileScreenState();
}

class _UpdateProfileScreenState extends State<UpdateProfileScreen> {
  // for edit profile screen

  final editNameController = TextEditingController();
  final editBioController = TextEditingController();
  final editPhoneController = TextEditingController();
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



  static final List<SelectDataModel> _fildesOfInterst = [
    SelectDataModel(id: 1, name: "AI"),
    SelectDataModel(id: 2, name: "Ml"),
    SelectDataModel(id: 3, name: "Web App"),
    SelectDataModel(id: 4, name: "Desktop App"),
    SelectDataModel(id: 5, name: "Mobile App"),
    SelectDataModel(id: 6, name: "Embedded"),
    SelectDataModel(id: 7, name: "Networking"),
    SelectDataModel(id: 8, name: "UX/UI"),
    SelectDataModel(id: 9, name: "VR"),
    SelectDataModel(id: 10, name: "AR"),
    SelectDataModel(id: 11, name: "IoT"),

  ];
  List _selectedFildesOfInterst = [];


  // skilles
  static final List<SelectDataModel> _softSkills=[

    SelectDataModel(id: 12, name: "Presentation"),
    SelectDataModel(id: 13, name: "Problem solving"),
    SelectDataModel(id: 14, name: "Time Management"),
    SelectDataModel(id: 15, name: "Initiative work"),
    SelectDataModel(id: 16, name: "Flexibility to work"),
    SelectDataModel(id: 17, name: "Teamwork"),
    SelectDataModel(id: 18, name: "Imagination or vision"),
    SelectDataModel(id: 19, name: "Communication"),
    SelectDataModel(id: 20, name: "Cooperation"),
    SelectDataModel(id: 21, name: "Leadership"),
    SelectDataModel(id: 22, name: "Critical thinking"),
    SelectDataModel(id: 23, name: "Handling pressure"),
    SelectDataModel(id: 24, name: "Negotiation"),
    SelectDataModel(id: 25, name: "Planning"),
    SelectDataModel(id: 26, name: "Humility"),
    SelectDataModel(id: 27, name: "Lifelong learner"),
    SelectDataModel(id: 28, name: "Self-starter"),
    SelectDataModel(id: 29, name: "Emotional intelligence"),
    SelectDataModel(id: 30, name: "Work ethic"),
  ];
  List _selectedSoftSkilles = [];

  @override
  Widget build(BuildContext context) {
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
              defaultTextFormField(text: "phone", controllerText:editPhoneController,),
              defaultTextFormField(text: "Email", controllerText:editEmailController,),
              const SizedBox(height: 5,),
              MultiSelectDialogField(
                items: _fildesOfInterst.map((e) => MultiSelectItem(e, e.name!)).toList(),
                listType: MultiSelectListType.CHIP,
                onConfirm: (values) {
                  _selectedFildesOfInterst = values;
                },
                buttonText: const Text("Select fildes of interst"),
              ),
              SizedBox(
                height: 20,
              ),
              MultiSelectDialogField(
                items: _softSkills.map((e) => MultiSelectItem(e, e.name!)).toList(),
                listType: MultiSelectListType.CHIP,
                onConfirm: (values) {
                  _selectedSoftSkilles = values;
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
