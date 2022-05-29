import 'package:flutter/material.dart';

class DoctorRequestScreen extends StatelessWidget {
  const DoctorRequestScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(  // TODO: remove Scaffold when use it in BottomNavBar ***************  امير  ****************
      appBar: AppBar(title: Text("Doctor Requests")),
      body:  Padding(
        padding: const EdgeInsets.only(left: 8.0,right: 8,top: 8),
        child: ListView.builder(
          shrinkWrap: true,
          physics: const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
          itemCount: 20,
          itemBuilder: (BuildContext context, int index) {
            return InkWell(
              onTap: (){
              },
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Row(
                    children: [
                      Icon(Icons.person,size: 50,),
                      SizedBox(width: 10,),
                      Container(
                        width: 250,
                        child: Column(
                          children: [
                            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Student Name",style: Theme.of(context).textTheme.headlineLarge),
                                Text("Mobile App"),
                              ],),
                            Text("An intelligent flirt app that automatically scans your friends’ lists from all social networks and suggests the best match based on your similar activities, likes, sharing, opinions about you, and more."),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Icon(Icons.calendar_today_rounded),
                                      SizedBox(width: 8,),
                                      Text("12/1/2021")
                                    ],
                                  ),
                                  TextButton(child: Text("+ Accept"),onPressed: (){},)
                                ],),
                            ),
                          ],
                        ),
                      ),
                    ],
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
