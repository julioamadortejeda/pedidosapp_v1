import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:pedidosapp_v1/src/models/pedido.dart';
import 'package:pedidosapp_v1/src/models/pedido_detail_user.dart';

class PedidoWidget extends StatelessWidget {
  // final LinearGradient theme;
  final PedidoDetailUser pedido;
  // final VoidCallback increment;
  // final VoidCallback decrement;

  PedidoWidget({
    @required this.pedido,
    //@required this.theme
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Column(
      children: <Widget>[
        FadeInImage(
            //image: NetworkImage('https://i.redd.it/1w6s6g3613f31.jpg'),
            image: AssetImage(pedido.image),
            placeholder: AssetImage('assets/images/loader.gif'),
            fadeInDuration: Duration(milliseconds: 200),
            height: size.height * 0.4,
            width: double.infinity,
            fit: BoxFit.fill),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
        ),
        Container(padding: EdgeInsets.all(10.0), child: Text('Algo'))
      ],
    );
    
    return Column(
      //mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Image(
          image: AssetImage('assets/images/pedidos/p1.png'),
        ),
        // Container(
        //   child: Column(
        //     children: <Widget>[
        //       Text(aliment.name,
        //           style: TextStyle(
        //               fontSize: 60.0,
        //               fontWeight: FontWeight.w700,
        //               fontFamily: 'Qwigley')),
        //       Padding(
        //         padding: EdgeInsets.only(top: 15.0),
        //         child: Text("• " + aliment.subtitle + " •",
        //           style: TextStyle(
        //               color: Colors.black,
        //               fontSize: 17.0,
        //               fontFamily: 'Dosis',
        //               fontWeight: FontWeight.w400),
        //         ),
        //       ),
        //     ],
        //   ),
        // ),
        // Row(
        //   mainAxisAlignment: MainAxisAlignment.center,
        //   children: <Widget>[
        //     Container(
        //       decoration: BoxDecoration(
        //           color: theme.colors[0]
        //       ),
        //       width: 70,
        //       height: 1.0,
        //     ),
        //     Container(
        //       child: OutlineButton(
        //         borderSide: BorderSide(color: theme.colors[0]),
        //         onPressed: () => null,
        //         shape: StadiumBorder(),
        //         child: SizedBox(
        //           width: 60.0,
        //           height: 45.0,
        //           child: Center(
        //               child: Text('${aliment.totalCalories.toInt()}' + "cal",
        //                   style: TextStyle(
        //                       color: theme.colors[0],
        //                       fontSize: 17.0,
        //                       fontWeight: FontWeight.w400
        //                   ),
        //                   textAlign: TextAlign.center)),
        //         ),
        //       ),
        //     ),
        //     Container(
        //       decoration: BoxDecoration(
        //           color: theme.colors[0]
        //       ),
        //       width: 70,
        //       height: 1.0,
        //     ),
        //   ],
        // ),
        // Container(
        //     child: Row(
        //       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        //       children: <Widget>[
        //         Column(
        //           children: <Widget>[
        //             SvgPicture.asset(
        //               "assets/images/running.svg",
        //               width: 30.0,
        //               height: 30.0,
        //             ),
        //             Padding(
        //               padding: EdgeInsets.only(top: 8.0),
        //               child: Text('${aliment.runTime.toInt()}' + " min"),
        //             ),
        //           ],
        //         ),
        //         Column(
        //           children: <Widget>[
        //             SvgPicture.asset(
        //               "assets/images/bicycle.svg",
        //               width: 30.0,
        //               height: 30.0,
        //             ),
        //             Padding(
        //               padding: EdgeInsets.only(top: 8.0),
        //               child: Text('${aliment.bikeTime.toInt()}' + " min"),
        //             ),
        //           ],
        //         ),
        //         Column(
        //           children: <Widget>[
        //             SvgPicture.asset(
        //               "assets/images/swim.svg",
        //               width: 30.0,
        //               height: 30.0,
        //             ),
        //             Padding(
        //               padding: EdgeInsets.only(top: 8.0),
        //               child: Text('${aliment.swimTime.toInt()}' + " min"),
        //             ),
        //           ],
        //         ),
        //         Column(
        //           children: <Widget>[
        //             SvgPicture.asset(
        //               "assets/images/workout.svg",
        //               width: 30.0,
        //               height: 30.0,
        //             ),
        //             Padding(
        //               padding: EdgeInsets.only(top: 8.0),
        //               child: Text('${aliment.workoutTime.toInt()}' + " min"),
        //             ),
        //           ],
        //         ),
        //       ],
        //     )
        // ),
      ],
    );
  }
}
