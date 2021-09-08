import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_novo/utils/nav.dart';

import 'dog_page.dart';

class Dog {
  late String nome;
  late String foto;

  Dog(this.nome, this.foto);
}

class HelloListView extends StatefulWidget {
  @override
  _HelloListViewState createState() => _HelloListViewState();
}

class _HelloListViewState extends State<HelloListView> {
  bool _gridView = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Hello Listview"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.list),
            onPressed: () {
              print("Lista");
              setState(() {
                _gridView = false;
              });
            },
          ),
          IconButton(
            icon: Icon(Icons.grid_on),
            onPressed: () {
              print("Grid");
              setState(() {
                _gridView = true;
              });
            },
          ),
        ],
        leading: new IconButton(
            onPressed: () => pop(context, "Tela 2"),
            icon: new Icon(Icons.arrow_back)),
      ),
      body: _body(),
    );
  }

  _body() {
    List<Dog> dogs = [
      Dog("Jack Russel", "assets/images/dog1.png"),
      Dog("Labrador", "assets/images/dog2.png"),
      Dog("Pug", "assets/images/dog3.png"),
      Dog("Rottweiler", "assets/images/dog4.png"),
      Dog("Pastor", "assets/images/dog5.png"),
    ];
    //return ListView( itemExtent:350, children: imgs, );
    if (_gridView) {
      return GridView.builder(
          gridDelegate:
          SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
          itemCount: dogs.length,
          itemBuilder: (context, index) {
            return _itemView(dogs, index);
          });
    } else {
      return ListView.builder(
          itemCount: dogs.length,
          itemExtent: 350,
          itemBuilder: (context, index) {
            return _listView(dogs, index);
          });
    }
  }

  _listView(List<Dog> dogs, index) {
    Dog dog = dogs[index];
    return GestureDetector(
     onTap: ()
    {
      push(context, DogPage(dog));
    },
    child:Stack(
    // expande o Stack, por que com o Stack o que ta dentro do _img não consegue expandir
    fit: StackFit.expand,
    children: <Widget>[
    _img(dog.foto),
    _nomecao(dog),
    ]));
  }

  _itemView(List<Dog> dogs, int index) {
    Dog dog = dogs[index];
    return GestureDetector(
      onTap: () {
        push(context, DogPage(dog));
      },
      child: Stack(
        // expande o Stack, por que com o Stack o que ta dentro do _img não consegue expandir
          fit: StackFit.expand,
          children: <Widget>[
            _img(dog.foto),
            _nomecao(dog),
          ]),
    );
  }

  Align _nomecao(Dog dog) {
    return Align(
      //adicionei o Align para usar o alignment alinhar o nome do cachorro
      alignment: Alignment.topCenter,
      child: Container(
        margin: EdgeInsets.all(12),
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Colors.black45,
          //arredonda o campo
          borderRadius: BorderRadius.circular(16),
        ),
        child: Text(
          dog.nome,
          style: TextStyle(fontSize: 26, color: Colors.white),
        ),
      ),
    );
  }

  _img(String img) {
    return Image.asset(img, width: 300, height: 300, fit: BoxFit.cover);
  }
}
