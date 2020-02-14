import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:pedidosapp_v1/src/Utils/firestore_names.dart';

class OrderProvider {

  Firestore _firestore = Firestore.instance;

  Future<QuerySnapshot> getCurrentOrder() {
    return _firestore.collection(NamesCollections.orderCollection)
                      .where('active', isEqualTo: true).getDocuments();
  }

}