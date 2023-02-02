import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:transicion_app/src/helpers/navigation_helpers.dart';

class Pagina2Page extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('Pagina 2'),
      ),
      backgroundColor: Colors.green,
      body: Center(
        child: Text('Pagina 2'),
      ),
    );
  }
}