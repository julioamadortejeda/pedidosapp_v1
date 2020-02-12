import 'dart:convert';

OrderModel orderModelFromJson(String str) => OrderModel.fromJson(json.decode(str));

String rrderModelToJson(OrderModel data) => json.encode(data.toJson());

class OrderModel {
    String id;
    int orderNumber;
    DateTime startDate;
    DateTime endDate;
    double totalCost;
    double realCost;
    double gain;
    bool active;

    OrderModel({
        this.id,
        this.orderNumber,
        this.startDate,
        this.endDate,
        this.totalCost,
        this.realCost,
        this.gain,
        this.active,
    });

    factory OrderModel.fromJson(Map<String, dynamic> json) => OrderModel(
        id: json["id"],
        orderNumber: json["order_number"],
        startDate: json["start_date"],
        endDate: json["end_date"],
        totalCost: json["total_cost"],
        realCost: json["real_cost"],
        gain: json["gain"],
        active: json["active"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "order_number": orderNumber,
        "start_date": startDate,
        "end_date": endDate,
        "total_cost": totalCost,
        "real_cost": realCost,
        "gain": gain,
        "active": active,
    };
}
