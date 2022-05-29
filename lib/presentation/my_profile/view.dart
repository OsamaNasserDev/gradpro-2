import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gradpro/data/data_manager.dart';
import 'package:gradpro/presentation/resources/routes_manger.dart';

class MyProfileScreen extends StatelessWidget {
  const MyProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          if (true)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: TextButton.icon(
                onPressed: () =>
                    Navigator.pushNamed(context, Routes.updateProfileRoute),
                icon: Icon(Icons.edit,color: Colors.white),
                label: Text("edit",style: TextStyle(
                  color: Colors.white
                ),

                ),
              ),
            )
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 190,
                  alignment: Alignment.center,
                  child: CircleAvatar(
                    radius: 60.0,
                    backgroundImage: NetworkImage(
                      "https://images.pexels.com/photos/3769021/pexels-photo-3769021.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
                    ),
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Center(
                    child: Text('Username',
                        style: Theme.of(context).textTheme.displayLarge)),
                const SizedBox(
                  height: 10,
                ),
                Center(
                    child: Text('bio...',
                        style: Theme.of(context).textTheme.bodyLarge)),
                const SizedBox(
                  height: 15,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            shape: BoxShape.rectangle,
                            border: Border.all(
                              color: Colors.grey,
                              width: 1,
                            )),
                        padding: EdgeInsets.all(15),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Icon(Icons.calendar_today_rounded),
                                SizedBox(
                                  width: 10,
                                ),
                                Text("amirhany728@gmail.com"),
                              ],
                            ),
                            SizedBox(
                              height: 7,
                            ),
                            Row(
                              children: [
                                Icon(Icons.calendar_today_rounded),
                                SizedBox(
                                  width: 10,
                                ),
                                Text("amirhany728@gmail.com"),
                              ],
                            ),
                            SizedBox(
                              height: 7,
                            ),
                            Row(
                              children: [
                                Icon(Icons.calendar_today_rounded),
                                SizedBox(
                                  width: 10,
                                ),
                                Text("amirhany728@gmail.com"),
                              ],
                            ),
                            SizedBox(
                              height: 7,
                            ),
                            Row(
                              children: [
                                Icon(Icons.calendar_today_rounded),
                                SizedBox(
                                  width: 10,
                                ),
                                Text("amirhany728@gmail.com"),
                              ],
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Text("Languages"),
                      Wrap(
                        children: List.generate(3, (index) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 3),
                            child: Chip(
                                label:
                                    Text(DataManager.languages[index].name)),
                          );
                        }),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Text("Tools"),
                      Wrap(
                        children: List.generate(3, (index) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 3),
                            child: Chip(
                                label:
                                    Text(DataManager.tools[index].name)),
                          );
                        }),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Text("Soft skills"),
                      Wrap(
                        children: List.generate(3, (index) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 3),
                            child: Chip(
                                label:
                                    Text(DataManager.softSkills[index].name)),
                          );
                        }),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Text("Others"),
                      Wrap(
                        children: List.generate(3, (index) {
                          return Container(
                            padding: const EdgeInsets.symmetric(horizontal: 3),
                            child: Chip(
                                label:
                                    Text(DataManager.fildesOfInterst[index].name)),
                          );
                        }),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
