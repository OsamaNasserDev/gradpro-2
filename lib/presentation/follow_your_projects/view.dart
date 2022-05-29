import 'package:flutter/material.dart';
import 'package:gradpro/presentation/resources/values_manager.dart';

class FollowYourProjectsScreen extends StatelessWidget {
  const FollowYourProjectsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Follow Your Projects")),
      body: Padding(
        padding: const EdgeInsets.only(left: 8.0,right: 8,top: 8),
        child: ListView.builder(
          shrinkWrap: true,
          physics: const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
          itemCount: 4,
          itemBuilder: (BuildContext context, int index) {
            return InkWell(
              onTap: (){
              },
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child:  Container(
                    width: 250,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Student Name",style: Theme.of(context).textTheme.headlineLarge),
                            Row(
                              children: [
                                Icon(Icons.calendar_today_rounded),
                                SizedBox(width: 8,),
                                Text("12/1/2021")
                              ],)
                          ],),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("objective"),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              TextButton(child: Text("+ Add Feedback"),onPressed: (){},),
                              Column(
                                children: [
                                  Row(
                                    children: [
                                      Icon(Icons.playlist_add_check_sharp),
                                      SizedBox(width: 8,),
                                      Text("Approve")
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Icon(Icons.pending),
                                      SizedBox(width: 8,),
                                      Text("  Reject")
                                    ],
                                  ),
                                ],
                              ),

                            ],),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },

        ),
      ),
    );
  }
}
