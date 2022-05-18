import 'package:hive_flutter/adapters.dart';

import '../../../../product/constants/hive_constants.dart';

part 'category_model.g.dart';

@HiveType(typeId: HiveConstants.noteTypeCategoryId)
class CategoryModel {
  @HiveField(0)
  int id;
  @HiveField(1)
  String category;
  @HiveField(2)
  int color;

  CategoryModel({
    required this.id,
    required this.category,
    required this.color,
  });
}
