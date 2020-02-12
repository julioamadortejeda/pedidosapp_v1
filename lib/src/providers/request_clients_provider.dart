import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:pedidosapp_v1/src/Utils/firestore_names.dart';
import 'package:pedidosapp_v1/src/models/order.dart';

class RequestClientProvider {
  static Firestore _firestore = Firestore.instance;

  getCurrentOrder() {
    _firestore
        .collection(NamesCollections.orderCollection)
        .where('active', isEqualTo: true)
        .snapshots()
        .listen((data) => print(data.documents[0].data['order_number']));
  }

  OrderModel getOrder() {
    OrderModel orderModelTemp;
    _firestore
        .collection(NamesCollections.orderCollection)
        .where('active', isEqualTo: true)
        .limit(1)
        .snapshots()
        .listen((response) {
      if (response.documents.length != 1) {
        return null;
      }

      Map<String, dynamic> order = response.documents[0].data;
      print(order.toString());
      orderModelTemp = new OrderModel.fromJson(order);

      return orderModelTemp;
    });
  }
}
