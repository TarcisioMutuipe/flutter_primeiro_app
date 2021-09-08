import 'package:flutter/material.dart';
import 'package:flutter_novo/Pages/hello_page2.dart';
import 'package:flutter_novo/widgets/blue_button.dart';

import 'nav.dart';

class SoApresentandoNaoUsado extends StatelessWidget {
  const SoApresentandoNaoUsado({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }

  _body2(context) {
//obten o tamanho da tela já que é o contexto do HomePage
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height,
      color: Colors.yellow,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          _button(
              "ok", context, () => _onClickNavigator(context, HelloPage2())),
          _button(
              "ok", context, () => _onClickNavigator(context, HelloPage2())),
          _button(
              "ok", context, () => _onClickNavigator(context, HelloPage2())),
        ],
      ),
    );
  }

  _body3(context) {
    return Column(
      children: <Widget>[
        // Separar a pagina para ocupar todo espaço
        Expanded(
          flex: 7,
          child: _pageView(),
        ),
        Expanded(
          //porcentagem da tela flex
          flex: 3,
          child: _pageView(),
        ),
      ],
    );
  }
  _onClickNavigator(context, Widget page) async {
    String x = "";
    x = await push(context, page);
    print(x);
  }

  _button(String text, context, VoidCallback onPressed) {
    return BlueButton(text, onPressed: onPressed);
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

  _img(String img) {
    return Image.asset(img,
        width: 300,
        height: 300,
        //expande as imagens BoxFit.cover
        fit: BoxFit.cover);
  }
}
