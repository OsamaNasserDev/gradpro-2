import 'package:flutter/material.dart';

class ActiveProjectsScreen extends StatelessWidget {
  const ActiveProjectsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Active Projects")),
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
                        child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                CircleAvatar(backgroundColor: Colors.green,radius: 12),
                                SizedBox(width: 8,),
                                Text("avilable")
                              ],
                            ),
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
    );
  }
}
