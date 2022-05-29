import 'package:flutter/material.dart';
import 'package:gradpro/presentation/component/defaultTextFormField.dart';
import 'package:gradpro/presentation/info/multi_select_intersts.dart';
import 'package:gradpro/presentation/resources/routes_manger.dart';
import 'package:gradpro/presentation/resources/values_manager.dart';
import 'package:multi_select_flutter/dialog/multi_select_dialog_field.dart';
import 'package:multi_select_flutter/util/multi_select_item.dart';
import 'package:multi_select_flutter/util/multi_select_list_type.dart';

class SendRequestScreen extends StatefulWidget {
   SendRequestScreen({Key? key}) : super(key: key);

  @override
  State<SendRequestScreen> createState() => _SendRequestScreenState();
}

class _SendRequestScreenState extends State<SendRequestScreen> {
  TextEditingController projectNameController = TextEditingController();
  TextEditingController projectBriefController = TextEditingController();

  //
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

  List<Step> getSteps()=>[
    Step(state:currentStep > 0?StepState.complete : StepState.indexed ,title: const Text("about project"), content: Container(
      child: Column(
        children: [
          defaultTextFormField(text: "Project Name", controllerText: projectNameController,icon: Icon(Icons.person)),
          defaultTextFormField(text: "Project Brief", controllerText: projectBriefController,icon: Icon(Icons.person),maxLines: 6,),
          defaultTextFormField(text: "Project Objectives", controllerText: projectBriefController,icon: Icon(Icons.person),maxLines: 3,),
          SizedBox(height: 10,),
        ],
      ),
    ),isActive: currentStep >= 0),
    Step(state:currentStep > 1?StepState.complete : StepState.indexed ,title: const Text("project details"), content: Container(
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
        ],
      ),
    ),isActive: currentStep >= 1),
  ];

  int currentStep = 0 ;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Send project request")),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stepper(
                steps: getSteps(),
              currentStep: currentStep,
              onStepContinue: (){
                  final isLastStep = currentStep == getSteps().length -1 ;
                  if(isLastStep){
                    // todo //// send data to firebase *******************
                    print("complete");
                  }else{
                    setState(() {
                      currentStep += 1 ;
                    });
                  }
              },
              onStepTapped: (step)=> setState(() {
                currentStep = step ;
              }),
              onStepCancel:(){
               currentStep == 0?null : setState(() {
                  currentStep -= 1 ;
                });
              },
    controlsBuilder:
          (BuildContext context, ControlsDetails details) {
             final isLastStep = currentStep == getSteps().length -1 ;
            return Row(
          children:  [
            Expanded(
              child: ElevatedButton(
                onPressed: details.onStepContinue,
                child:  Text(isLastStep ? "Confirm":'Next'),
                  style: ElevatedButton.styleFrom(

                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(AppSize.s4))
                  )
              ),
            ),
            SizedBox(width: 20,),
            if(currentStep != 0)
            Expanded(
              child: OutlinedButton(
                onPressed: details.onStepCancel,
                child: const Text('Back'),
                  style: OutlinedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(AppSize.s4))
                  )
              ),
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
