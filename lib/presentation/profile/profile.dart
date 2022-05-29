import 'package:flutter/material.dart';
import 'package:flutter_animation_progress_bar/flutter_animation_progress_bar.dart';
import 'package:gradpro/presentation/resources/color_manager.dart';
import 'package:gradpro/presentation/resources/routes_manger.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Column(
      children: [
        Container(
          height: 200,
          color: ColorManager.grey,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 44,
                  backgroundColor: ColorManager.background,
                  child: CircleAvatar(
                    backgroundColor: Colors.grey,
                    radius: 40.0,
                    child: Icon(
                      Icons.person,size: 60,
                      color: Colors.black,
                    ),
                  ),
                ),
                SizedBox(width: 20,),
                SizedBox(
                  width: 120,
                  child: Column(
                    children: [
                      SizedBox(height: 40,),
                      Text("Username",style: Theme.of(context).textTheme.displayLarge),
                      SizedBox(height: 15,),

                      Container(
                        child: FAProgressBar(
                          currentValue: 80,
                          displayText: '%',
                          maxValue: 100,
                          size: 25,
                          changeColorValue: 100,
                          changeProgressColor: Colors.green,
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      OutlinedButton.icon(onPressed: (){
                        Navigator.pushNamed(context, Routes.myProfileRoute);

                      }, icon: Icon(Icons.arrow_forward_ios_outlined), label: Text("Profile"))

                    ],
                  ),
                )
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Card(
            color: ColorManager.background,
            child: ListTile(
              title: Text("old projects",style: Theme.of(context).textTheme.headlineLarge),
              leading: Icon(
                  Icons.remove_red_eye_outlined
              ),
              trailing: Icon(
                  Icons.arrow_forward_ios_outlined
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Card(
            color: ColorManager.background,
            child: ListTile(
              title: Text("your project prograss",style: Theme.of(context).textTheme.headlineLarge),
              leading: Icon(
                  Icons.pan_tool_rounded
              ),
              trailing: IconButton(
                onPressed: (){
                  Navigator.pushNamed(context, Routes.myProjectPrograssRoute);

                },
                icon:  Icon(
                    Icons.arrow_forward_ios_outlined
                ),
              ),
            ),
          ),
        ),

        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Card(
            color: ColorManager.background,
            child: ListTile(
              title: Text("add new ideas",style: Theme.of(context).textTheme.headlineLarge),
              leading: Icon(
                  Icons.star
              ),
              trailing: Icon(
                  Icons.arrow_forward_ios_outlined
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Card(
            color: ColorManager.background,
            child: ListTile(
              title: Text("Save projects",style: Theme.of(context).textTheme.headlineLarge),
              leading: Icon(
                  Icons.save
              ),
              trailing: Icon(
                  Icons.arrow_forward_ios_outlined
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Card(
            color: ColorManager.background,
            child: ListTile(
              title: Text("Active projects",style: Theme.of(context).textTheme.headlineLarge),
              leading: Icon(
                  Icons.pending_actions_sharp
              ),
              trailing: IconButton(
                onPressed: (){
                  Navigator.pushNamed(context, Routes.activeProjectsRoute);
                },
                icon: Icon(
                    Icons.arrow_forward_ios_outlined
                ),
              ),
            ),
          ),
        ),

      ],
    ));
  }
}
