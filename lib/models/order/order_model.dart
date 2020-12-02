import 'package:json_annotation/json_annotation.dart';

part 'order_model.g.dart';

@JsonSerializable()
class OrderModel {
  String id,
      orderAmount,
      status,
      dateTime,
      fname,
      lname,
      img1,
      price,
      qty,
      noOfDays,
      total;

  OrderModel(this.id, this.orderAmount, this.status, this.dateTime, this.fname,
      this.lname, this.img1, this.price, this.qty, this.noOfDays, this.total);

  factory OrderModel.fromJson(Map<String, dynamic> json) =>
      _$OrderModelFromJson(json);
  Map<String, dynamic> toJson() => _$OrderModelToJson(this);
}
