import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gradpro/presentation/main/widgets/search_bar.dart';
import 'package:gradpro/presentation/resources/values_manager.dart';

class RequestsScreen extends StatelessWidget {
  const RequestsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            searchBar(context),
            const SizedBox(height: 100
              ,),
            Padding(
              padding: const EdgeInsets.all(30.0),
              child: Icon(Icons.print,size: 140),
            ),
            const SizedBox(height: 10
              ,),
            Text("No requests yet",style: Theme.of(context).textTheme.displayLarge),
            const SizedBox(height: 10
              ,),
            Text("Reach out and start your project. Great things might happen",style: Theme.of(context).textTheme.bodyLarge),
            const SizedBox(height: 20
              ,),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                children: [
                  Expanded(
                    child: OutlinedButton(
                        onPressed: () {

                        },
                        child: const Padding(
                          padding: EdgeInsets.all(AppPadding.p12),
                          child: Text("Start anew request"),
                        )),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
