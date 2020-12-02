import 'package:json_annotation/json_annotation.dart';

part 'cat_model.g.dart';

@JsonSerializable()
class Category {
  String id, categoryName, type, status, isDeleted;
  Category(this.id, this.categoryName, this.type, this.status, this.isDeleted);
  factory Category.fromJson(Map<String, dynamic> json) =>
      _$CategoryFromJson(json);
  Map<String, dynamic> toJson() => _$CategoryToJson(this);
}
