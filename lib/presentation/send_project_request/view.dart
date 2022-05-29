import 'package:flutter/material.dart';
import 'package:gradpro/presentation/resources/routes_manger.dart';
import 'package:gradpro/presentation/resources/values_manager.dart';
import 'package:gradpro/presentation/signup_view/multi_select_intersts.dart';
import 'package:multi_select_flutter/dialog/multi_select_dialog_field.dart';
import 'package:multi_select_flutter/util/multi_select_item.dart';
import 'package:multi_select_flutter/util/multi_select_list_type.dart';
import 'package:provider/provider.dart';

import '../../component/defaultTextFormField.dart';
import '../../data/data_manager.dart';
import '../../view_model/main_provider.dart';

class SendRequestScreen extends StatefulWidget {
  SendRequestScreen({Key? key}) : super(key: key);

  @override
  State<SendRequestScreen> createState() => _SendRequestScreenState();
}

class _SendRequestScreenState extends State<SendRequestScreen> {
  TextEditingController projectNameController = TextEditingController();
  TextEditingController projectBriefController = TextEditingController();

  //

  @override
  Widget build(BuildContext context) {
    final mainProvider = Provider.of<MainProvider>(context);
    final mainProviderForMethods =
        Provider.of<MainProvider>(context, listen: false);

    int currentStep = 0;
    List<Step> getSteps() {
      return [
        Step(
            state: currentStep > 0 ? StepState.complete : StepState.indexed,
            title: const Text("about project"),
            content: Container(
              child: Column(
                children: [
                  defaultTextFormField(
                      text: "Project Name",
                      controllerText: projectNameController,
                      icon: Icon(Icons.person)),
                  defaultTextFormField(
                    text: "Project Brief",
                    controllerText: projectBriefController,
                    icon: Icon(Icons.person),
                    maxLines: 6,
                  ),
                  defaultTextFormField(
                    text: "Project Objectives",
                    controllerText: projectBriefController,
                    icon: Icon(Icons.person),
                    maxLines: 3,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),
            isActive: currentStep >= 0),
        Step(
            state: currentStep > 1 ? StepState.complete : StepState.indexed,
            title: const Text("project details"),
            content: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  MultiSelectDialogField(
                    items: DataManager.fildesOfInterst
                        .map((e) => MultiSelectItem(e, e.name ))
                        .toList(),
                    listType: MultiSelectListType.CHIP,
                    onConfirm: mainProviderForMethods.multiSelectOthers,
                    buttonText: const Text("Select fildes of interst"),
                  ),
                  SizedBox(
                    height: 20,
                  ),

                  MultiSelectDialogField(
                    items: DataManager.tools
                        .map((e) => MultiSelectItem(e, e.name))
                        .toList(),
                    listType: MultiSelectListType.CHIP,
                    onConfirm: mainProviderForMethods.multiSelectTools,
                    buttonText: const Text("Select tools"),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  MultiSelectDialogField(
                    items: DataManager.languages
                        .map((e) => MultiSelectItem(e, e.name))
                        .toList(),
                    listType: MultiSelectListType.CHIP,
                    onConfirm: mainProviderForMethods.multiSelectLanguages,
                    buttonText: const Text("Select languages"),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                ],
              ),
            ),
            isActive: currentStep >= 1),
      ];
    }

    return Scaffold(
      appBar: AppBar(title: Text("Send project request")),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stepper(
              steps: getSteps(),
              currentStep: currentStep,
              onStepContinue: () {
                final isLastStep = currentStep == getSteps().length - 1;
                if (isLastStep) {
                  // todo //// send data to firebase *******************
                  print("complete");
                } else {
                  setState(() {
                    currentStep += 1;
                  });
                }
              },
              onStepTapped: (step) => setState(() {
                currentStep = step;
              }),
              onStepCancel: () {
                currentStep == 0
                    ? null
                    : setState(() {
                        currentStep -= 1;
                      });
              },
              controlsBuilder: (BuildContext context, ControlsDetails details) {
                final isLastStep = currentStep == getSteps().length - 1;
                return Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                          onPressed: (){
                            details.onStepContinue;

                          setState(() {

                            });
                          },
                          child: Text(isLastStep ? "Confirm" : 'Next'),
                          style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.circular(AppSize.s4)))),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    if (currentStep != 0)
                      Expanded(
                        child: OutlinedButton(
                            onPressed: details.onStepCancel,
                            child: const Text('Back'),
                            style: OutlinedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.circular(AppSize.s4)))),
                      ),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
