import 'package:flutter/material.dart';


class ProjectDetails extends StatelessWidget {
  const ProjectDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Project title")),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("""It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like)."""),
              SizedBox(height: 30,),
              Text("Project History"),
              Divider(thickness: 1.5),
              SizedBox(height: 30,),
              Row(

                children: [
                  Icon(Icons.person,size: 60),
                  SizedBox(width: 8,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Project Team"),
                      Text("menna , marya , mahy"),
                      Text("2019"),
                    ],
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}


