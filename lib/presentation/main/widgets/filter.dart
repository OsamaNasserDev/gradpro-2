import 'package:flutter/material.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';

import 'package:provider/provider.dart';

import '../../../component/drop_down_numbers.dart';
import '../../../data/data_manager.dart';
import '../../../view_model/main_provider.dart';
import '../../resources/values_manager.dart';

class FilterScreen extends StatefulWidget {
  const FilterScreen({Key? key}) : super(key: key);

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  @override
  void initState() {
    Provider.of<MainProvider>(context, listen: false).filterInitState();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final mainProvider = Provider.of<MainProvider>(context);
    final mainProviderForMethods =
        Provider.of<MainProvider>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        title: Text("filter search"),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Row(
                children: [
                  const Text(
                    "Select year:",
                    style: TextStyle(fontSize: 20),
                  ),
                  const SizedBox(
                    width: 30,
                  ),
                  SizedBox(
                    width: 150,
                    child: DropDownNumbers(
                      from: 2000,
                      listLength: 22,
                      groupValue: mainProvider.dropYearGroupValue,
                      onTap: mainProviderForMethods.dropDownOnTap,
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 20,
              ),
              MultiSelectDialogField(
                items: DataManager.fildesOfInterst.map((e) => MultiSelectItem(e, e.name)).toList(),
                listType: MultiSelectListType.CHIP,
                onConfirm: mainProviderForMethods.multiSelectOthers,
                buttonText: const Text("Select fildes of interst"),
              ),
              SizedBox(
                height: 20,
              ),
              MultiSelectDialogField(
                items: DataManager.tools.map((e) => MultiSelectItem(e, e.name)).toList(),
                listType: MultiSelectListType.CHIP,
                onConfirm: mainProviderForMethods.multiSelectTools,
                buttonText: const Text("Select tools"),
              ),
              SizedBox(
                height: 20,
              ),
              MultiSelectDialogField(
                items: DataManager.languages.map((e) => MultiSelectItem(e, e.name)).toList(),
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
                        onPressed: () {

                        },
                        child: const Padding(
                          padding: EdgeInsets.all(AppPadding.p12),
                          child: Text("Filter"),
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
