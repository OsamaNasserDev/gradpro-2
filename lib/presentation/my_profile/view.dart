import 'package:flutter/material.dart';
import 'package:gradpro/presentation/resources/routes_manger.dart';

class MyProfileScreen extends StatelessWidget {
  const MyProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          if (true)
            IconButton(
                onPressed: () =>
                    Navigator.pushNamed(context, Routes.updateProfileRoute),
                icon: Icon(Icons.edit))
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Container(
                height: 190,
                child: Stack(
                  alignment: AlignmentDirectional.bottomCenter,
                  children: [
                    Align(
                      alignment: AlignmentDirectional.topCenter,
                      child: Card(
                        clipBehavior: Clip.hardEdge,
                        elevation: 0,
                        child: Image(
                          image: NetworkImage(
                              "https://images.pexels.com/photos/3769021/pexels-photo-3769021.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1"),
                          fit: BoxFit.cover,
                          height: 140,
                          width: double.infinity,
                        ),
                      ),
                    ),
                    CircleAvatar(
                      radius: 64,
                      backgroundColor:
                          Theme.of(context).scaffoldBackgroundColor,
                      child: CircleAvatar(
                        radius: 60.0,
                        backgroundImage: NetworkImage(
                          "https://images.pexels.com/photos/3769021/pexels-photo-3769021.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Text('Username', style: Theme.of(context).textTheme.displayLarge),
              const SizedBox(
                height: 10,
              ),
              Text('bio...', style: Theme.of(context).textTheme.bodyLarge),
              Text("Languages"),
              Text("Tools"),
              Text("Soft skills"),
              Text("Others"),
            ],
          ),
        ),
      ),
    );
  }
}
