import 'package:flutter/material.dart';

class MessagesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        // actions: <Widget>[
        //   new IconButton(
        //     icon: new Icon(Icons.close),
        //     onPressed: () => Navigator.of(context).pop(null),
        //   ),
        // ],
      ),
      body: Stack(
        children: <Widget>[_renderBackground()],
      ),
    );
  }

  Widget _renderBackground() {
    return Positioned.fill(
      child: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomRight,
          colors: [Colors.green, Color.fromRGBO(100, 224, 99, 1.0)],
        )
            //color: Colors.white
            ),
      ),
    );
  }
}
