import 'package:flutter/material.dart';

/* 
  esta fue mi pagina de prueba ya no la necesito pero fue mi base
 */

class HomePageTemp extends StatelessWidget {
  final opciones = ['1', '2', '3', '4', '5', '6', '7', '8'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Componentes'),
      ),
      body: ListView(children: _crearItems()),
    );
  }

  List<Widget> _crearItems() {
    List<Widget> lista = [];
    for (String item in opciones) {
      final temWidget = ListTile(
        title: Text(item),
        subtitle: Text('holis'),
        leading: Icon(Icons.access_alarm_outlined),
        trailing: Icon(Icons.safety_divider),
      );
      lista
        ..add(temWidget)
        ..add(Divider(
          height: 25.0,
          indent: 1,
          thickness: 5.0,
          color: Colors.amber,
        ));
    }
    return lista;
  }
}
