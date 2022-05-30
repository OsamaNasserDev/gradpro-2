import 'package:contained_tab_bar_view/contained_tab_bar_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gradpro/presentation/main/widgets/search_bar.dart';
import 'package:gradpro/presentation/resources/color_manager.dart';
import 'package:gradpro/presentation/resources/routes_manger.dart';
import 'package:provider/provider.dart';

import '../../view_model/main_provider.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mainProvider = Provider.of<MainProvider>(context);
    final mainProviderForMethods = Provider.of<MainProvider>(context,listen: false);

    return SafeArea(
      child: Container(
        height: double.infinity,
        child: Column(
          children: [
            TextButton(onPressed: (){
              mainProviderForMethods.sendRequest();
            }, child: Text("click ")),
            searchBar(context),
            const SizedBox(height: 20
              ,),
            Row(
              children: [
                const SizedBox(width: 20
                  ,),
                OutlinedButton.icon(onPressed: (){
                  Navigator.pushNamed(context, Routes.sendProjectRequestRoute);
                }, icon: Icon(Icons.send_and_archive_rounded), label: Text("Send project request")),
              ],
            ),
            const SizedBox(height: 20
              ,),

            Row(
              children: [
                const SizedBox(width: 20
                  ,),
                Text("Explore old projects",style: Theme.of(context).textTheme.displayLarge),
              ],
            ),
            SizedBox(height: 20
              ,),
            Expanded(
              child: ContainedTabBarView(
                tabs: const [
                  Text('Mobile Apps'),
                  Text('Desktop Apps'),
                  Text('Websites'),
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
                    child: ListView.builder(
                      shrinkWrap: true,
                      physics: const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
                      itemCount: 20,
                      itemBuilder: (BuildContext context, int index) {
                        return InkWell(
                          onTap: (){
                            Navigator.pushNamed(context, Routes.projectDetailsRoute);
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
                                  Row(mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Icon(Icons.arrow_forward_ios_outlined)
                                    ],),
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
                    child: ListView.builder(
                      shrinkWrap: true,
                      physics: const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
                      itemCount: 20,
                      itemBuilder: (BuildContext context, int index) {
                        return InkWell(
                          onTap: (){
                            Navigator.pushNamed(context, Routes.projectDetailsRoute);
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
                                  Row(mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Icon(Icons.arrow_forward_ios_outlined)
                                    ],),
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
                    child: ListView.builder(
                      shrinkWrap: true,
                      physics: const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
                      itemCount: 20,
                      itemBuilder: (BuildContext context, int index) {
                        return InkWell(
                          onTap: (){
                            Navigator.pushNamed(context, Routes.projectDetailsRoute);
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
                                  Row(mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Icon(Icons.arrow_forward_ios_outlined)
                                    ],),
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

          ],
        ),
      ),
    );
  }
}
