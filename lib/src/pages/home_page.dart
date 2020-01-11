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
    return Column(
      children: <Widget>[
        _renderPedidoCard(context),
        Expanded(child: Container()),
        _renderCardMessage(context)
      ],
    );
  }

  Widget _renderPedidoCard(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SafeArea(
      child: Container(
        padding: EdgeInsets.only(left: 50.0, right: 50.0, top: 50.0),
        //margin: EdgeInsets.only(bottom: 10.0),
        height: size.height * 0.5,
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
                padding: EdgeInsets.only(top: 20.0),
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
                padding: EdgeInsets.only(top: 5.0),
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
                margin: EdgeInsets.symmetric(horizontal: 70.0, vertical: 20.0),
                child: FadeInImage(
                  width: double.infinity,
                  image: AssetImage(pedido.image),
                  placeholder: AssetImage('assets/images/loader.gif'),
                  fadeInDuration: Duration(milliseconds: 200),
                  fit: BoxFit.fill,
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 10.0),
                child: Text(
                  'Termina en: 3D 2H 60M 53S',
                  style: TextStyle(
                      fontFamily: 'Dosis',
                      fontSize: 24.0,
                      fontWeight: FontWeight.w400,
                      color: pedido.color.withAlpha(200)),
                ),
              )
            ]),
          ),
        ),
      ),
    );
  }

  Widget _renderCardMessage(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
            //padding: EdgeInsets.only(left: 20.0),
            child: Center(
              child: Text(
                'Mensajes',
                style: TextStyle(
                    fontSize: 30.0,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
            )),
        SizedBox(
          height: 10.0,
        ),
        Container(
          //width: double.infinity,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0), color: Colors.white),
          //padding: EdgeInsets.symmetric(horizontal: 50.0),
          height: size.height * 0.35,
          child: _crearLista(context),
        )
      ],
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
            trailing: Icon(Icons.keyboard_arrow_right, color: messages[index].color),
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
