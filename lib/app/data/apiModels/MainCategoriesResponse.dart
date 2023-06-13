import 'package:flutter/cupertino.dart';

class MainCategoriesResponse {
  ShowCategory? showCategory;

  MainCategoriesResponse({this.showCategory});

  MainCategoriesResponse.fromJson(Map<String, dynamic> json) {
    showCategory = json['show_category'] != null
        ? new ShowCategory.fromJson(json['show_category'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.showCategory != null) {
      data['show_category'] = this.showCategory!.toJson();
    }
    return data;
  }
}

class ShowCategory {
  List<Category>? category;

  ShowCategory({this.category});

  ShowCategory.fromJson(Map<String, dynamic> json) {
    if (json['category'] != null) {
      category = <Category>[];
      json['category'].forEach((v) {
        category!.add(new Category.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.category != null) {
      data['category'] = this.category!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Category {
  int? categoryId;
  String? categoryName;
  String? categoryInfo;
  int? status;
  String? parentType;
  String? categoryImage;
  String? createdAt;
  String? updatedAt;
  String? image;
  VoidCallback? onTap;

  String? get getImage => image;
  set setImage(String image) => this.image = image;

  get getOnTap => onTap;
  set setOnTap(VoidCallback onTap) => this.onTap = onTap;

  Category(
      {this.categoryId,
      this.categoryName,
      this.categoryInfo,
      this.status,
      this.parentType,
      this.categoryImage,
      this.createdAt,
      this.updatedAt      
      });



  Category.fromJson(Map<String, dynamic> json) {
    categoryId = json['category_id'];
    categoryName = json['category_name'];
    categoryInfo = json['category_info'];
    status = json['status'];
    parentType = json['parent_type'];
    categoryImage = json['category_image'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['category_id'] = this.categoryId;
    data['category_name'] = this.categoryName;
    data['category_info'] = this.categoryInfo;
    data['status'] = this.status;
    data['parent_type'] = this.parentType;
    data['category_image'] = this.categoryImage;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
