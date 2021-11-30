import 'package:componentes/src/providers/menu_provider.dart';
import 'package:componentes/src/utils/icon_string.dart';

//->dart
import 'package:flutter/material.dart';

//este es el principal donde se llama
class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true, title: Text('Menu Principal')),
      body: _lista(),
    );
  }

  //esta es mi precarga asyncrona
  Widget _lista() {
    return FutureBuilder(
      future: menuProvider.cargardatos(),
      //inciamos datos
      builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
        return ListView(
          children: _listaItems(snapshot.data, context),
        );
      },
    );
  }

  //aqui se llenan los datos de mi lista
  List<Widget> _listaItems(List<dynamic>? data, BuildContext context) {
    final List<Widget> opciones = [];
    if (data != null) {
      data.forEach((opt) {
        final widgetTemp = ListTile(
          title: Text(opt['texto']),
          leading: getIcon(opt['icon']),
          trailing: Icon(Icons.arrow_right),
          onTap: () {
            /* final route = MaterialPageRoute(builder: (context) {
              return AlertPage();
            }); 
            Navigator.push(context, route); esto nomas para una ruta casi no se usa */
            Navigator.pushNamed(context, opt['ruta']);
          },
        );
        opciones
          ..add(widgetTemp)
          ..add(Divider(
            thickness: 1.3,
          ));
      });
    }

    return opciones;
  }
}
