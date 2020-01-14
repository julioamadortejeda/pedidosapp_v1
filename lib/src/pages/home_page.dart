import 'package:flutter/material.dart';

//Custom imports
import 'package:pedidosapp_v1/src/models/message.dart';
import 'package:pedidosapp_v1/src/models/messages.dart';
import 'package:pedidosapp_v1/src/models/pedido.dart';

class HomePage extends StatelessWidget {
  final pedido = new Pedido(
      id: 3598,
      activo: true,
      fechaFin: DateTime.now().add(Duration(days: 5)),
      fechaInicio: DateTime.now());

  final List<Message> messages = Messages.messages;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //body: _listatest(context),
      body: Stack(
        children: <Widget>[_renderBackground(), _renderCards(context)],
      ),
    );
  }

  Widget _renderBackground() {
    return Positioned.fill(
      child: Container(
        decoration: BoxDecoration(
          gradient: pedido.background,
          //color: Colors.white
        ),
      ),
    );
  }

  Widget _renderCards(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Column(
      children: <Widget>[
        _renderAppName(context, size),
        _renderPedidoCard(context, size),
        Expanded(child: Container()),
        _renderCardMessage(context, size)
      ],
    );
  }

  Widget _renderAppName(BuildContext context, Size size) {
    return SafeArea(
      child: Container(
        margin: EdgeInsets.only(top: size.height * 0.05),
        child: Text(
          'PEDIDOS SHEIN',
          style: TextStyle(
              fontSize: 40.0, fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ),
    );
  }

  Widget _renderPedidoCard(BuildContext context, Size size) {
    //final size = MediaQuery.of(context).size;
    print(size.height);
    return Container(
      padding:
          EdgeInsets.only(left: 50.0, right: 50.0, top: size.height * 0.05),
      //color: Colors.red,
      //margin: EdgeInsets.only(bottom: 10.0),
      height: size.height * (size.height < 600 ? 0.65 : 0.60),
      child: Card(
        elevation: 5.0,
        //color: Colors.white,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
        child: InkWell(
          splashColor: pedido.color.withAlpha(255),
          onTap: () {},
          child: Column(children: <Widget>[
            Container(
              padding: EdgeInsets.only(top: size.height * 0.03),
              child: Text(
                'Pedido #${pedido.id}',
                style: TextStyle(
                    fontFamily: 'Dosis',
                    color: pedido.color,
                    fontSize: 30.0,
                    fontWeight: FontWeight.w400),
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: size.height * 0.01),
              child: Text(
                pedido.estatus,
                style: TextStyle(
                    fontFamily: 'Dosis',
                    color: pedido.color,
                    fontSize: 40.0,
                    fontWeight: FontWeight.w600),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(
                  horizontal: 70.0, vertical: size.height * 0.02),
              child: FadeInImage(
                width: double.infinity,
                image: AssetImage(pedido.image),
                placeholder: AssetImage('assets/images/loader.gif'),
                fadeInDuration: Duration(milliseconds: 200),
                fit: BoxFit.fill,
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: size.height * 0.01),
              child: Text(
                'Termina en:',
                style: TextStyle(
                    fontFamily: 'Dosis',
                    fontSize: 24.0,
                    fontWeight: FontWeight.w300,
                    color: pedido.color),
              ),
            ),
            //SizedBox(height: size.height * 0.01,),
            Text(
              '3D 2H 60M 53S',
              style: TextStyle(
                  fontFamily: 'Dosis',
                  fontSize: 36.0,
                  fontWeight: FontWeight.bold,
                  color: pedido.color.withAlpha(200)),
            ),
          ]),
        ),
      ),
    );
  }

  Widget _renderCardMessage(BuildContext context, Size size) {
    final size = MediaQuery.of(context).size;

    return Container(
      // padding: EdgeInsets.all(2.0),
      //width: double.infinity,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.vertical(top: Radius.circular(10.0)),
          color: Colors.white),
      //padding: EdgeInsets.symmetric(horizontal: 50.0),
      height: size.height * 0.1,
      child: Material(
        color: Colors.transparent,
        borderOnForeground: false,
        child: InkWell(
          splashColor: pedido.color,
          onTap: () {},
          child: Center(
            child: Text(
              'Mensajes',
              style: TextStyle(
                  fontSize: 30.0,
                  color: pedido.color,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ),
    );
  }

  Widget _crearLista(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      itemCount: messages.length,
      itemBuilder: (BuildContext context, int index) {
        return Material(
          color: Colors.transparent,
          child: ListTile(
            title: Text('Entry ${messages[index].title}'),
            subtitle: Text(messages[index].subTitle),
            trailing:
                Icon(Icons.keyboard_arrow_right, color: messages[index].color),
            leading: ClipRRect(
                borderRadius: BorderRadius.circular(10.0),
                child: Image(
                  height: 40.0,
                  width: 40.0,
                  image: AssetImage(messages[index].imageType),
                )),
            onTap: () {
              print(messages[index].message);
            },
          ),
        );
      },
      separatorBuilder: (BuildContext context, int index) => Divider(
        color: Colors.transparent,
        height: 0.0,
      ),
    );
  }
}
