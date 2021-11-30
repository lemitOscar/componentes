import 'package:flutter/material.dart';

class AlertPage extends StatelessWidget {
  //const name({Key? key}) : super(key: key);

//ESTE ES EL BOTON DE LA ALERTA
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Alertas'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () => _mostrarAlerta(context),
          child: Text('Mostrar la alerta'),
          style: ElevatedButton.styleFrom(
              primary: Colors.red, shape: StadiumBorder()),
        ),
      ),
    );
  }

  //esta es la alerta
  void _mostrarAlerta(BuildContext context) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return AlertDialog(
          //dar forma
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),

          title: Text('Advertencia'),
          content: Column(mainAxisSize: MainAxisSize.min, children: [
            Text('esta es mi ventana modal, hehhe jiji'),
            FlutterLogo(
              size: 100.0,
            ),
            //aqui agregue los botones de la alerta
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(padding: EdgeInsets.symmetric(horizontal: 5.0)),
                ElevatedButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: Text('ok'),
                ),
                SizedBox(width: 10.0),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text('cancel'),
                )
              ],
            )
          ]),
        );
      },
    );
  }
}
