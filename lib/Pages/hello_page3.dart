import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_novo/utils/nav.dart';
import 'package:flutter_novo/widgets/blue_button.dart';

class HelloPage3 extends StatelessWidget {
  const HelloPage3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Page 3"),
        leading: new IconButton(
            onPressed: () => pop(context,"Tela 3"),
            icon: new Icon(Icons.arrow_back)),
      ),
      body: _body(context),
    );
  }

  _body(context) {
    return Center(
      child: new BlueButton(
        "Voltar",
        onPressed:  () => pop(context,"Tela 3"),
        color: Colors.red,
      ),
    );
  }
}
