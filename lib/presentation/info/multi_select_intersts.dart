import 'package:flutter/material.dart';
import 'package:gradpro/presentation/resources/color_manager.dart';
import 'package:gradpro/presentation/resources/routes_manger.dart';
import 'package:gradpro/presentation/resources/values_manager.dart';
import 'package:multi_select_flutter/dialog/multi_select_dialog_field.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';

class MultiSelect extends StatefulWidget {
  const MultiSelect({Key? key}) : super(key: key);

  @override
  State<MultiSelect> createState() => _MultiSelectState();
}

class _MultiSelectState extends State<MultiSelect> {
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
      backgroundColor: ColorManager.background,
      appBar: AppBar(title: const Text("Select your skills")),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              MultiSelectDialogField(
                items: _fildesOfInterst.map((e) => MultiSelectItem(e, e.name!)).toList(),
                listType: MultiSelectListType.CHIP,
                onConfirm: (values) {
                  _selectedFildesOfInterst = values;
                },
                buttonText: const Text("Select fildes of interst"),
              ),
              SizedBox(
                height: 50,
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
                height: 50,
              ),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                        onPressed: () {
                            Navigator.pushNamed(context, Routes.bottomNavBarRoute);

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
    );
  }
}
class SelectDataModel {
  final int? id;
  final String? name;

  SelectDataModel({
    this.id,
    this.name,
  });
}
