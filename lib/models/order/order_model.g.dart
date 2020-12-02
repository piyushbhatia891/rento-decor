// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrderModel _$OrderModelFromJson(Map<String, dynamic> json) {
  return OrderModel(
    json['id'] as String,
    json['orderAmount'] as String,
    json['status'] as String,
    json['dateTime'] as String,
    json['fname'] as String,
    json['lname'] as String,
    json['img1'] as String,
    json['price'] as String,
    json['qty'] as String,
    json['noOfDays'] as String,
    json['total'] as String,
  );
}

Map<String, dynamic> _$OrderModelToJson(OrderModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'orderAmount': instance.orderAmount,
      'status': instance.status,
      'dateTime': instance.dateTime,
      'fname': instance.fname,
      'lname': instance.lname,
      'img1': instance.img1,
      'price': instance.price,
      'qty': instance.qty,
      'noOfDays': instance.noOfDays,
      'total': instance.total,
    };
