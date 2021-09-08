import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_novo/utils/nav.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'Pages/hello_listview.dart';
import 'Pages/hello_page1.dart';
import 'Pages/hello_page2.dart';
import 'Pages/hello_page3.dart';
import 'drawer_list.dart';
import 'widgets/blue_button.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      //Quantidade de Abas
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "Hello Flutter",
          ),
          bottom: TabBar(tabs:[
            Tab(text: "Aba 1"),
            Tab(text: "Aba 2"),
            Tab(text: "Aba 3"),
          ]),
          centerTitle: true,
        ),
        body: TabBarView(children: [
          _body(context),
          Container(
            color: Colors.green,
          ),
          Container(
            color: Colors.cyan,
          ),

        ]) ,
        floatingActionButton: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            FloatingActionButton(
                onPressed: () {
                  _clickFab();
                },
                child: Icon(Icons.add)),
            SizedBox(
            width: 16,
            ),
            FloatingActionButton(
                onPressed: () {
                  _clickFab();
                },
                child: Icon(Icons.favorite))

          ],

        ),
        drawer: DrawerList(

        ),
      ),
    );
  }



  _body(context) {
    Size size = MediaQuery
        .of(context)
        .size;
    //Barra de Rolagem
    return SingleChildScrollView(
      // width: size.width,
      //  margin: EdgeInsets.only(left: 10, top: 10,right: 10, bottom: 10),
      //  color: Colors.yellow,
      child: Container(
        padding: EdgeInsets.only(top: 16),
        width: size.width,
        height: size.height,
        margin: EdgeInsets.only(left: 10, top: 10, right: 10, bottom: 10),
        color: Colors.yellow,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            _text(),
            _pageView(),
            _buttons(),
          ],
        ),
      ),
    );
  }

  _pageView() {
    return Container(
      margin: EdgeInsets.all(10),
      height: 300,
      child: PageView(
        children: <Widget>[
          _img("assets/images/dog1.png"),
          _img("assets/images/dog2.png"),
          _img("assets/images/dog3.png"),
          _img("assets/images/dog4.png"),
          _img("assets/images/dog5.png"),
        ],
      ),
    );
  }

  _buttons() {
    //Sempre que não tiver o contexto e precisar criar o contexto adiciona o Builder
    return Builder(builder: (context) {
      return Column(children: <Widget>[
        Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              new BlueButton("ListView",
                  onPressed: () => _onClickNavigator(context, HelloListView())),
              new BlueButton("Page 2",
                  onPressed: () => _onClickNavigator(context, HelloPage2())),
              new BlueButton("Page 3",
                  onPressed: () => _onClickNavigator(context, HelloPage3())),
            ]),
        Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              new BlueButton("Snack", onPressed: () => _onClickSnack(context)),
              new BlueButton("Dialog",
                  onPressed: () => _onClickDialog(context)),
              new BlueButton("Toast", onPressed: _onClickToast),
            ]),
      ]);
    });
  }

  Future<void> _onClickSnack(context) async {
    Future.delayed(Duration.zero, () async {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("Mensagem Padrão"),
        action: SnackBarAction(
            label: "Ok",
            onPressed: () {
              print("ok");
            }),
      ));
    });
  }

  _onClickDialog(context) {
    //showDialog ele faz um PUSH por isso é preciso chamar o pop para fecha-lo
    showDialog(
      // Não permite que feche o dialg quando clicar fora
        barrierDismissible: false,
        context: context,
        builder: (context) {
          //adicionando o WillPopScope e onWillPop: () async => false evita fechar o dialog clicando no voltar do android.
          return WillPopScope(
            onWillPop: () async => false,
            child: AlertDialog(
              title: Text("Alerta Vermelho"),
              actions: <Widget>[
                TextButton(
                    onPressed: () {
                      print("Cancelar!");
                      Navigator.pop(context);
                    },
                    child: Text("Cancelar")),
                TextButton(
                    onPressed: () {
                      print("OK!");
                      Navigator.pop(context);
                    },
                    child: Text("OK")),
              ],
            ),
          );
        });
  }

  _onClickToast() {
    Fluttertoast.showToast(
        msg: "Notificação de Teste",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0);
  }

  _onClickNavigator(context, Widget page) async {
    String x = "";
    x = await push(context, page);
    print(x);
  }

  _button(String text, context, VoidCallback onPressed) {
    return BlueButton(text, onPressed: onPressed);
  }

  _onClickOk(context) {
    Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) {
      return HelloPage1();
    }));
  }

  _text() {
    return Text(
      "Hello Word",
      style: TextStyle(
        fontSize: 30,
        color: Colors.blue,
        fontWeight: FontWeight.bold,
        fontStyle: FontStyle.italic,
        decoration: TextDecoration.underline,
        decorationColor: Colors.red,
        decorationStyle: TextDecorationStyle.wavy,
      ),
    );
  }

  _img(String img) {
    return Image.asset(img,
        width: 300,
        height: 300,
        //expande as imagens BoxFit.cover
        fit: BoxFit.cover);
  }

  void _clickFab() {


  }
}
