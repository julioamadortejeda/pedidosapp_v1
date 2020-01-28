
import 'package:flutter/material.dart';
import 'package:pedidosapp_v1/src/models/pedido_detail_user.dart';

class ListPedidos {
 static List<PedidoDetailUser> listPedidos= [
   PedidoDetailUser(id: 1, image: 'assets/images/pedidos/p1.png', quantity: 1, size: 'S', background: LinearGradient(colors: [Colors.green, Colors.greenAccent])),
   PedidoDetailUser(id: 1, image: 'assets/images/pedidos/p2.png', quantity: 1, size: 'S', background: LinearGradient(colors: [Colors.red, Colors.redAccent])),
   PedidoDetailUser(id: 1, image: 'assets/images/pedidos/p3.png', quantity: 1, size: 'S', background: LinearGradient(colors: [Colors.yellow, Colors.yellowAccent])),
   PedidoDetailUser(id: 1, image: 'assets/images/pedidos/p4.png', quantity: 1, size: 'S', background: LinearGradient(colors: [Colors.pink, Colors.pinkAccent])),
   PedidoDetailUser(id: 1, image: 'assets/images/pedidos/p5.png', quantity: 1, size: 'S', background: LinearGradient(colors: [Colors.blue, Colors.blueAccent])),
 ];
}