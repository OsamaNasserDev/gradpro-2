import 'package:flutter/material.dart';

class MyTeamScreen extends StatelessWidget {
  const MyTeamScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        physics: ScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.only(left: 8.0,right: 8,top: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 10,),

              Text(" requests to join your team",style: Theme.of(context).textTheme.displayLarge),
              SizedBox(height: 10,),
              ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: 20,
                itemBuilder: (BuildContext context, int index) {
                  return  Card(
                    child: Padding(
                      padding: EdgeInsets.all(5.0),
                      child: ListTile(
                        title: Text("Student name",style: Theme.of(context).textTheme.headlineLarge),
                        subtitle: Text("Flutter developer"),
                        leading: CircleAvatar(),
                        trailing: Icon(
                          Icons.person_add
                        ),
                      ),
                    ),
                  );
                },

              ),
            ],
          ),
        ),
      ),
    );
  }
}
