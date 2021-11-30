import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class InputsPage extends StatefulWidget {
  InputsPage({Key? key}) : super(key: key);

  @override
  _InputsPageState createState() => _InputsPageState();
}

class _InputsPageState extends State<InputsPage> {
  //varibles
  String _txtNombre = '';
  String _txtFecha = '';
  TextEditingController _newController = new TextEditingController();

  List<String> _arrayOnePiece = [
    'choper',
    'luffy',
    'usopp',
    'robin',
    'zoro',
    'sanji',
    'perona'
  ];
  String _optLista = 'choper';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Inputs de texto'),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
        children: [
          _crearInput(),
          Divider(),
          _crearEmail(),
          Divider(),
          _crearPass(),
          Divider(),
          _crearFecha(context),
          Divider(),
          _crearCombo(),
        ],
      ),
    );
  }

  Widget _crearInput() {
    return TextField(
      textCapitalization: TextCapitalization.words,
      decoration: InputDecoration(
        counter: Text('letras ${_txtNombre.length}'),
        hintText: 'Ingresa tu nombre',
        labelText: 'Nombre',
        helperText: 'solo nombres',
        suffixIcon: Icon(Icons.verified_user),
        icon: Icon(Icons.accessibility_new),
        border: OutlineInputBorder(
          gapPadding: 1.5,
          borderRadius: BorderRadius.all(
            Radius.circular(15.0),
          ),
        ),
      ),
      onChanged: (valor) {
        _txtNombre = valor;
        print(_txtNombre);
        setState(() {});
      },
    );
  }

  Widget _crearEmail() {
    return TextField(
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        hintText: 'Ingresa tu correo',
        labelText: 'Mail',
        helperText: 'solo correo',
        suffixIcon: Icon(Icons.email),
        icon: Icon(Icons.emoji_emotions),
        border: OutlineInputBorder(
          gapPadding: 1.5,
          borderRadius: BorderRadius.all(
            Radius.circular(15.0),
          ),
        ),
      ),
      onChanged: (valor) {
        _txtNombre = valor;
        print(_txtNombre);
        setState(() {});
      },
    );
  }

  Widget _crearPass() {
    return TextField(
      obscureText: true,
      decoration: InputDecoration(
        hintText: 'Ingresa tu contraseña',
        labelText: 'Password',
        helperText: 'solo contraseña',
        suffixIcon: Icon(Icons.password),
        icon: Icon(Icons.password),
        border: OutlineInputBorder(
          gapPadding: 1.5,
          borderRadius: BorderRadius.all(
            Radius.circular(15.0),
          ),
        ),
      ),
      onChanged: (valor) {
        _txtNombre = valor;
        print(_txtNombre);
        setState(() {});
      },
    );
  }

  Widget _crearFecha(BuildContext context) {
    return TextField(
      enableInteractiveSelection: false,
      controller: _newController,
      decoration: InputDecoration(
        hintText: 'Ingresa la fecha',
        labelText: 'Fecha',
        helperText: 'solo Fecha',
        suffixIcon: Icon(Icons.date_range),
        icon: Icon(Icons.date_range_sharp),
        border: OutlineInputBorder(
          gapPadding: 1.5,
          borderRadius: BorderRadius.all(
            Radius.circular(15.0),
          ),
        ),
      ),
      onTap: () {
        FocusScope.of(context).requestFocus(new FocusNode());
        _selectDate(context);
      },
    );
  }

  List<DropdownMenuItem<String>> getOptionsDrop() {
    List<DropdownMenuItem<String>> lista = [];
    for (var item in _arrayOnePiece) {
      lista.add(DropdownMenuItem(
        child: Text(item),
        value: item,
      ));
    }
    return lista;
  }

  Widget _crearCombo() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(Icons.satellite),
        SizedBox(
          width: 10.0,
        ),
        DropdownButton(
          items: getOptionsDrop(),
          value: _optLista,
          onChanged: (opt) {
            print(opt);
            setState(() {
              _optLista = opt.toString();
            });
          },
        )
      ],
    );
  }

  void _selectDate(BuildContext context) async {
    DateTime? pick = await showDatePicker(
        context: context,
        initialDate: new DateTime.now(),
        firstDate: new DateTime(2018),
        lastDate: new DateTime(2025));
    if (pick != null) {
      _txtFecha = DateFormat('yyyy-MM-dd').format(pick);
      _newController.text = _txtFecha;
    }
  }
}
