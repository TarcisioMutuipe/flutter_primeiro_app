import 'package:flutter/material.dart';
import 'package:flutter_novo/utils/nav.dart';
class HelloPage1 extends StatelessWidget {
  const HelloPage1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
       title: Text("Page 1") ,
        leading: new IconButton(
            onPressed: () => pop(context,"Tela 1"),
            icon: new Icon(Icons.arrow_back)),
      ),
    );
  }
}
