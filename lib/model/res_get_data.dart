// To parse this JSON data, do
//
//     final resGetData = resGetDataFromJson(jsonString);

import 'dart:convert';

ResGetData resGetDataFromJson(String str) =>
    ResGetData.fromJson(json.decode(str));

String resGetDataToJson(ResGetData data) => json.encode(data.toJson());

class ResGetData {
  ResGetData({
    this.isSucces,
    this.message,
    this.data,
  });

  bool? isSucces;
  String? message;
  List<Data>? data;

  factory ResGetData.fromJson(Map<String, dynamic> json) => ResGetData(
        isSucces: json["is succes"] == null ? null : json["is succes"],
        message: json["message"] == null ? null : json["message"],
        data: json["data"] == null
            ? null
            : List<Data>.from(json["data"].map((x) => Data.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "is succes": isSucces == null ? null : isSucces,
        "message": message == null ? null : message,
        "data": data == null
            ? null
            : List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class Data {
  Data({
    this.id,
    this.itemCode,
    this.itemName,
    this.price,
    this.stock,
  });

  String? id;
  String? itemCode;
  String? itemName;
  String? price;
  String? stock;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"] == null ? null : json["id"],
        itemCode: json["item_code"] == null ? null : json["item_code"],
        itemName: json["item_name"] == null ? null : json["item_name"],
        price: json["price"] == null ? null : json["price"],
        stock: json["stock"] == null ? null : json["stock"],
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "item_code": itemCode == null ? null : itemCode,
        "item_name": itemName == null ? null : itemName,
        "price": price == null ? null : price,
        "stock": stock == null ? null : stock,
      };
}
