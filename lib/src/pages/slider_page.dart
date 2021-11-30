import 'package:flutter/material.dart';

class SliderPage extends StatefulWidget {
  @override
  _SliderPageState createState() => _SliderPageState();
}

class _SliderPageState extends State<SliderPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Slider'),
      ),
      body: Container(
        padding: EdgeInsets.only(top: 10.0),
        child: Column(
          children: [
            _crearSlider(),
            _checkbox(),
            _crearSwitch(),
            _crearImagen(),
          ],
        ),
      ),
    );
  }

  double _sliderValue = 100.0;
  Widget _crearSlider() {
    return Slider(
        activeColor: Colors.cyan,
        label: 'tamaño',
        value: _sliderValue,
        inactiveColor: Colors.cyanAccent,
        divisions: 1000,
        min: 0.0,
        max: 400.0,
        onChanged: (valor) {
          if (_bloqChek == true) {
            return null;
          }
          _sliderValue = valor;
          print(valor);
          setState(() {});
        });
  }

  bool _bloqChek = false;
  /*  Widget _checkbox() {
    return Checkbox(
        value: _bloqChek,
        onChanged: (valor) {
          _bloqChek = valor!;
          setState(() {});
        }); esta es una forma de hacerlo
  } */

  Widget _checkbox() {
    return CheckboxListTile(
        value: _bloqChek,
        activeColor: Colors.cyan,
        checkColor: Colors.white,
        contentPadding: EdgeInsets.symmetric(horizontal: 30.0),
        title: Text('Activar / Desactivar Slider'),
        onChanged: (valor) {
          _bloqChek = valor!;
          setState(() {});
        });
  }

  Widget _crearSwitch() {
    return SwitchListTile(
        value: _bloqChek,
        activeColor: Colors.cyan,
        contentPadding: EdgeInsets.symmetric(horizontal: 30.0),
        title: Text('Activar / Desactivar Slider'),
        onChanged: (valor) {
          _bloqChek = valor;
          setState(() {});
        });
  }

  Widget _crearImagen() {
    return Image(
        width: _sliderValue,
        fit: BoxFit.contain,
        image: NetworkImage(
            'https://static.wikia.nocookie.net/featteca/images/e/eb/Pre_TS_Perona.png/revision/latest/scale-to-width-down/500?cb=20210711204005&path-prefix=es'));
  }
}
