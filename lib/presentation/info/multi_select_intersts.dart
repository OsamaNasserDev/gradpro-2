import 'package:flutter/material.dart';
import 'package:gradpro/data/data_manager.dart';
import 'package:gradpro/presentation/resources/color_manager.dart';
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

  List _selectedFildesOfInterst = [];

  List _selectedSoftSkilles = [];

  @override
  Widget build(BuildContext context) {
    final mainProvider = Provider.of<MainProvider>(context);
    final mainProviderForMethods = Provider.of<MainProvider>(context,listen: false);

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
                items: DataManager.fildesOfInterst.map((e) => MultiSelectItem(e, e.name!)).toList(),
                listType: MultiSelectListType.CHIP,
                onConfirm: mainProviderForMethods.multiSelectOthers,
                buttonText: const Text("Select fildes of interst"),
              ),
              SizedBox(
                height: 50,
              ),
              MultiSelectDialogField(
                items: DataManager.softSkills.map((e) => MultiSelectItem(e, e.name!)).toList(),
                listType: MultiSelectListType.CHIP,
                onConfirm: mainProviderForMethods.multiSelectSoftSkills,
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
