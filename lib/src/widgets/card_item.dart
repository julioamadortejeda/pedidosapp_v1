import 'package:flutter/material.dart';

class CardItem extends StatelessWidget {
  final Widget child;

  CardItem({@required this.child});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      elevation: 25.0,
      child: Container(
        height: MediaQuery.of(context).size.height - 50,
        width: MediaQuery.of(context).size.width - 150,
        child: Container(
          margin: EdgeInsets.only(top: 30.0, bottom: 30.0),
          color: Colors.blue,
          child: Container(
            //color: Colors.red,
            width: 50.0,
            height: 50.0,
          ),
        ),
      ),
    );
  }
}
