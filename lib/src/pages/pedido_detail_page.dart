import 'package:flutter/material.dart';
import 'package:pedidosapp_v1/src/models/aliments.dart';
import 'package:pedidosapp_v1/src/pages/page.dart';
import 'package:pedidosapp_v1/src/widgets/aliment.dart';
import 'package:pedidosapp_v1/src/widgets/card_item.dart';
import 'package:pedidosapp_v1/src/widgets/pager.dart';

class PedidoDetail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: MenuPager(children: Aliments.aliments.map(
                (aliment) => Page(
                      title: "HOW TO BURN OFF",
                      background: aliment.background,
                      icon: aliment.bottomImage,
                      child: CardItem(
                        child: Container(
                          color: Colors.yellow,
                          width: 100.0,
                          height: 100.0,
                        )
                      ),
                    ),
              )
              .toList(),)
      ),      
    );
  }
}