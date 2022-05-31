import 'package:contained_tab_bar_view/contained_tab_bar_view.dart';
import 'package:flutter/material.dart';
import 'package:gradpro/presentation/resources/color_manager.dart';

class ActiveProjectsScreen extends StatelessWidget {
  const ActiveProjectsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Active Projects")),
      body:  Padding(
        padding: const EdgeInsets.only(left: 8.0,right: 8,top: 8),
        child: ContainedTabBarView(
          tabs: const [
            Text('Active Projects'),
            Text('Compeleted Projects'),
          ],
          tabBarProperties: TabBarProperties(
            height: 32.0,
            indicatorColor: ColorManager.darkPrimary,
            indicatorWeight: 4.0,
            labelColor: Colors.black,
            unselectedLabelColor: Colors.grey[400],
          ),
          views: [
            Padding(
              padding: const EdgeInsets.only(left: 8.0,right: 8,top: 8),
              child:ListView.builder(
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
                        child: Column(
                          children: [
                            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("title"),
                                Text("2022"),
                              ],),
                            Text("body body body body body body body body body body body body body body body body body body body body body "),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Icon(Icons.arrow_forward_ios_outlined)
                                ],),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },

              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0,right: 8,top: 8),
              child:ListView.builder(
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
                        child: Column(
                          children: [
                            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("title"),
                                Text("2022"),
                              ],),
                            Text("body body body body body body body body body body body body body body body body body body body body body "),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Icon(Icons.arrow_forward_ios_outlined)
                                ],),
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
          onChange: (index) => print(index),
        ),
      ),
    );
  }
}
