import 'package:flutter/material.dart';

class CardItem extends StatelessWidget {
  final Widget child;

  CardItem({@required this.child});

  @override
  Widget build(BuildContext context) {
    return _cardTipo2(context);
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      elevation: 25.0,
      child: Container(
        height: MediaQuery.of(context).size.height * 0.6,
        width: MediaQuery.of(context).size.width - 130,
        child: Container(
          margin: EdgeInsets.only(bottom: 30.0),
          //color: Colors.blue,

          child: child,
        ),
      ),
    );
  }

  Widget _cardTipo2(BuildContext context) {
    final cardHeight = MediaQuery.of(context).size.height * 0.6;
    final cardWidth = MediaQuery.of(context).size.width * 0.65;
    final card = Container(
      height: cardHeight,
      width: cardWidth,
      //clipBehavior: Clip.antiAlias,
      child: child
    );

    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15.0),
          boxShadow: <BoxShadow>[
            BoxShadow(
                color: Colors.black26,
                blurRadius: 10.0,
                spreadRadius: 2.0,
                offset: Offset(2.0, 0.0))
          ]),
      child: ClipRRect(
        child: card,
        borderRadius: BorderRadius.circular(15.0),
      ),
    );
  }
}
