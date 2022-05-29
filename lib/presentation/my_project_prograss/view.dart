import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animation_progress_bar/flutter_animation_progress_bar.dart';

class MyProjectPrograssScreen extends StatelessWidget {
   MyProjectPrograssScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("my project")),
      body: SingleChildScrollView(
        physics: const ScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Chapter 1",style: Theme.of(context).textTheme.displayLarge,),
              SizedBox( height: 10,),
              Text("Chapter prograss",style: Theme.of(context).textTheme.headlineLarge,),
              SizedBox( height: 10,),
              FAProgressBar(
                currentValue: 80,
                displayText: '%',
                maxValue: 100,
                size: 60,
                changeColorValue: 50,
                changeProgressColor: Colors.green,
              ),
              SizedBox( height: 15,),
              Text("Only the leader who can upload or update the tast.",style: Theme.of(context).textTheme.headlineLarge,),
              SizedBox( height: 15,),
            Padding(
              padding: const EdgeInsets.only(left: 8.0,right: 8,top: 8),
              child: ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: 20,
                itemBuilder: (BuildContext context, int index) {
                  return   Card(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ExpandablePanel(
                        header: Text("overview",style: Theme.of(context).textTheme.headlineLarge),
                       collapsed: Container(),
                        expanded: Column(
                          children: [
                            Row(
                              children:  [
                                Text(" Upload ", softWrap: true, ),
                                SizedBox(width: 20,),
                                IconButton(onPressed: (){}, icon: Icon(Icons.upload_rounded))
                              ],
                            ),
                            Row(
                              children:  [
                                Text(" Update ", softWrap: true, ),
                                SizedBox(width: 20,),
                                IconButton(onPressed: (){}, icon: Icon(Icons.system_update_alt_rounded))
                              ],
                            ),
                            Row(
                              children:  [
                                Icon(Icons.calendar_today_rounded),
                                SizedBox(width: 20,),

                                Text(" last update at 7/5/2022 ", softWrap: true, ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },

              ),
            ),

            ],
          ),
        ),
      ),
    );
  }
}
