// To parse this JSON data, do
//
//     final subCatWisdomModel = subCatWisdomModelFromJson(jsonString);

import 'dart:convert';

SubCatWisdomModel subCatWisdomModelFromJson(String str) => SubCatWisdomModel.fromJson(json.decode(str));

String subCatWisdomModelToJson(SubCatWisdomModel data) => json.encode(data.toJson());

class SubCatWisdomModel {
    List<ShowSubCategory>? showSubCategory;

    SubCatWisdomModel({
        this.showSubCategory,
    });

    factory SubCatWisdomModel.fromJson(Map<String, dynamic> json) => SubCatWisdomModel(
        showSubCategory: json["show_sub_category"] == null ? [] : List<ShowSubCategory>.from(json["show_sub_category"]!.map((x) => ShowSubCategory.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "show_sub_category": showSubCategory == null ? [] : List<dynamic>.from(showSubCategory!.map((x) => x.toJson())),
    };
}

class ShowSubCategory {
    int? categoryId;
    String? categoryName;
    String? categoryInfo;
    int? status;
    String? parentType;
    String? categoryImage;
    String? createdAt;
    String? updatedAt;

    ShowSubCategory({
        this.categoryId,
        this.categoryName,
        this.categoryInfo,
        this.status,
        this.parentType,
        this.categoryImage,
        this.createdAt,
        this.updatedAt,
    });

    factory ShowSubCategory.fromJson(Map<String, dynamic> json) => ShowSubCategory(
        categoryId: json["category_id"],
        categoryName: json["category_name"],
        categoryInfo: json["category_info"],
        status: json["status"],
        parentType: json["parent_type"],
        categoryImage: json["category_image"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
    );

    Map<String, dynamic> toJson() => {
        "category_id": categoryId,
        "category_name": categoryName,
        "category_info": categoryInfo,
        "status": status,
        "parent_type": parentType,
        "category_image": categoryImage,
        "created_at": createdAt,
        "updated_at": updatedAt,
    };
}
