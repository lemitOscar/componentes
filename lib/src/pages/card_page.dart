import 'package:flutter/material.dart';

class CardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cards'),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 5.5),
        children: [
          _cardTipo1(),
          _cardTipo2(),
        ],
      ),
    );
  }

  _cardTipo1() {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 10.0),
      elevation: 15.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      child: Column(
        children: [
          ListTile(
            leading: Icon(Icons.photo_album, color: Colors.blue),
            title: Text('Welcome'),
            subtitle: Text('Welcome a my first card jijis'),
          ),
          //unos botones
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(onPressed: () {}, child: Text('Ver')),
              TextButton(onPressed: () {}, child: Text('Condiciones')),
            ],
          )
        ],
      ),
    );
  }

  _cardTipo2() {
    /* 
      esta tarjeta tiene problemas por la imagen por eso
      vamos a adabtar un contenendor
    */
    //ahora esta es mi tarjeta
    return Card(
      margin: EdgeInsets.symmetric(vertical: 10.0),
      clipBehavior: Clip.antiAlias,
      elevation: 15.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      child: Column(
        children: [
          FadeInImage(
            placeholder: AssetImage('assets/jar-loading.gif'),
            image: NetworkImage(
                'https://w.wallhaven.cc/full/z8/wallhaven-z8dg9y.png'),
            fadeInDuration: Duration(milliseconds: 90),
            height: 300.0,
            fit: BoxFit.cover,
          ),
          //texto de la card
          Container(
            padding: EdgeInsets.all(10.0),
            child: Text('Skypea'),
          )
        ],
      ),
    );
  }
}
