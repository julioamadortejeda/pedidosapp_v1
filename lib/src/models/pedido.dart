import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Pedido {
  final int id;
  final bool activo;
  final DateTime fechaInicio;
  final DateTime fechaFin;
  String image;
  LinearGradient background;
  Color color;
  String estatus;

  Pedido({this.id, this.activo, this.fechaFin, this.fechaInicio}) {
    if (this.activo) {
      image = 'assets/images/ok.png';
      color = Colors.green;
      estatus  ='Abierto';

      background = LinearGradient(
        begin: Alignment.topRight,
        end: Alignment.bottomLeft,
        colors: [
          Colors.green,
          Color.fromRGBO(100, 224, 99, 1.0)
        ],
      );
      
    } else {
      image = 'assets/images/cancel.png';
      color = Colors.red;
      estatus = 'Cerrado';

      background = LinearGradient(
        begin: Alignment.topRight,
        end: Alignment.bottomLeft,
        colors: [
          Colors.red,
          Color.fromRGBO(255, 87, 51, 1.0)
        ],
      );
      
    }
  }
}
