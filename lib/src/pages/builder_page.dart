import 'dart:async';

import 'package:flutter/material.dart';

class BuilderPage extends StatefulWidget {
  @override
  _BuilderPageState createState() => _BuilderPageState();
}

class _BuilderPageState extends State<BuilderPage> {
  ScrollController _scrollController = new ScrollController();
  List<String> _arrayNums = [];
  int _ultimoItem = 0;
  // ignore: unused_field
  bool _isLoading = false;

  //super initState
  @override
  void initState() {
    super.initState();
    _agregar10();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        // _agregar10();
        _cargaDeDatos();
      }
    });
  }

  //con este mato el controller
  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }

  //Scaffold
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('lista Builder'),
      ),
      body: Stack(
        children: [
          _crearLista(),
          _crearLoading(),
        ],
      ),
    );
  }

  //regreso mi lista
  Widget _crearLista() {
    return RefreshIndicator(
      onRefresh: _pullMetodo,
      child: ListView.builder(
        itemBuilder: (BuildContext context, int index) {
          final imageIndex = _arrayNums[index];
          return FadeInImage(
            placeholder: AssetImage('assets/jar-loading.gif'),
            image: NetworkImage(
                'https://picsum.photos/500/300?random=$imageIndex'),
          );
        },
        itemCount: _arrayNums.length,
        controller: _scrollController,
      ),
    );
  }

  //validar el loading bajo
  Widget _crearLoading() {
    if (_isLoading) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          SizedBox(height: 100.0),
          CircularProgressIndicator(
            color: Colors.amber[900],
          ),
        ],
      );
    } else {
      return Container();
    }
  }

  //con este cargo 10 items
  void _agregar10() {
    for (var i = 0; i < 10; i++) {
      _ultimoItem++;
      print(_ultimoItem);
      _arrayNums.add(_ultimoItem.toString());
    }
    setState(() {});
  }

  //doy tiempo para el empujon bajo1
  Future _cargaDeDatos() async {
    _isLoading = true;
    setState(() {});
    final duration = new Duration(seconds: 2);
    return new Timer(duration, _dataSecure);
  }

  //--bajo1
  void _dataSecure() {
    _isLoading = false;
    _scrollController.animateTo(
      _scrollController.position.pixels + 100,
      curve: Curves.fastOutSlowIn,
      duration: Duration(milliseconds: 250),
    );
    _agregar10();
  }

  //------- fin empujon

  //pull del metodo
  Future _pullMetodo() async {
    new Timer(
      Duration(seconds: 2),
      () {
        _arrayNums.clear();
        _ultimoItem++;
        _agregar10();
      },
    );
    return Future.delayed(Duration(seconds: 2));
  }
} //fin clase
