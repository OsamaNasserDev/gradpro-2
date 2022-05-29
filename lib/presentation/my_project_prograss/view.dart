import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animation_progress_bar/flutter_animation_progress_bar.dart';

class MyProjectPrograssScreen extends StatelessWidget {
   MyProjectPrograssScreen({Key? key}) : super(key: key);

  String dummyText = """Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo. Nullam dictum felis eu pede mollis pretium. Integer tincidunt. Cras dapibus. Vivamus elementum semper nisi. Aenean vulputate eleifend tellus. Aenean leo ligula, porttitor eu, consequat vitae, eleifend ac, enim. Aliquam lorem ante, dapibus in, viverra quis, feugiat a, tellus. Phasellus viverra nulla ut metus varius laoreet. Quisque rutrum. Aenean imperdiet. Etiam ultricies nisi vel augue. Curabitur ullamcorper ultricies nisi. Nam eget dui. Etiam rhoncus. Maecenas tempus, tellus eget condimentum rhoncus, sem quam semper libero, sit amet adipiscing sem neque sed ipsum. Nam quam nunc, blandit vel, luctus pulvinar, hendrerit id, lorem. Maecenas nec odio et ante tincidunt tempus. Donec vitae sapien ut libero venenatis faucibus. Nullam quis ante. Etiam sit amet orci eget eros faucibus tincidunt. Duis leo. Sed fringilla mauris sit amet nibh. Donec sodales sagittis magna. Sed consequat, leo eget bibendum sodales, augue velit cursus nunc,""";
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
                        header: Text("overview"),
                        collapsed: Text(dummyText, softWrap: true, maxLines: 2, overflow: TextOverflow.ellipsis,),
                        expanded: Text(dummyText, softWrap: true, ),
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
