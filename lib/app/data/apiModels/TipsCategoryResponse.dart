class TipsCategoryResponse {
  List<ShowDisorders>? showDisorders;

  TipsCategoryResponse({this.showDisorders});

  TipsCategoryResponse.fromJson(Map<String, dynamic> json) {
    if (json['show_disorders'] != null) {
      showDisorders = <ShowDisorders>[];
      json['show_disorders'].forEach((v) {
        showDisorders!.add(new ShowDisorders.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.showDisorders != null) {
      data['show_disorders'] =
          this.showDisorders!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ShowDisorders {
  int? disordersId;
  int? disordersType;
  String? name;
  String? icon;
  String? primary;
  int? status;
  String? createdAt;
  String? updatedAt;

  ShowDisorders(
      {this.disordersId,
        this.disordersType,
        this.name,
        this.icon,
        this.primary,
        this.status,
        this.createdAt,
        this.updatedAt});

  ShowDisorders.fromJson(Map<String, dynamic> json) {
    disordersId = json['disorders_id'];
    disordersType = json['disorders_type'];
    name = json['name'];
    icon = json['icon'];
    primary = json['primary'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['disorders_id'] = this.disordersId;
    data['disorders_type'] = this.disordersType;
    data['name'] = this.name;
    data['icon'] = this.icon;
    data['primary'] = this.primary;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
