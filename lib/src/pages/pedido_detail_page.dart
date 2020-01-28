import 'package:flutter/material.dart';

//Custom imports
import 'package:pedidosapp_v1/src/models/list_pedidos.dart';
import 'package:pedidosapp_v1/src/pages/page.dart';
import 'package:pedidosapp_v1/src/widgets/card_item.dart';
import 'package:pedidosapp_v1/src/widgets/pager.dart';
import 'package:pedidosapp_v1/src/widgets/pedido_widget.dart';

class PedidoDetail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: MenuPager(children: ListPedidos.listPedidos.map(
                (pedido) => Page(
                      title: "TU PEDIDO",
                      background: pedido.background,
                      icon: null,
                      child: CardItem(
                        child: PedidoWidget(pedido: pedido,)
                      ),
                    ),
              )
              .toList(),)
      ),      
    );
  }
}