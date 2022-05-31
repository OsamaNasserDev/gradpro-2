import 'package:flutter/material.dart';
import 'package:gradpro/view_model/main_provider.dart';
import 'package:provider/provider.dart';

class Test extends StatelessWidget {
  const Test({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var mainProvider = Provider.of<MainProvider>(context);
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Text(mainProvider.text,style: TextStyle(fontSize: 18),),
        ),
      ),
    );
  }
}
