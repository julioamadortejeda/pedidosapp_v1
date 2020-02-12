import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:pedidosapp_v1/src/models/order.dart';
import 'package:pedidosapp_v1/src/providers/request_clients_provider.dart';

class TestPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final RequestClientProvider requestClientProvider = new RequestClientProvider();
    final OrderModel o = requestClientProvider.getOrder();

    return Scaffold(
      appBar: AppBar(),
      body: StreamBuilder<QuerySnapshot>(
        stream: Firestore.instance.collection('clients').snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) return new Text('Error: ${snapshot.error}');
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
              return new Text('Loading...');
            default:
              print(o.toString());
              return new ListView(
                children:
                    snapshot.data.documents.map((DocumentSnapshot document) {
                  return new ListTile(
                    title: new Text(document['name']),
                    subtitle: new Text(document['phone']),
                  );
                }).toList(),
              );
          }
        },
      ),
    );
  }
}
