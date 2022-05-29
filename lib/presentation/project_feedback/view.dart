import 'package:flutter/material.dart';
import 'package:gradpro/presentation/resources/values_manager.dart';

import '../../component/defaultTextFormField.dart';

class ProjectFeedbackScreen extends StatelessWidget {
   ProjectFeedbackScreen({Key? key}) : super(key: key);
   final feedbackController = TextEditingController();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Project Feedback",style: Theme.of(context).textTheme.displayLarge,),
              SizedBox(height: 20,),
              Text("Send Your Feedback",style: Theme.of(context).textTheme.headlineLarge,),
              SizedBox(height: 20,),
              defaultTextFormField(text: "   write a feedback", controllerText: feedbackController,maxLines: 8),
              SizedBox(height: 20,),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                        onPressed: () {
                          FocusScope.of(context).unfocus();

                        },
                        child: const Padding(
                          padding: EdgeInsets.all(AppPadding.p12),
                          child: Text("Send"),
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
