import 'package:flutter/material.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';

import 'package:provider/provider.dart';

import '../../../component/drop_down_numbers.dart';
import '../../../data/data_manager.dart';
import '../../../view_model/main_provider.dart';

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
      appBar: AppBar(),
      body: SafeArea(
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
          ],
        ),
      ),
    );
  }
}
